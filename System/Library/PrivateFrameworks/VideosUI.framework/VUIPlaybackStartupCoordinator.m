@implementation VUIPlaybackStartupCoordinator

+ (void)initialize
{
  if (initialize_onceToken_10 != -1)
    dispatch_once(&initialize_onceToken_10, &__block_literal_global_111);
}

void __43__VUIPlaybackStartupCoordinator_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlaybackStartupCoordinator");
  v1 = (void *)sLogObject_18;
  sLogObject_18 = (uint64_t)v0;

}

+ (id)startupCoordinators
{
  if (startupCoordinators_onceToken != -1)
    dispatch_once(&startupCoordinators_onceToken, &__block_literal_global_84);
  return (id)startupCoordinators___coordinators;
}

void __52__VUIPlaybackStartupCoordinator_startupCoordinators__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)startupCoordinators___coordinators;
  startupCoordinators___coordinators = (uint64_t)v0;

}

+ (id)identifierForMediaInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "tvpPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "mediaItemURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (id)startupCoordinatorWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VUIPlaybackStartupCoordinator *v13;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "identifierForMediaInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "startupCoordinators");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "startupCoordinators");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v9);
      v13 = (VUIPlaybackStartupCoordinator *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      goto LABEL_7;
    }
  }
  v13 = -[VUIPlaybackStartupCoordinator initWithMediaInfo:watchType:isRentAndWatchNow:]([VUIPlaybackStartupCoordinator alloc], "initWithMediaInfo:watchType:isRentAndWatchNow:", v8, a4, v5);
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "startupCoordinators");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v9);
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (VUIPlaybackStartupCoordinator)initWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  id v9;
  VUIPlaybackStartupCoordinator *v10;
  VUIPlaybackStartupCoordinator *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  TVPStateMachine *stateMachine;
  objc_super v19;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIPlaybackStartupCoordinator;
  v10 = -[VUIPlaybackStartupCoordinator init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaInfo, a3);
    v11->_watchType = a4;
    v11->_isRentAndWatchNow = a5;
    v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v13 = objc_opt_class();
    v14 = initWithMediaInfo_watchType_isRentAndWatchNow__instanceNumber++;
    v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ %ld"), v13, v14);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v15, CFSTR("Waiting to start"), 0);
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (TVPStateMachine *)v16;

    -[TVPStateMachine setLogObject:](v11->_stateMachine, "setLogObject:", sLogObject_18);
    -[VUIPlaybackStartupCoordinator _registerStateMachineHandlers](v11, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v11->_stateMachine, "setShouldAcceptEvents:", 1);
    -[VUIPlaybackStartupCoordinator _registerGroupActivitiesNotification](v11, "_registerGroupActivitiesNotification");

  }
  return v11;
}

- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  return -[VUIPlaybackStartupCoordinator initWithAdamID:watchType:isRentAndWatchNow:contentMetadata:](self, "initWithAdamID:watchType:isRentAndWatchNow:contentMetadata:", a3, a4, a5, 0);
}

- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 contentMetadata:(id)a6
{
  id v11;
  id v12;
  VUIPlaybackStartupCoordinator *v13;
  VUIPlaybackStartupCoordinator *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TVPStateMachine *stateMachine;
  objc_super v22;

  v11 = a3;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VUIPlaybackStartupCoordinator;
  v13 = -[VUIPlaybackStartupCoordinator init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adamID, a3);
    v14->_watchType = a4;
    v14->_isRentAndWatchNow = a5;
    objc_storeStrong((id *)&v14->_contentMetadata, a6);
    v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v16 = objc_opt_class();
    v17 = initWithAdamID_watchType_isRentAndWatchNow_contentMetadata__instanceNumber++;
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@ %ld"), v16, v17);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v18, CFSTR("Waiting to start"), 0);
    stateMachine = v14->_stateMachine;
    v14->_stateMachine = (TVPStateMachine *)v19;

    -[VUIPlaybackStartupCoordinator _registerStateMachineHandlers](v14, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v14->_stateMachine, "setShouldAcceptEvents:", 1);
    -[VUIPlaybackStartupCoordinator _registerGroupActivitiesNotification](v14, "_registerGroupActivitiesNotification");

  }
  return v14;
}

- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7
{
  return -[VUIPlaybackStartupCoordinator initWithCanonicalID:showCanonicalID:mediaType:watchType:isRentAndWatchNow:contentMetadata:](self, "initWithCanonicalID:showCanonicalID:mediaType:watchType:isRentAndWatchNow:contentMetadata:", a3, a4, a5, a6, a7, 0);
}

- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7 contentMetadata:(id)a8
{
  id v15;
  id v16;
  id v17;
  VUIPlaybackStartupCoordinator *v18;
  VUIPlaybackStartupCoordinator *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  TVPStateMachine *stateMachine;
  id v27;
  objc_super v28;

  v27 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)VUIPlaybackStartupCoordinator;
  v18 = -[VUIPlaybackStartupCoordinator init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_videoCanonicalID, a3);
    objc_storeStrong((id *)&v19->_showCanonicalID, a4);
    objc_storeStrong((id *)&v19->_mediaType, a5);
    v19->_watchType = a6;
    v19->_isRentAndWatchNow = a7;
    objc_storeStrong((id *)&v19->_contentMetadata, a8);
    v20 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v21 = objc_opt_class();
    v22 = initWithCanonicalID_showCanonicalID_mediaType_watchType_isRentAndWatchNow_contentMetadata__instanceNumber++;
    v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ %ld"), v21, v22);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v23, CFSTR("Waiting to start"), 0);
    stateMachine = v19->_stateMachine;
    v19->_stateMachine = (TVPStateMachine *)v24;

    -[VUIPlaybackStartupCoordinator _registerStateMachineHandlers](v19, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v19->_stateMachine, "setShouldAcceptEvents:", 1);
    -[VUIPlaybackStartupCoordinator _registerGroupActivitiesNotification](v19, "_registerGroupActivitiesNotification");

  }
  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIPlaybackStartupCoordinator deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackStartupCoordinator;
  -[VUIPlaybackStartupCoordinator dealloc](&v4, sel_dealloc);
}

- (void)performPlaybackStartupFlowWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VUIPlaybackStartupCoordinator stateMachine](self, "stateMachine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = _Block_copy(v4);

  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Start"), v5, 0);
}

- (id)_descriptionForWatchType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E9FA1358[a3];
}

- (id)_descriptionForStartupAction:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E9FA1380[a3];
}

- (id)_addQueryParamsToSharedWatchURL:(id)a3 watchType:(int64_t)a4 groupActivityDay:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = v9;
  v11 = v9;
  if ((unint64_t)a4 <= 4)
  {
    v11 = v9;
    if (((1 << a4) & 0x19) != 0)
    {
      v11 = v9;
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v10, "vui_URLByAddingQueryParamWithName:value:", CFSTR("groupActivityDay"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  if (a4 == 4)
  {
    objc_msgSend(v11, "vui_URLByAddingQueryParamWithName:value:", CFSTR("postPlay"), CFSTR("true"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("false");
    v13 = v12;
  }
  else
  {
    if (a4 != 3)
      goto LABEL_10;
    objc_msgSend(v11, "vui_URLByAddingQueryParamWithName:value:", CFSTR("postPlay"), CFSTR("true"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    v14 = CFSTR("true");
  }
  objc_msgSend(v13, "vui_URLByAddingQueryParamWithName:value:", CFSTR("binge"), v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v15 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Shared watch URL after adding query params: %@", (uint8_t *)&v17, 0xCu);
  }

  return v11;
}

- (void)_addGroupActivityDayParamToPlayableAndMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    -[VUIPlaybackStartupCoordinator resolvedPlayable](self, "resolvedPlayable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_4;
    -[VUIPlaybackStartupCoordinator mediaInfo](self, "mediaInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videosPlayables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_4:
      objc_msgSend(v5, "hlsURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vui_URLByAddingQueryParamWithName:value:", CFSTR("groupActivityDay"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setHlsURL:", v9);
    }
    -[VUIPlaybackStartupCoordinator mediaInfo](self, "mediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tvpPlaylist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentMediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setMediaItemMetadata:forProperty:", v4, CFSTR("VUIContentMetadataGroupActivityDay"));
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
  {
    -[VUIPlaybackStartupCoordinator _addGroupActivityDayParamToPlayableAndMediaItem:].cold.1();
  }

}

- (void)_registerStateMachineHandlers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  VUIPlaybackStartupCoordinator *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  _QWORD v146[4];
  id v147;
  id v148;
  _QWORD aBlock[4];
  id v150;
  id location[2];

  objc_initWeak(location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2;
  aBlock[3] = &unk_1E9FA0E08;
  objc_copyWeak(&v150, location);
  v4 = _Block_copy(aBlock);
  v146[0] = v3;
  v146[1] = 3221225472;
  v146[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3;
  v146[3] = &unk_1E9FA0E80;
  objc_copyWeak(&v148, location);
  v5 = v4;
  v147 = v5;
  v6 = _Block_copy(v146);
  v143[0] = v3;
  v143[1] = 3221225472;
  v143[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_127;
  v143[3] = &unk_1E9FA0EF8;
  objc_copyWeak(&v145, location);
  v144 = &__block_literal_global_115;
  v7 = _Block_copy(v143);
  v141[0] = v3;
  v141[1] = 3221225472;
  v141[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_5;
  v141[3] = &unk_1E9FA0F48;
  objc_copyWeak(&v142, location);
  v66 = _Block_copy(v141);
  v139[0] = v3;
  v139[1] = 3221225472;
  v139[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_7;
  v139[3] = &unk_1E9FA0FD8;
  objc_copyWeak(&v140, location);
  v137[0] = v3;
  v137[1] = 3221225472;
  v137[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_10;
  v137[3] = &unk_1E9F9E5B8;
  v64 = _Block_copy(v139);
  v138 = v64;
  v68 = _Block_copy(v137);
  v135[0] = v3;
  v135[1] = 3221225472;
  v135[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_12;
  v135[3] = &unk_1E9FA1000;
  objc_copyWeak(&v136, location);
  v8 = _Block_copy(v135);
  v133[0] = v3;
  v133[1] = 3221225472;
  v133[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_13;
  v133[3] = &unk_1E9FA1050;
  objc_copyWeak(&v134, location);
  v9 = _Block_copy(v133);
  v127[0] = v3;
  v127[1] = 3221225472;
  v127[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_17;
  v127[3] = &unk_1E9FA10A0;
  objc_copyWeak(&v132, location);
  v10 = v7;
  v128 = v10;
  v11 = v6;
  v129 = v11;
  v12 = v8;
  v130 = v12;
  v13 = v9;
  v131 = v13;
  v14 = _Block_copy(v127);
  v124[0] = v3;
  v124[1] = 3221225472;
  v124[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_183;
  v124[3] = &unk_1E9FA0EF8;
  objc_copyWeak(&v126, location);
  v63 = v5;
  v125 = v63;
  v65 = _Block_copy(v124);
  v120[0] = v3;
  v120[1] = 3221225472;
  v120[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_203;
  v120[3] = &unk_1E9FA1110;
  objc_copyWeak(&v123, location);
  v121 = &__block_literal_global_193;
  v15 = v10;
  v122 = v15;
  v16 = _Block_copy(v120);
  v114[0] = v3;
  v114[1] = 3221225472;
  v114[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_207;
  v114[3] = &unk_1E9FA10A0;
  objc_copyWeak(&v119, location);
  v17 = v15;
  v115 = v17;
  v18 = v11;
  v116 = v18;
  v19 = v12;
  v117 = v19;
  v20 = v16;
  v118 = v20;
  v21 = _Block_copy(v114);
  v112[0] = v3;
  v112[1] = 3221225472;
  v112[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_208;
  v112[3] = &unk_1E9FA1050;
  objc_copyWeak(&v113, location);
  v22 = _Block_copy(v112);
  v69 = self;
  -[VUIPlaybackStartupCoordinator stateMachine](self, "stateMachine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v3;
  v104[1] = 3221225472;
  v104[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_212;
  v104[3] = &unk_1E9FA1160;
  objc_copyWeak(&v111, location);
  v24 = v14;
  v105 = v24;
  v25 = v19;
  v106 = v25;
  v26 = v20;
  v107 = v26;
  v27 = v13;
  v108 = v27;
  v28 = v21;
  v109 = v28;
  v29 = v17;
  v110 = v29;
  objc_msgSend(v23, "registerHandlerForEvent:onState:withBlock:", CFSTR("Start"), CFSTR("Waiting to start"), v104);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Start"), &__block_literal_global_215);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_217;
  v96[3] = &unk_1E9FA1160;
  objc_copyWeak(&v103, location);
  v32 = v25;
  v97 = v32;
  v33 = v26;
  v98 = v33;
  v61 = v22;
  v99 = v61;
  v62 = v27;
  v100 = v62;
  v34 = v29;
  v101 = v34;
  v35 = v18;
  v102 = v35;
  objc_msgSend(v31, "registerHandlerForEvent:onState:withBlock:", CFSTR("Attempt to start co-watching complete"), CFSTR("Attempting to start co-watching"), v96);
  v60 = v24;

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_218;
  v93[3] = &unk_1E9F9B898;
  objc_copyWeak(&v95, location);
  v38 = v35;
  v94 = v38;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Co-watch session handling complete"), CFSTR("Waiting for co-watch session to be handled"), v93);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v37;
  v87[1] = 3221225472;
  v87[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_223;
  v87[3] = &unk_1E9F9D870;
  objc_copyWeak(&v92, location);
  v40 = v32;
  v88 = v40;
  v41 = v33;
  v89 = v41;
  v42 = v68;
  v90 = v42;
  v43 = v38;
  v91 = v43;
  objc_msgSend(v39, "registerHandlerForEvent:onState:withBlock:", CFSTR("Share URL resolution complete"), CFSTR("Waiting for share URL for be resolved"), v87);
  v59 = v41;

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v37;
  v84[1] = 3221225472;
  v84[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_225;
  v84[3] = &unk_1E9F9B898;
  objc_copyWeak(&v86, location);
  v45 = v34;
  v85 = v45;
  objc_msgSend(v44, "registerHandlerForEvent:onState:withBlock:", CFSTR("Watch alone button pressed"), CFSTR("Asking whether to watch alone or cancel due to content being unavailable"), v84);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v37;
  v81[1] = 3221225472;
  v81[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_226;
  v81[3] = &unk_1E9F9B898;
  objc_copyWeak(&v83, location);
  v47 = v43;
  v82 = v47;
  objc_msgSend(v46, "registerHandlerForEvent:onState:withBlock:", CFSTR("Watch cancel button pressed"), CFSTR("Asking whether to watch alone or cancel due to content being unavailable"), v81);
  v58 = v40;

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v45;
  v57 = v42;
  v76[0] = v37;
  v76[1] = 3221225472;
  v76[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_227;
  v76[3] = &unk_1E9F9D9F8;
  objc_copyWeak(&v80, location);
  v67 = v66;
  v77 = v67;
  v49 = v47;
  v78 = v49;
  v50 = v65;
  v79 = v50;
  objc_msgSend(v48, "registerHandlerForEvent:onState:withBlock:", CFSTR("Preflight complete"), CFSTR("Performing preflight"), v76);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v37;
  v72[1] = 3221225472;
  v72[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_229;
  v72[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v75, location);
  v52 = v49;
  v73 = v52;
  v53 = v50;
  v74 = v53;
  objc_msgSend(v51, "registerHandlerForEvent:onState:withBlock:", CFSTR("Route selection complete"), CFSTR("Performing route selection"), v72);

  -[VUIPlaybackStartupCoordinator stateMachine](v69, "stateMachine");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_230;
  v70[3] = &unk_1E9F9BFC0;
  v55 = v52;
  v71 = v55;
  objc_msgSend(v54, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Preflight cancelled"), v70);

  objc_destroyWeak(&v75);
  objc_destroyWeak(&v80);

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v86);

  objc_destroyWeak(&v92);
  objc_destroyWeak(&v95);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v113);
  objc_destroyWeak(&v119);

  objc_destroyWeak(&v123);
  objc_destroyWeak(&v126);

  objc_destroyWeak(&v132);
  objc_destroyWeak(&v134);

  objc_destroyWeak(&v136);
  objc_destroyWeak(&v140);

  objc_destroyWeak(&v142);
  objc_destroyWeak(&v145);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&v150);
  objc_destroyWeak(location);
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fullScreenViewControllerForPresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
  {
    +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "controllerPresenter");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v1)
      {
        +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appWindow");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "rootViewController");
        v1 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v1;
}

VUIGroupWatchActivityPreviewMetadata *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIGroupWatchActivityPreviewMetadata *v11;
  void *v12;
  VUIGroupWatchActivityPreviewMetadata *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VUIGroupWatchActivityPreviewMetadata *v19;
  void *v20;
  void *v21;
  VUIGroupWatchActivityPreviewMetadata *v22;
  void *v23;
  void *v24;
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
  VUIGroupWatchActivityPreviewMetadata *v39;
  void *v40;
  uint64_t v41;
  void *v42;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resolvedPlayable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(WeakRetained, "mediaInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videosPlayables");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(WeakRetained, "mediaInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "videosPlayables");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = [VUIGroupWatchActivityPreviewMetadata alloc];
      objc_msgSend(v2, "sharedWatchUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[VUIGroupWatchActivityPreviewMetadata initWithPlayable:fallbackUrl:](v19, "initWithPlayable:fallbackUrl:", v2, v10);
      goto LABEL_9;
    }
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videosPlayables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "videosPlayables");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [VUIGroupWatchActivityPreviewMetadata alloc];
    objc_msgSend(v2, "sharedWatchUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIGroupWatchActivityPreviewMetadata initWithPlayable:fallbackUrl:](v11, "initWithPlayable:fallbackUrl:", v10, v12);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v7, "tvpPlaylist");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentMediaItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [VUIGroupWatchActivityPreviewMetadata alloc];
    objc_msgSend(WeakRetained, "mediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tvpPlaylist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentMediaItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sharedWatchUrl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIGroupWatchActivityPreviewMetadata initWithMediaItem:fallbackUrl:](v22, "initWithMediaItem:fallbackUrl:", v23, v24);

    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "contentMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "contentMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "vui_stringForKey:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "vui_stringForKey:", CFSTR("showTitle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "vui_numberForKey:", CFSTR("seasonNumber"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "vui_numberForKey:", CFSTR("episodeNumber"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vui_stringForKey:", CFSTR("artworkURL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", CFSTR("artworkImage"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "contentMetadata");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "vui_stringForKey:", CFSTR("mediaType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(v38, "isEqualToString:", CFSTR("Episode"));

  v39 = [VUIGroupWatchActivityPreviewMetadata alloc];
  objc_msgSend(v2, "sharedWatchUrl");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v41) = 1;
  LOBYTE(v41) = (_BYTE)v27;
  v13 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](v39, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v10, v42, 0, v30, v32, v34, v36, v40, v41);

LABEL_9:
LABEL_10:

  return v13;
}

const __CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3(uint64_t a1, char a2, char a3, char a4, char a5, char a6)
{
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4;
  v17[3] = &unk_1E9FA0E58;
  objc_copyWeak(&v19, v12);
  v18 = *(id *)(a1 + 32);
  v20 = a2;
  v21 = a3;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v17);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:", WeakRetained);

  objc_destroyWeak(&v19);
  return CFSTR("Startup flow complete");
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  __int16 v59;
  char v60;
  char v61;
  _QWORD block[5];
  id v63;
  id v64;
  __int16 v65;
  char v66;
  char v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  __int16 v72;
  char v73;
  char v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!*(_BYTE *)(a1 + 48) || !*(_BYTE *)(a1 + 49)) && !*(_BYTE *)(a1 + 50))
  {
    objc_msgSend(WeakRetained, "resolvedPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(WeakRetained, "mediaInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "videosPlayables");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupActivitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedWatchId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isSharedWatchIdValidForCurrentSession:", v9);

    if (v10)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupActivitiesManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startPlaybackFailed");

    }
    else
    {
      v13 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Not calling startPlaybackFailed since session ID no longer matches sharedWatchId being played", buf, 2u);
      }
    }

  }
  objc_msgSend(WeakRetained, "completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "mediaInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tvpPlaylist");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentMediaItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setIsGroupActivity:", *(unsigned __int8 *)(a1 + 49));
      if (*(_BYTE *)(a1 + 49))
        v20 = objc_msgSend(WeakRetained, "watchType") == 0;
      else
        v20 = 0;
      objc_msgSend(v19, "setIsGroupActivityOriginator:", v20);

    }
    objc_msgSend(WeakRetained, "mediaInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "videosPlayables");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(unsigned __int8 *)(a1 + 48);
      v38 = *(unsigned __int8 *)(a1 + 49);
      v39 = v3;
      v40 = *(unsigned __int8 *)(a1 + 51);
      v41 = v36;
      objc_msgSend(v35, "canonicalID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v76 = v37;
      v77 = 2048;
      v78 = v38;
      v79 = 2048;
      v80 = v40;
      v3 = v39;
      v81 = 2112;
      v82 = v42;
      v83 = 2112;
      v84 = v35;
      _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_DEFAULT, "Calling mediaInfo performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, canonicalID = %@, playable = %@", buf, 0x34u);

    }
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_122;
    v68[3] = &unk_1E9FA0E30;
    v43 = v14;
    v72 = *(_WORD *)(a1 + 48);
    v73 = *(_BYTE *)(a1 + 52);
    v74 = *(_BYTE *)(a1 + 51);
    v71 = v43;
    v69 = v35;
    v70 = v3;
    v32 = v35;
    dispatch_async(MEMORY[0x1E0C80D38], v68);

  }
  else
  {
    objc_msgSend(WeakRetained, "videoCanonicalID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)sLogObject_18;
    v23 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        v24 = v3;
        v25 = *(unsigned __int8 *)(a1 + 48);
        v26 = *(unsigned __int8 *)(a1 + 49);
        v27 = *(unsigned __int8 *)(a1 + 51);
        v28 = v22;
        objc_msgSend(WeakRetained, "videoCanonicalID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "resolvedPlayable");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v76 = v25;
        v3 = v24;
        v77 = 2048;
        v78 = v26;
        v79 = 2048;
        v80 = v27;
        v81 = 2112;
        v82 = v29;
        v83 = 2112;
        v84 = v30;
        _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "Calling canonicalID performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, canonicalID = %@, playable = %@", buf, 0x34u);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_123;
      block[3] = &unk_1E9FA0E30;
      v31 = v14;
      v65 = *(_WORD *)(a1 + 48);
      v66 = *(_BYTE *)(a1 + 52);
      v67 = *(_BYTE *)(a1 + 51);
      v64 = v31;
      block[4] = WeakRetained;
      v63 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v32 = v64;
    }
    else
    {
      if (v23)
      {
        v48 = v3;
        v49 = *(unsigned __int8 *)(a1 + 48);
        v50 = *(unsigned __int8 *)(a1 + 49);
        v51 = *(unsigned __int8 *)(a1 + 51);
        v52 = v22;
        objc_msgSend(WeakRetained, "adamID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "resolvedPlayable");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v76 = v49;
        v3 = v48;
        v77 = 2048;
        v78 = v50;
        v79 = 2048;
        v80 = v51;
        v81 = 2112;
        v82 = v53;
        v83 = 2112;
        v84 = v54;
        _os_log_impl(&dword_1D96EE000, v52, OS_LOG_TYPE_DEFAULT, "Calling adamID performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, adamID = %@, playable = %@", buf, 0x34u);

      }
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_124;
      v56[3] = &unk_1E9FA0E30;
      v55 = v14;
      v59 = *(_WORD *)(a1 + 48);
      v60 = *(_BYTE *)(a1 + 52);
      v61 = *(_BYTE *)(a1 + 51);
      v58 = v55;
      v56[4] = WeakRetained;
      v57 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v56);

      v32 = v58;
    }
  }

  v44 = (void *)objc_opt_class();
  objc_msgSend(WeakRetained, "mediaInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "identifierForMediaInfo:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v46, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "startupCoordinators");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectForKey:", v46);

  }
  objc_msgSend(WeakRetained, "setCompletion:", 0);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_122(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(unsigned __int8 *)(a1 + 58);
  v6 = *(unsigned __int8 *)(a1 + 59);
  objc_msgSend(*(id *)(a1 + 32), "canonicalID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_123(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(unsigned __int8 *)(a1 + 58);
  v6 = *(unsigned __int8 *)(a1 + 59);
  objc_msgSend(*(id *)(a1 + 32), "videoCanonicalID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolvedPlayable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, _QWORD))(v2 + 16))(v2, v3, v4, v5, v6, v8, v7, *(_QWORD *)(a1 + 40));

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_124(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(unsigned __int8 *)(a1 + 58);
  v6 = *(unsigned __int8 *)(a1 + 59);
  objc_msgSend(*(id *)(a1 + 32), "adamID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolvedPlayable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, _QWORD))(v2 + 16))(v2, v3, v4, v5, v6, v8, v7, *(_QWORD *)(a1 + 40));

}

const __CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_127(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tvpPlaylist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPresentingViewController:", v8);
  objc_msgSend(WeakRetained, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_128;
  v14[3] = &unk_1E9FA0ED0;
  v15 = v7;
  v16 = WeakRetained;
  v17 = v6;
  v18 = v8;
  v19 = a2;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v14);

  return CFSTR("Performing preflight");
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_128(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addStartEventWithName:isUIInteraction:", CFSTR("showingPreflightUI"), 1);

  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4_129;
  v8[3] = &unk_1E9FA0EA8;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8[4] = v3;
  v8[5] = v6;
  return objc_msgSend(v3, "_preflightPlaybackWithPlaylist:presentingViewController:completionHandler:", v4, v5, v8);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4_129(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("CoWatchActionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = CFSTR("AllowedToPlayKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  v11[2] = CFSTR("AllowCellularUsageKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Preflight complete"), 0, v10);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tvpPlaylist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addStartEventWithName:isUIInteraction:", CFSTR("showingAirplayPickerUI"), 1);

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_6;
  v12[3] = &unk_1E9FA0F20;
  v14 = WeakRetained;
  v15 = a2;
  v16 = a3;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "prepareRouteSelectionForPlaybackWithCompletionHandler:", v12);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEndEventWithName:", CFSTR("showingAirplayPickerUI"));

  v10[0] = CFSTR("CoWatchActionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("AllowedToPlayKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("AllowCellularUsageKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Route selection complete"), 0, v8);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_8;
  v17 = &unk_1E9FA0FB0;
  v10 = v7;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  objc_copyWeak(&v21, (id *)(a1 + 32));
  v13 = &v14;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v14, v15))
    v16((uint64_t)v13);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v21);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", *(_QWORD *)(a1 + 48), 0, &__block_literal_global_140);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vui_addAction:", v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v8, "vui_presentAlertFromPresentingController:animated:completion:", v7, 1, 0);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_11;
  v8 = &unk_1E9F99D58;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = v3;
  if (objc_msgSend(v4, "isMainThread", v6[0], 3221225472))
    v7((uint64_t)v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v16 = v3;
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorTitle"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_stringForKey:", CFSTR("message"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorMessage"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_stringForKey:", CFSTR("primaryActionTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("TV.GroupActivities.UnknownErrorAction"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupActivitiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "resolvedPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(WeakRetained, "mediaInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "videosPlayables");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(WeakRetained, "mediaInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tvpPlaylist");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentMediaItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
        {
          v7 = 2;
        }
        else if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
        {
          v7 = 2;
        }
        else
        {
          v7 = 1;
        }

        v4 = 0;
        goto LABEL_23;
      }
    }
    if ((objc_msgSend(v4, "isCowatchingProhibited") & 1) == 0
      && (!objc_msgSend(v4, "useSharedPlayableForCowatching")
       || objc_msgSend(v4, "containsEligiblePlaybackMode")))
    {
      objc_msgSend(v4, "sharedWatchUrl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

LABEL_14:
        v7 = 0;
        goto LABEL_23;
      }
      if ((objc_msgSend(v4, "useSharedPlayableForCowatching") & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v4, "adamID");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(v4, "isFamilySharingContent");

        if (v14)
          v7 = 1;
        else
          v7 = 2;
        goto LABEL_23;
      }
    }
    v7 = 2;
LABEL_23:

    goto LABEL_24;
  }
  v7 = 2;
LABEL_24:

  return v7;
}

const __CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  id *v1;
  id WeakRetained;
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
  const __CFString *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42[2];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tvpPlaylist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addStartEventWithName:isUIInteraction:", CFSTR("askingUserToWatchAloneOrCancel"), 1);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("TV.GroupActivities.SharePlayNotAvailableErrorTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "videosPlayables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cowatchingProhibitedReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tvpPlaylist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = WeakRetained;
  v34 = v15;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("extras")))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("TV.GroupActivities.ExtrasErrorMessage");
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("live")))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("TV.GroupActivities.LiveTVErrorMessage");
  }
  else if (objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("TV.GroupActivities.HomeSharingErrorMessage");
  }
  else
  {
    v19 = objc_msgSend(v15, "isMemberOfClass:", objc_opt_class());
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v19)
      v18 = CFSTR("TV.GroupActivities.SyncedVideosErrorMessage");
    else
      v18 = CFSTR("TV.GroupActivities.SharePlayNotAvailableErrorMessage");
  }
  objc_msgSend(v16, "localizedStringForKey:", v18);
  v20 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:", CFSTR("TV.GroupActivities.WatchAloneTitle"));
  v22 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:", CFSTR("TV.GroupActivities.WatchAloneCancel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)v20;
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v8, v20, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_14;
  v41[3] = &unk_1E9FA1028;
  objc_copyWeak(v42, v1);
  v32 = (void *)v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v22, 0, v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "vui_addAction:isPreferred:", v27, 1);
  v39[0] = v26;
  v39[1] = 3221225472;
  v39[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_15;
  v39[3] = &unk_1E9FA1028;
  objc_copyWeak(&v40, v1);
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v24, 0, v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "vui_addAction:", v28);
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentedViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_16;
    v36[3] = &unk_1E9F98FD8;
    v37 = v25;
    v38 = v29;
    +[VUIApplicationRouter dismissOrPopLastViewControllerWithCompletion:](VUIApplicationRouter, "dismissOrPopLastViewControllerWithCompletion:", v36);

  }
  else
  {
    objc_msgSend(v25, "vui_presentAlertFromPresentingController:animated:completion:", v29, 1, 0);
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(v42);

  return CFSTR("Asking whether to watch alone or cancel due to content being unavailable");
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Watch alone button pressed"));

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Watch cancel button pressed"));

}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "vui_presentAlertFromPresentingController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  _QWORD v25[5];
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupActivitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEligibleForSession");

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupActivitiesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (v5 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "mediaInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = sLogObject_18;
    v13 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = v12;
        +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "groupActivitiesManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("isEligibleForSession is false");
        if (!v16)
          v17 = CFSTR("groupActivitiesManager is nil");
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "%@.  Performing preflight", buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Missing mediaInfo, allow local playback", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  v8 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "groupActivitiesManager is available.  Attempting to start co-watching", buf, 2u);
  }
  if ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() == 2)
  {
    v9 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but not possible.  Showing error", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v23 = (__CFString *)v10;
    goto LABEL_20;
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tvpPlaylist");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentMediaItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addStartEventWithName:isUIInteraction:", CFSTR("askingUserToCoWatch"), 1);

  objc_msgSend(WeakRetained, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_174;
  v25[3] = &unk_1E9F98DF0;
  v25[4] = WeakRetained;
  objc_msgSend(v22, "executeBlockAfterCurrentStateTransition:", v25);

  v23 = CFSTR("Attempting to start co-watching");
LABEL_20:

  return v23;
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_174(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  objc_msgSend(*(id *)(a1 + 32), "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videosPlayables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedPlayable");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupActivitiesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_175;
  v10[3] = &unk_1E9FA1078;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "requestPermissionToStartCowatchingForPlayable:completion:", v7, v10);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_175(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("VUIGroupActivityPlaybackStateDoNotPlay");
    if (a2 == 1)
      v5 = CFSTR("VUIGroupActivityPlaybackStatePlayWithoutSession");
    if (!a2)
      v5 = CFSTR("VUIGroupActivityPlaybackStatePlayWithSession");
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Ask to co-watch complete.  VUIGroupActivityPlaybackState is %@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Attempt to start co-watching complete"), v7, 0);

}

const __CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_183(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
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
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "resolvedPlayable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(WeakRetained, "mediaInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videosPlayables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("PreviewMetadataKey"));
  objc_msgSend(WeakRetained, "mediaInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tvpPlaylist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentMediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addStartEventWithName:isUIInteraction:", CFSTR("waitingToActivateOrJoinSession"), 1);

  v14 = (void *)sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(WeakRetained, "_descriptionForStartupAction:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v16;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Performing co-watch action: %@", buf, 0xCu);

  }
  objc_msgSend(v5, "sharedWatchUrl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    v19 = objc_msgSend(v5, "useSharedPlayableForCowatching");
    v20 = sLogObject_18;
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Passing shared playable to GroupActivitiesManager", buf, 2u);
      }
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "groupActivitiesManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_189;
      v41[3] = &unk_1E9F9D150;
      objc_copyWeak(&v43, v3);
      v42 = v9;
      objc_msgSend(v22, "handleSharedPlayable:watchTogetherUrl:startupAction:previewMetadata:completion:", v5, 0, a2, v8, v41);

      objc_destroyWeak(&v43);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_183_cold_1();
      objc_msgSend(WeakRetained, "stateMachine");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_190;
      v39[3] = &unk_1E9F98FD8;
      v39[4] = WeakRetained;
      v40 = v9;
      objc_msgSend(v36, "executeBlockAfterCurrentStateTransition:", v39);

    }
  }
  else
  {
    if (objc_msgSend(WeakRetained, "watchType") == 1)
    {
      objc_msgSend(v5, "groupActivityDay");
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "vui_startOfDateInGMT:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSince1970");
      v27 = v26;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (uint64_t)(v27 * 1000.0));
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v28;
      _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "groupActivityDay: %@", buf, 0xCu);
    }
    objc_msgSend(v5, "sharedWatchUrl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_addQueryParamsToSharedWatchURL:watchType:groupActivityDay:", v30, objc_msgSend(WeakRetained, "watchType"), v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "Passing shared watch URL to GroupActivitiesManager", buf, 2u);
    }
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "groupActivitiesManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_188;
    v44[3] = &unk_1E9FA10C8;
    objc_copyWeak(&v47, v3);
    v35 = v28;
    v45 = v35;
    v46 = v9;
    objc_msgSend(v34, "handleSharedPlayable:watchTogetherUrl:startupAction:previewMetadata:completion:", v5, v31, a2, v8, v44);

    objc_destroyWeak(&v47);
  }

  return CFSTR("Waiting for co-watch session to be handled");
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_188(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (!a2)
  {
    objc_msgSend(WeakRetained, "_addGroupActivityDayParamToPlayableAndMediaItem:", *(_QWORD *)(a1 + 32));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Co-watch session handling complete"), v6, v7);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_189(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Co-watch session handling complete"), v5, v6);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_190(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "postEvent:withContext:userInfo:", CFSTR("Co-watch session handling complete"), &unk_1EA0B9CD0, v2);

}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_192()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC8980];
  v8[0] = *MEMORY[0x1E0DC8978];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0DC8998];
  v9[0] = &unk_1EA0B9CE8;
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E0DC8970];
  v9[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC87E0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("TV.GroupActivities.CannotShareDownloadTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("TV.GroupActivities.CannotShareDownloadMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "post:title:body:options:", CFSTR("DownloadWillBeStreamedNotificationIdentifier"), v5, v7, v2);

}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_203(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  __int16 v14;
  uint8_t buf[16];
  __int16 v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tvpPlaylist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasTrait:", *MEMORY[0x1E0DB1D68]))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("AllowCoWatchingOfDownload"));

    v8 = sLogObject_18;
    v9 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v16 = 0;
        v10 = "Content is downloaded, but user defaults allows for co-watching download. Performing preflight";
        v11 = (uint8_t *)&v16;
LABEL_7:
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Content is downloaded.  Showing download will be streamed dialog", buf, 2u);
      }
      objc_msgSend(WeakRetained, "setForceDownloadToStream:", 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v8 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v10 = "Content is not local, performing preflight";
      v11 = (uint8_t *)&v14;
      goto LABEL_7;
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_207(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  __int16 v18;
  uint8_t v19[16];
  uint8_t buf[16];
  __int16 v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupActivitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupActivitiesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSessionActive");

    if (v7)
    {
      v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v9 = sLogObject_18;
      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Replacing item being watched, co-watching of next item is possible", v19, 2u);
        }
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_207_cold_1();
LABEL_12:
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
LABEL_13:
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v11 = sLogObject_18;
    if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v18 = 0;
    v13 = "Replacing item being watched, but no co-watching session is active.  Performing preflight of next media item to watch solo";
    v14 = (uint8_t *)&v18;
LABEL_11:
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = sLogObject_18;
  v12 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12)
      goto LABEL_12;
    v21 = 0;
    v13 = "Replacing item being watched, groupActivitiesManager is nil.  Performing preflight of next media item";
    v14 = (uint8_t *)&v21;
    goto LABEL_11;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Replacing item being watched, missing mediaInfo, allow local playback", buf, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v16 = (void *)v15;

  return v16;
}

const __CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_208(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  __CFString *v29;
  _QWORD aBlock[4];
  id v31;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tvpPlaylist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addStartEventWithName:isUIInteraction:", CFSTR("waitingForShareURLToBeResolved"), 1);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_209;
  aBlock[3] = &unk_1E9FA1138;
  objc_copyWeak(&v31, v1);
  v7 = _Block_copy(aBlock);
  v8 = CFSTR("Invalid");
  objc_msgSend(WeakRetained, "mediaInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v29 = v8;
    v28 = v7;
    objc_msgSend(WeakRetained, "mediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tvpPlaylist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentMediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DD0]) & 1) != 0)
    {
      v14 = VUIPlayableMediaTypeMovie;
    }
    else
    {
      v25 = *MEMORY[0x1E0DB1DD8];
      if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DD8]) & 1) != 0
        || (objc_msgSend(v13, "isEqualToString:", v25) & 1) != 0)
      {
        v14 = VUIPlayableMediaTypeShow;
      }
      else
      {
        if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DE0]) & 1) == 0
          && !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DC8]))
        {
LABEL_6:
          objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            objc_msgSend(WeakRetained, "mediaInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "videosPlayables");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "firstObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "adamID");
            v20 = (id)objc_claimAutoreleasedReturnValue();

          }
          v7 = v28;
          v8 = v29;
          goto LABEL_12;
        }
        v14 = VUIPlayableMediaTypeTrailer;
      }
    }
    v15 = *v14;

    v29 = v15;
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "videoCanonicalID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(WeakRetained, "adamID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v16 = 0;
      v20 = 0;
      v17 = 0;
      goto LABEL_22;
    }
    objc_msgSend(WeakRetained, "adamID");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(WeakRetained, "videoCanonicalID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "showCanonicalID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaType");
  v20 = 0;
  v12 = v8;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  if (v16)
  {
    +[VUIPlayableResolver playableForCanonicalID:showID:mediaType:completion:](VUIPlayableResolver, "playableForCanonicalID:showID:mediaType:completion:", v16, v17, v8, v7);
    goto LABEL_22;
  }
LABEL_19:
  if (v20)
    +[VUIPlayableResolver playableForAdamID:completion:](VUIPlayableResolver, "playableForAdamID:completion:", v20, v7);
  v16 = 0;
LABEL_22:

  objc_destroyWeak(&v31);
  return CFSTR("Waiting for share URL for be resolved");
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_209(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v16)
  {
    objc_msgSend(WeakRetained, "mediaInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tvpPlaylist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentMediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v16;
    if (v10)
    {
      objc_msgSend(v16, "sharedWatchId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v12, *MEMORY[0x1E0DB1BB8]);

      objc_msgSend(v16, "showCanonicalID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v13, *MEMORY[0x1E0DB1C60]);

      objc_msgSend(v16, "canonicalID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v14, *MEMORY[0x1E0DB1A08]);

      v11 = v16;
    }
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("ResolvedPlayableKey"));

  }
  if (v5)
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("ErrorKey"));
  objc_msgSend(WeakRetained, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postEvent:withContext:userInfo:", CFSTR("Share URL resolution complete"), 0, v7);

}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_212(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void (*v19)(void);
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 10);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = _Block_copy(v6);

  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(WeakRetained, "setCompletion:", v9);

  v10 = (void *)sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(WeakRetained, "_descriptionForWatchType:", objc_msgSend(WeakRetained, "watchType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v12;
    v24 = 2048;
    v25 = objc_msgSend(WeakRetained, "isRentAndWatchNow");
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Performing playback startup flow with watch type %@, isRentAndWatchNow %ld", (uint8_t *)&v22, 0x16u);

  }
  v13 = objc_msgSend(WeakRetained, "watchType");
  if ((unint64_t)(v13 - 3) < 2)
  {
    v14 = a1[8];
    goto LABEL_12;
  }
  if (v13 == 1)
  {
    v15 = (*(uint64_t (**)(void))(a1[5] + 16))();
    v16 = sLogObject_18;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_212_cold_1();
      v14 = a1[7];
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Watch type is Join, and co-watching is possible.", (uint8_t *)&v22, 2u);
    }
    v19 = *(void (**)(void))(a1[6] + 16);
LABEL_19:
    v19();
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v13)
  {
    v18 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Watch type is Solo.  Performing preflight", (uint8_t *)&v22, 2u);
    }
    v19 = *(void (**)(void))(a1[9] + 16);
    goto LABEL_19;
  }
  v14 = a1[4];
LABEL_12:
  (*(void (**)(void))(v14 + 16))();
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
  v20 = (void *)v17;

  return v20;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_214(uint64_t a1, void *a2, uint64_t a3, const void *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = _Block_copy(a4);
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
    __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_214_cold_1();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_216;
  v10[3] = &unk_1E9F98E68;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "executeBlockAfterCurrentStateTransition:", v10);
  objc_msgSend(v5, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_216(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0, 0, 0, 0, 0);
  return result;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_217(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void (*v17)(void);
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 10);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  v9 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("VUIGroupActivityPlaybackStateDoNotPlay");
    if (v8 == 1)
      v10 = CFSTR("VUIGroupActivityPlaybackStatePlayWithoutSession");
    if (!v8)
      v10 = CFSTR("VUIGroupActivityPlaybackStatePlayWithSession");
    v26 = 138412290;
    v27 = v10;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "After asking to co-watch, VUIGroupActivityPlaybackState is %@", (uint8_t *)&v26, 0xCu);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tvpPlaylist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEndEventWithName:", CFSTR("askingUserToCoWatch"));

  if (v8 == 1)
  {
    v18 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Co-watching is either not desired or no session is in progress.  Performing preflight", (uint8_t *)&v26, 2u);
    }
    v17 = *(void (**)(void))(a1[8] + 16);
    goto LABEL_17;
  }
  if (!v8)
  {
    v15 = (*(uint64_t (**)(void))(a1[4] + 16))();
    if (v15 == 1)
    {
      v21 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but requires share URL to be resolved.  Performing resolution", (uint8_t *)&v26, 2u);
      }
      v22 = a1[6];
    }
    else
    {
      if (!v15)
      {
        v16 = sLogObject_18;
        if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Co-watching is possible and desired.  Will activate session after preflight", (uint8_t *)&v26, 2u);
        }
        v17 = *(void (**)(void))(a1[5] + 16);
LABEL_17:
        v17();
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      v23 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but not possible.  Showing error", (uint8_t *)&v26, 2u);
      }
      v22 = a1[7];
    }
    (*(void (**)(void))(v22 + 16))();
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v20 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "No playback of any kind is desired.  Disallowing playback", (uint8_t *)&v26, 2u);
  }
  (*(void (**)(void))(a1[9] + 16))();
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_28:
  v24 = (void *)v19;

  return v24;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_218(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  v9 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("VUIGroupActivityPlaybackStateDoNotPlay");
    if (v8 == 1)
      v10 = CFSTR("VUIGroupActivityPlaybackStatePlayWithoutSession");
    if (!v8)
      v10 = CFSTR("VUIGroupActivityPlaybackStatePlayWithSession");
    v19 = 138412290;
    v20 = v10;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Co-watch handling complete.  VUIGroupActivityPlaybackState is %@", (uint8_t *)&v19, 0xCu);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tvpPlaylist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEndEventWithName:", CFSTR("waitingToActivateOrJoinSession"));

  v15 = sLogObject_18;
  if (v8 == 2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
      __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_218_cold_1();
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("without");
      if (!v8)
        v16 = CFSTR("with");
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "GroupActivitiesManager indicates it will play %@ co-watching.  Finishing startup flow", (uint8_t *)&v19, 0xCu);
    }
    (*(void (**)(_QWORD, uint64_t, BOOL, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, v8 == 0, objc_msgSend(WeakRetained, "forceDownloadToStream"), objc_msgSend(WeakRetained, "isCellularAllowed"), 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_223(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  VUIContentMetadata *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v42;
  VUIContentMetadata *v43;
  _QWORD *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v5 = (_QWORD *)a1;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = (id *)(a1 + 64);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("ResolvedPlayableKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ErrorKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v9;
    v47 = 2112;
    v48 = v10;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Share URL resolution complete.  Resolved playable is %@, error is %@", buf, 0x16u);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tvpPlaylist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentMediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DB1D28];
  objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEndEventWithName:", CFSTR("waitingForShareURLToBeResolved"));

  if (v9)
  {
    objc_msgSend(WeakRetained, "setResolvedPlayable:", v9);
    objc_msgSend(WeakRetained, "contentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(WeakRetained, "contentMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = [VUIContentMetadata alloc];
      objc_msgSend(v18, "vui_stringForKey:", CFSTR("title"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_stringForKey:", CFSTR("showTitle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_stringForKey:", CFSTR("seasonTitle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_numberForKey:", CFSTR("seasonNumber"));
      v44 = v5;
      v21 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_numberForKey:", CFSTR("episodeNumber"));
      v23 = WeakRetained;
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_URLForKey:", CFSTR("artworkURL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[VUIContentMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:artworkURL:](v43, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:artworkURL:", v42, v19, v20, v22, v25, v26);

      v10 = v24;
      WeakRetained = v23;

      v9 = v21;
      v5 = v44;

      objc_msgSend(v23, "resolvedPlayable");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMetadata:", v27);

    }
    v29 = (*(uint64_t (**)(void))(v5[4] + 16))();
    v30 = sLogObject_18;
    v31 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Co-watching is not possible after resolving share URL.   Ask whether content should be watched alone or not at all", buf, 2u);
      }
      (*(void (**)(void))(v5[6] + 16))();
      (*(void (**)(void))(v5[7] + 16))();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Co-watching is possible based on metadata after resolving share URL.  Will activate session after preflight", buf, 2u);
      }
      (*(void (**)(void))(v5[5] + 16))();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v40 = (__CFString *)v32;
  }
  else
  {
    v33 = v5;
    v34 = v10;
    v35 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "Unable to resolve share URL.  Ask whether content should be watched alone or not at all", buf, 2u);
    }
    objc_msgSend(WeakRetained, "mediaInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "tvpPlaylist");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "currentMediaItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "mediaItemMetadataForProperty:", v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addStartEventWithName:isUIInteraction:", CFSTR("askingUserToWatchAloneOrCancel"), 1);

    v10 = v34;
    (*(void (**)(void))(v33[6] + 16))();
    v40 = CFSTR("Asking whether to watch alone or cancel due to content being unavailable");
  }

  return v40;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_225(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Watch alone selected, performing preflight", v10, 2u);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvpPlaylist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEndEventWithName:", CFSTR("askingUserToWatchAloneOrCancel"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_226(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Cancel watching selected, not allowing playback", v10, 2u);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvpPlaylist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEndEventWithName:", CFSTR("askingUserToWatchAloneOrCancel"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_227(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (id *)(a1 + 56);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("CoWatchActionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("AllowedToPlayKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("AllowCellularUsageKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  objc_msgSend(WeakRetained, "setIsCellularAllowed:", v14);
  v15 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v29 = v12;
    v30 = 2048;
    v31 = v14;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Preflight complete.  allowedToPlay == %ld, allowCellularUsage == %ld", buf, 0x16u);
  }
  objc_msgSend(WeakRetained, "mediaInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tvpPlaylist");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentMediaItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addEndEventWithName:", CFSTR("showingPreflightUI"));

  if (v12)
  {
    if (objc_msgSend(WeakRetained, "watchType") != 3 && objc_msgSend(WeakRetained, "watchType") != 4)
    {
      objc_msgSend(WeakRetained, "stateMachine");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_228;
      v24[3] = &unk_1E9FA11A8;
      v25 = *(id *)(a1 + 32);
      v26 = v10;
      v27 = v14;
      objc_msgSend(v23, "executeBlockAfterCurrentStateTransition:", v24);

      v21 = CFSTR("Performing route selection");
      goto LABEL_12;
    }
    if (v10 != 3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, objc_msgSend(WeakRetained, "forceDownloadToStream"), v14, 0);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0);
  }
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v21 = (__CFString *)v20;
LABEL_12:

  return v21;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_229(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (id *)(a1 + 48);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("CoWatchActionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("AllowedToPlayKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("AllowCellularUsageKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  if (v12)
  {
    if (v10 != 3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, 0, objc_msgSend(WeakRetained, "forceDownloadToStream"), v14, 0);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0);
  }
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v16 = (void *)v15;

  return v16;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_230(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_preflightPlaybackWithPlaylist:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  id v37;
  unsigned int v38;
  id v39;
  _QWORD v40[4];
  __CFString *v41;
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  _QWORD aBlock[4];
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id location;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v39 = a4;
  v9 = a5;
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPlaylistBeingPresented:", v8);

  if (!v11)
  {
    objc_msgSend(v8, "currentMediaItem");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v14;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Performing preflight for media item %@", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke;
    aBlock[3] = &unk_1E9FA1270;
    objc_copyWeak(&v51, &location);
    v13 = v14;
    v48 = v13;
    v37 = v39;
    v49 = v37;
    v50 = v9;
    v16 = _Block_copy(aBlock);
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentMediaItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[VUIPlaybackStartupCoordinator _existingPlaybackSessionAllowsCellular](self, "_existingPlaybackSessionAllowsCellular");
    if (v19)
    {
      v38 = 1;
    }
    else
    {
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v20, "cellularDataPlaybackEnabled");

    }
    v21 = (id)sLogObject_18;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v19)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "cellularDataPlaybackEnabled"))
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v54 = v22;
      v55 = 2112;
      v56 = v24;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "existingPlaybackSessionAllowsCellular: %@, cellularDataPlaybackEnabled: %@", buf, 0x16u);

    }
    if (v18 && objc_msgSend(v18, "isEqualToMediaItem:", v13))
      goto LABEL_36;
    v25 = -[__CFString hasTrait:](v13, "hasTrait:", *MEMORY[0x1E0DB1D68]);
    if (-[VUIPlaybackStartupCoordinator forceDownloadToStream](self, "forceDownloadToStream"))
    {
      v26 = sLogObject_18;
      v25 = 0;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "Treating downloaded video as streaming during preflight", buf, 2u);
        v25 = 0;
      }
    }
    if (-[VUIPlaybackStartupCoordinator _shouldPromptForExpiredDownload:](self, "_shouldPromptForExpiredDownload:", v13))
    {
      -[__CFString mediaItemMetadataForProperty:](v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B80]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intValue");

      if (v28 != 2)
        -[VUIPlaybackStartupCoordinator _showAlertControllerForExpirationPromptForDownload:presentingViewController:](self, "_showAlertControllerForExpirationPromptForDownload:presentingViewController:", v13, v37);
      v29 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Preflight disallowed playback because download is expired", buf, 2u);
      }
      (*((void (**)(void *, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
      goto LABEL_37;
    }
    if (v25)
    {
      v30 = sLogObject_18;
      if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:
        (*((void (**)(void *, uint64_t, _QWORD))v16 + 2))(v16, 1, v38);
LABEL_37:

        objc_destroyWeak(&v51);
        objc_destroyWeak(&location);
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v31 = "Preflight allowing playback because content is downloaded";
    }
    else
    {
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "networkStatus") == 1;

      if (!v33)
      {
        +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "networkStatus") == 0;

        if (v35)
        {
          v36 = sLogObject_18;
          if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "Preflight disallowing streaming playback because no network is available", buf, 2u);
          }
          -[VUIPlaybackStartupCoordinator _presentCantPlaybackOverCellularAlertControllerWithMediaItem:presentingViewController:completionHandler:](self, "_presentCantPlaybackOverCellularAlertControllerWithMediaItem:presentingViewController:completionHandler:", v13, v37, 0);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_241;
          block[3] = &unk_1E9F98E68;
          v46 = v16;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        else
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_242;
          v40[3] = &unk_1E9FA12C0;
          objc_copyWeak(&v44, &location);
          v43 = v16;
          v41 = v13;
          v42 = v37;
          -[VUIPlaybackStartupCoordinator _checkIfAllowedToPlayOnCellularNetworkWithMediaItem:presentingController:completion:](self, "_checkIfAllowedToPlayOnCellularNetworkWithMediaItem:presentingController:completion:", v41, v42, v40);

          objc_destroyWeak(&v44);
        }
        goto LABEL_37;
      }
      v30 = sLogObject_18;
      if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v31 = "Preflight allowing streaming playback because network is WiFi";
    }
    _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_36;
  }
  v12 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Skipping preflight since this playlist is already being presented.  Using existing value for allowing cellular", buf, 2u);
  }
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, -[__CFString currentPlaylistAllowsCellular](v13, "currentPlaylistAllowsCellular"));
LABEL_38:

}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke(id *a1, int a2, char a3)
{
  id *v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v6 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (a2)
  {
    v8 = a1[4];
    v9 = a1[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2;
    v10[3] = &unk_1E9FA1248;
    objc_copyWeak(&v14, v6);
    v11 = a1[4];
    v12 = a1[5];
    v13 = a1[6];
    v15 = a3;
    objc_msgSend(WeakRetained, "_performRatingAndAgeVerificationWithMediaItem:presentingController:completion:", v8, v9, v10);

    objc_destroyWeak(&v14);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  char v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;
  uint8_t buf[16];

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = sLogObject_18;
  v7 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback after performing rating and age verification", buf, 2u);
    }
    if (objc_msgSend(WeakRetained, "_shouldWarnStartingRentalPlaybackWindowWithMediaItem:", *(_QWORD *)(a1 + 32)))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_231;
      v14[3] = &unk_1E9FA1220;
      objc_copyWeak(&v17, v4);
      v15 = *(id *)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      v18 = *(_BYTE *)(a1 + 64);
      objc_msgSend(WeakRetained, "_presentStartingPlaybackWindowWarningWithRentalMediaItem:presentingViewController:completionHandler:", v8, v9, v14);

      objc_destroyWeak(&v17);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_235;
      v11[3] = &unk_1E9FA11D0;
      v10 = *(_QWORD *)(a1 + 40);
      v12 = *(id *)(a1 + 48);
      v13 = *(_BYTE *)(a1 + 64);
      objc_msgSend(WeakRetained, "_configureFor2Dor3DWithPresentingController:completion:", v10, v11);

    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback after performing rating and age verification", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_231(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;
  uint8_t buf[16];

  v4 = sLogObject_18;
  v5 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback after showing rental window warning", buf, 2u);
    }
    v6 = dispatch_time(0, 1000000000);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_232;
    v7[3] = &unk_1E9FA11F8;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v11 = *(_BYTE *)(a1 + 56);
    dispatch_after(v6, MEMORY[0x1E0C80D38], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback after showing rental window warning", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_232(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_233;
  v4[3] = &unk_1E9FA11D0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(WeakRetained, "_configureFor2Dor3DWithPresentingController:completion:", v3, v4);

}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_233(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_235(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_242(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    v8 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Preflight disallowing streaming playback because network is cellular and cellular playback is not allowed", buf, 2u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  if (!objc_msgSend(WeakRetained, "_shouldWarnAboutRentalPlaybackQualityForRentalMediaItem:", *(_QWORD *)(a1 + 32)))
  {
    v10 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Preflight allowing streaming playback over cellular connection", buf, 2u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_243;
  v11[3] = &unk_1E9FA1298;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_showCellularPlaybackQualityOptionsForRentalMediaItem:presentingViewController:completionHandler:", v12, v7, v11);

LABEL_11:
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_243(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(void);
  uint8_t v12[16];
  uint8_t buf[16];

  v6 = sLogObject_18;
  v7 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback of rental over cellular after displaying rental playback quality dialog", buf, 2u);
    }
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMediaItemMetadata:forProperty:", v9, *MEMORY[0x1E0DB1B98]);

    v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback of rental over cellular after displaying rental playback quality dialog", v12, 2u);
    }
    v10 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v10();
}

- (BOOL)_shouldWarnStartingRentalPlaybackWindowWithMediaItem:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  const char *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  int v22;
  double v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasTrait:", *MEMORY[0x1E0DB1D70]))
  {
    objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C08]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = sLogObject_18;
      v6 = 0;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Rental has already been played.  Not showing rental playback warning.", (uint8_t *)&v22, 2u);
        v6 = 0;
      }
      goto LABEL_22;
    }
    objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C00]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v17 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v11 = "No rental metadata is available.  Showing rental playback warning";
LABEL_16:
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v12);
      v14 = v13;

      objc_msgSend(v9, "doubleValue");
      v16 = v15;
      v17 = sLogObject_18;
      v18 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
      if (v14 < v16)
      {
        if (v18)
        {
          v19 = v17;
          objc_msgSend(v9, "doubleValue");
          v22 = 134218240;
          v23 = v14;
          v24 = 2048;
          v25 = v20;
          _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Rental is being played for the first time, but seconds until rental expiration, %f, is less than rental playback duration, %f.  Not showing rental playback warning.", (uint8_t *)&v22, 0x16u);

        }
        v6 = 0;
        goto LABEL_21;
      }
      if (v18)
      {
        LOWORD(v22) = 0;
        v11 = "Rental is being played for the first time.  Showing rental playback warning.";
        goto LABEL_16;
      }
    }
    v6 = 1;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v6 = 0;
LABEL_23:

  return v6;
}

- (void)_presentStartingPlaybackWindowWarningWithRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v30 = a5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v32 = a4;
  v8 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("RENTAL_PLAYBACK_WINDOW_WARNING_TITLE_FORMAT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("RENTAL_PLAYBACK_WINDOW_WARNING_MESSAGE"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1440]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC1138];
  v38[0] = v31;
  v14 = *MEMORY[0x1E0DC1140];
  v37[0] = v13;
  v37[1] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v29, v16);
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v28, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setAttributedMessage:", v17);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:", CFSTR("PLAY"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke;
  v35[3] = &unk_1E9F9F930;
  v22 = v30;
  v36 = v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v20, 0, v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_addAction:", v23);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:", CFSTR("CANCEL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke_2;
  v33[3] = &unk_1E9F9F930;
  v34 = v22;
  v26 = v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v25, 1, v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_addAction:", v27);

  objc_msgSend(v18, "vui_presentAlertFromPresentingController:animated:completion:", v32, 1, 0);
}

uint64_t __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentCantPlaybackOverCellularAlertControllerWithMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = MGGetBoolAnswer();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = CFSTR("CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_MOVIE");
  else
    v13 = CFSTR("CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_MOVIE");
  objc_msgSend(v11, "localizedStringForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
  {
    if ((v10 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANT_PLAYBACK_OVER_CELLULAR_NETWORK_ERROR_TITLE"), 0, CFSTR("VideosUIEmbedded"));
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v16, "localizedStringForKey:", CFSTR("CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"));
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v21;
    goto LABEL_10;
  }
  objc_msgSend(v16, "localizedStringForKey:", CFSTR("CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"));
  v18 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)v18;
LABEL_8:
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:", CFSTR("CANT_PLAYBACK_OVER_WLAN_ERROR_TITLE"));
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v22 = (void *)v20;

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v22, v14, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:", CFSTR("OK"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __137__VUIPlaybackStartupCoordinator__presentCantPlaybackOverCellularAlertControllerWithMediaItem_presentingViewController_completionHandler___block_invoke;
  v28[3] = &unk_1E9F9F930;
  v29 = v7;
  v26 = v7;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v25, 0, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "vui_addAction:", v27);

  objc_msgSend(v23, "vui_presentAlertFromPresentingController:animated:completion:", v8, 1, 0);
}

uint64_t __137__VUIPlaybackStartupCoordinator__presentCantPlaybackOverCellularAlertControllerWithMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showCellularPlaybackQualityOptionsForRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v7 = a5;
  v29 = a4;
  v8 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("WATCH_RENTAL_IN_HD_TITLE_FORMAT"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WATCH_RENTAL_IN_HD_DESCRIPTION"), 0, CFSTR("VideosUIEmbedded"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v28, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:", CFSTR("WATCH"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke;
  v35[3] = &unk_1E9F9F930;
  v18 = v7;
  v36 = v18;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v16, 0, v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vui_addAction:", v19);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:", CFSTR("WATCH_IN_SD"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_2;
  v33[3] = &unk_1E9F9F930;
  v22 = v18;
  v34 = v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v21, 0, v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vui_addAction:", v23);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:", CFSTR("CANCEL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_3;
  v31[3] = &unk_1E9F9F930;
  v32 = v22;
  v26 = v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v25, 1, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vui_addAction:", v27);

  objc_msgSend(v14, "vui_presentAlertFromPresentingController:animated:completion:", v29, 1, 0);
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performRatingAndAgeVerificationWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPresentingController:", v8);

  objc_msgSend(v10, "setMediaItem:", v9);
  objc_msgSend(v10, "setRestrictionsCheckType:", 0);
  v11 = objc_msgSend(v9, "hasTrait:", *MEMORY[0x1E0DB1D68]);

  if (v11
    && (+[VUIAgeVerification sharedInstance](VUIAgeVerification, "sharedInstance"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isAgeVerificationEnabled"),
        v12,
        (v13 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
    v14 = 3;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__VUIPlaybackStartupCoordinator__performRatingAndAgeVerificationWithMediaItem_presentingController_completion___block_invoke;
  v16[3] = &unk_1E9FA12E8;
  v17 = v7;
  v15 = v7;
  objc_msgSend(v10, "preflightWithOptions:completion:", v14, v16);

}

uint64_t __111__VUIPlaybackStartupCoordinator__performRatingAndAgeVerificationWithMediaItem_presentingController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_shouldWarnAboutRentalPlaybackQualityForRentalMediaItem:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v12;
  id v13;
  void *v14;
  char v15;
  BOOL result;

  v3 = *MEMORY[0x1E0DB1D70];
  v4 = a3;
  LODWORD(v3) = objc_msgSend(v4, "hasTrait:", v3);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "networkStatus");

  v7 = objc_msgSend(v4, "hasTrait:", *MEMORY[0x1E0DB1D58]);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "preferredCellularPlaybackQuality");

  if ((_DWORD)v3)
    v10 = v6 == 2;
  else
    v10 = 0;
  v12 = v10 && v7 != 0 && v9 == 1;
  result = 0;
  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CCECB0]);
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isExpensive");

    if ((v15 & 1) != 0)
      return 1;
  }
  return result;
}

- (void)_checkIfAllowedToPlayOnCellularNetworkWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "hasTrait:", *MEMORY[0x1E0DB1D30]))
  {
    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "cellularDataPlaybackEnabled");

    if (v13)
    {
      v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Cellular playback setting allowing playback";
LABEL_14:
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }
    else if (-[VUIPlaybackStartupCoordinator _existingPlaybackSessionAllowsCellular](self, "_existingPlaybackSessionAllowsCellular"))
    {
      v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Existing playback session allows cellular; allowing playback";
        goto LABEL_14;
      }
    }
    else
    {
      if (!-[VUIPlaybackStartupCoordinator _mediaItemIsBeingDownloadedAndDownloadAllowsCellular:](self, "_mediaItemIsBeingDownloadedAndDownloadAllowsCellular:", v8))
      {
        v16 = MGGetBoolAnswer();
        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v16)
          v20 = CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WLAN");
        else
          v20 = CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WIFI");
        objc_msgSend(v18, "localizedStringForKey:value:table:", v20, 0, CFSTR("VideosUIEmbedded"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("USE_CELLULAR_DATA_TO_STREAM_ONCE_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DONT_ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_300;
        v40[3] = &unk_1E9F9F930;
        v25 = v10;
        v41 = v25;
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v33, 0, v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v24;
        v38[1] = 3221225472;
        v38[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_301;
        v38[3] = &unk_1E9F9F930;
        v27 = v25;
        v39 = v27;
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v32, 0, v38);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v24;
        v36[1] = 3221225472;
        v36[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_302;
        v36[3] = &unk_1E9F9F930;
        v37 = v27;
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v31, 0, v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v35, v34, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "vui_addAction:isPreferred:", v26, 1);
        objc_msgSend(v30, "vui_addAction:", v28);
        objc_msgSend(v30, "vui_addAction:", v29);
        objc_msgSend(v30, "vui_presentAlertFromPresentingController:animated:completion:", v9, 1, 0);

        goto LABEL_16;
      }
      v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Cellular playback allowed because content is already being downloaded using cellular";
        goto LABEL_14;
      }
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    goto LABEL_16;
  }
  v11 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Cellular playback of this media item is prohibited, regardless of cellular settings", buf, 2u);
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke;
  v42[3] = &unk_1E9F98E68;
  v43 = v10;
  -[VUIPlaybackStartupCoordinator _presentCantPlaybackOverCellularAlertControllerWithMediaItem:presentingViewController:completionHandler:](self, "_presentCantPlaybackOverCellularAlertControllerWithMediaItem:presentingViewController:completionHandler:", v8, v9, v42);

LABEL_16:
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_300(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback allowed because cellular playback setting was toggled on by user selection", v5, 2u);
  }
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCellularDataPlaybackEnabled:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_301(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback allowed via one-time option by user selection", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_302(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback disallowed by user selection", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldPromptForExpiredDownload:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadExpirationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "vui_isInThePast");
  else
    v5 = 0;

  return v5;
}

- (void)_showAlertControllerForExpirationPromptForDownload:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  int v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
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
  _UNKNOWN **v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  char v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  char v58;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataAvailabilityEndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !objc_msgSend(v7, "vui_isInTheFuture"))
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:", CFSTR("DOWNLOAD_NO_LONGER_AVAILABLE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v32, v27, 1);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:", CFSTR("DELETE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_3;
    v53[3] = &unk_1E9FA1338;
    v54 = v5;
    +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v34, 0, v53);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFString vui_addAction:](v19, "vui_addAction:", v35);
    -[__CFString vui_presentAlertFromPresentingController:animated:completion:](v19, "vui_presentAlertFromPresentingController:animated:completion:", v6, 1, 0);

    v26 = v54;
  }
  else
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadAllowsManualRenewal"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = objc_msgSend(v5, "hasTrait:", *MEMORY[0x1E0DB1D30]);
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isNetworkReachable");

    v14 = &off_1E9F96000;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v52 = v8;
    if ((v13 & 1) != 0)
    {
      if (v10)
      {
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
        v50 = objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v17 = v8;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_RENEW"));
        v22 = v7;
        v23 = v6;
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v17;
        v14 = &off_1E9F96000;
        objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@"), 0, v49);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v24;
        v6 = v23;
        v7 = v22;
        v27 = (void *)v50;
      }
      else
      {
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v51 = v11;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN_BUTTON_TITLE"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v38 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_REDOWNLOAD"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v37;
        v11 = v51;
        objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v39, CFSTR("%@"), 0, v38);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = &off_1E9F96000;
      }
    }
    else
    {
      objc_msgSend(v15, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW_MESSAGE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = &stru_1E9FF3598;
    }

    +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v27, v26, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v42 = v14;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke;
      v55[3] = &unk_1E9FA1310;
      v56 = v5;
      v57 = v6;
      v58 = v11 ^ 1;
      +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v19, 0, v55);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "vui_addAction:", v43);

      objc_msgSend(v42[430], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v46 = CFSTR("CANCEL");
    }
    else
    {
      objc_msgSend(v14[430], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v46 = CFSTR("OK");
    }
    objc_msgSend(v44, "localizedStringForKey:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v47, 1, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "vui_addAction:", v48);
    objc_msgSend(v41, "vui_presentAlertFromPresentingController:animated:completion:", v6, 1, 0);

    v8 = v52;
  }

}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_2;
  v6[3] = &unk_1E9F9A0B0;
  v7 = v3;
  objc_msgSend(v2, "preflightDownloadForTVPMediaItem:presentingViewController:contentAllowsCellularDownload:completion:", v7, v4, v5, v6);

}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDownloadOrRenewKeysForMediaItem:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:", *(_QWORD *)(a1 + 32), a3, a4, 0);

}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_3(uint64_t a1)
{
  id v2;

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAndRemoveDownloadForMediaItem:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_mediaItemIsBeingDownloadedAndDownloadAllowsCellular:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingDownloadForAdamID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = objc_msgSend(v5, "allowCellularUsage");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_existingPlaybackSessionAllowsCellular
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  -[VUIPlaybackStartupCoordinator mediaInfo](self, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[VUIPlaybackStartupCoordinator mediaInfo](self, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "playbackContext");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 6)
    return 0;
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentPlaylistAllowsCellular");

  return v7;
}

- (void)_configureFor2Dor3DWithPresentingController:(id)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (void)setMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfo, a3);
}

- (int64_t)watchType
{
  return self->_watchType;
}

- (void)setWatchType:(int64_t)a3
{
  self->_watchType = a3;
}

- (BOOL)isRentAndWatchNow
{
  return self->_isRentAndWatchNow;
}

- (void)setIsRentAndWatchNow:(BOOL)a3
{
  self->_isRentAndWatchNow = a3;
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (BOOL)forceDownloadToStream
{
  return self->_forceDownloadToStream;
}

- (void)setForceDownloadToStream:(BOOL)a3
{
  self->_forceDownloadToStream = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)videoCanonicalID
{
  return self->_videoCanonicalID;
}

- (void)setVideoCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)showCanonicalID
{
  return self->_showCanonicalID;
}

- (void)setShowCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void)setContentMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (VUIVideosPlayable)resolvedPlayable
{
  return self->_resolvedPlayable;
}

- (void)setResolvedPlayable:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayable, a3);
}

- (VUIControllerPresenter)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_resolvedPlayable, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_showCanonicalID, 0);
  objc_storeStrong((id *)&self->_videoCanonicalID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

- (void)_addGroupActivityDayParamToPlayableAndMediaItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to add groupActivityDay param to HLS URL because groupActivityDay is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to start co-watching since sharedWatchUrl is nil and useSharedPlayableForCowatching is NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_207_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Replacing item being watched, but co-watching of next item is not possible.  Performing preflight of next media item but not telling groupActivitiesManager about next item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_212_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Watch type is Join, but co-watching is not possible.  Not allowing playback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_214_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Playback startup flow is already in progress.  Calling completion immediately with NO for all values", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_218_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "GroupActivitiesManager responded with Do Not Play", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
