@implementation RCMainControllerHelper

- (void)defaultSceneDidConnect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_defaultSceneWillEnterForeground:", UISceneWillEnterForegroundNotification, v4);

}

- (void)startMonitoringFinalizingRecordings
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000071FC;
  block[3] = &unk_1001AC608;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, block);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

- (RCMainControllerHelper)init
{
  RCMainControllerHelper *v2;
  RCUserActivity *v3;
  RCUserActivity *currentUserActivity;
  _TtC10VoiceMemos28RCUserActivityStatePublisher *v5;
  _TtC10VoiceMemos28RCUserActivityStatePublisher *activityStatePublisher;
  uint64_t v7;
  RCDisplayLinkManager *displayLinkManager;
  void *v9;
  RCUndoTarget *v10;
  RCUndoTarget *trimModeUndoTarget;
  RCUndoTarget *v12;
  RCUndoTarget *editModeUndoTarget;
  uint64_t v14;
  RCRecordingsModelInteractor *recordingsModelInteractor;
  void *v16;
  uint64_t v17;
  NSSet *audioProperties;
  NSMutableSet *v19;
  NSMutableSet *recordingObservances;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v21;
  void *v22;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *v23;
  _TtC10VoiceMemos24RCAppStoreRatingPrompter *appStoreRatingPrompter;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)RCMainControllerHelper;
  v2 = -[RCMainControllerHelper init](&v31, "init");
  if (v2)
  {
    v3 = objc_opt_new(RCUserActivity);
    currentUserActivity = v2->_currentUserActivity;
    v2->_currentUserActivity = v3;

    v5 = -[RCUserActivityStatePublisher initWithMainControllerHelper:]([_TtC10VoiceMemos28RCUserActivityStatePublisher alloc], "initWithMainControllerHelper:", v2);
    activityStatePublisher = v2->_activityStatePublisher;
    v2->_activityStatePublisher = v5;

    byte_1001F6C10 = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[RCDisplayLinkManager sharedManager](RCDisplayLinkManager, "sharedManager"));
    displayLinkManager = v2->_displayLinkManager;
    v2->_displayLinkManager = (RCDisplayLinkManager *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](v2, "timeController"));
    -[RCDisplayLinkManager setTimeController:](v2->_displayLinkManager, "setTimeController:", v9);

    v10 = -[RCUndoTarget initWithUndoTargetType:]([RCUndoTarget alloc], "initWithUndoTargetType:", 1);
    trimModeUndoTarget = v2->_trimModeUndoTarget;
    v2->_trimModeUndoTarget = v10;

    v12 = -[RCUndoTarget initWithUndoTargetType:]([RCUndoTarget alloc], "initWithUndoTargetType:", 0);
    editModeUndoTarget = v2->_editModeUndoTarget;
    v2->_editModeUndoTarget = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[RCRecordingsModelInteractor sharedRecordingsModelInteractor](RCRecordingsModelInteractor, "sharedRecordingsModelInteractor"));
    recordingsModelInteractor = v2->_recordingsModelInteractor;
    v2->_recordingsModelInteractor = (RCRecordingsModelInteractor *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor audioProperties](v2->_recordingsModelInteractor, "audioProperties"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("name")));
    audioProperties = v2->_audioProperties;
    v2->_audioProperties = (NSSet *)v17;

    v19 = objc_opt_new(NSMutableSet);
    recordingObservances = v2->_recordingObservances;
    v2->_recordingObservances = v19;

    v21 = [_TtC10VoiceMemos24RCAppStoreRatingPrompter alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v23 = -[RCAppStoreRatingPrompter initWithSavedRecordingsModel:](v21, "initWithSavedRecordingsModel:", v22);
    appStoreRatingPrompter = v2->_appStoreRatingPrompter;
    v2->_appStoreRatingPrompter = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RecorderAppDelegate sharedAppDelegate](RecorderAppDelegate, "sharedAppDelegate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "defaultSceneDelegate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "window"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "windowScene"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, "_sceneDidActivateNotification:", UISceneDidActivateNotification, v28);
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, "_sceneDidEnterBackgroundNotification:", UISceneDidEnterBackgroundNotification, v28);
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, "_sceneWillDeactivateNotification:", UISceneWillDeactivateNotification, v28);

  }
  return v2;
}

- (BOOL)isPlayingForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
    v8 = objc_msgSend(v5, "playing");
  else
    v8 = 0;

  return v8;
}

- (NSString)uuidOfPlayingRecording
{
  return self->_uuidOfPlayingRecording;
}

- (double)currentTime
{
  void *v3;
  void *v4;
  void *v5;
  double currentTime;
  uint64_t v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  if (!objc_msgSend(v3, "activityType") && objc_msgSend(v3, "subActivityType") != (id)4)
    goto LABEL_8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v5 = v4;
  if (!v4
    || !objc_msgSend(v4, "recording")
    || (v8 = 0, v9 = 0.0, (objc_msgSend(v5, "monitorRecordingTime:duration:", &v9, &v8) & 1) == 0))
  {

LABEL_8:
    currentTime = self->_currentTime;
    goto LABEL_9;
  }
  currentTime = v9;

LABEL_9:
  return currentTime;
}

- (RCUserActivity)currentUserActivity
{
  return self->_currentUserActivity;
}

- (VMAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (RCRecordingDisplayModel)currentRecordingDisplayModel
{
  return self->_currentRecordingDisplayModel;
}

- (void)stopPlayback
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  if (objc_msgSend(v3, "playing"))
    -[RCMainControllerHelper _clearPlaybackInAudioPlayer:](self, "_clearPlaybackInAudioPlayer:", v3);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_sceneDidActivateNotification:(id)a3
{
  if (self->_hasBecomeActive)
    -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState", a3);
  self->_hasBecomeActive = 1;
}

- (void)_defaultSceneWillEnterForeground:(id)a3
{
  -[RCAppStoreRatingPrompter applicationDidEnterForeground](self->_appStoreRatingPrompter, "applicationDidEnterForeground", a3);
}

- (void)dealloc
{
  NSMapTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_commandTargets;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_commandTargets, "objectForKey:", v8));
        if (v9)
          objc_msgSend(v8, "removeTarget:", v9);

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = -[NSMutableSet copy](self->_recordingObservances, "copy");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[RCMainControllerHelper _removeRecordingObservations:](self, "_removeRecordingObservations:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15.receiver = self;
  v15.super_class = (Class)RCMainControllerHelper;
  -[RCMainControllerHelper dealloc](&v15, "dealloc");
}

- (id)displayLinkManager
{
  return self->_displayLinkManager;
}

- (void)setCurrentRecordingDisplayModel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_currentRecordingDisplayModel, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v4, "didUpdateCurrentRecordingDisplayModel");

}

- (BOOL)startCapturing:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;

  v4 = a3;
  v5 = OSLogForCategory(kVMLogCategoryDefault);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[RCMainControllerHelper startCapturing:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s -- Requested start capturing", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  v9 = objc_msgSend(v8, "isTrim");

  if (v9)
  {
    -[RCMainControllerHelper exitTrimMode](self, "exitTrimMode");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
    v11 = objc_msgSend(v10, "activityType");

    if (v11 == (id)3)
      -[RCMainControllerHelper exitEditMode](self, "exitEditMode");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  objc_msgSend(v12, "setSubActivityType:", 0);

  v21 = 0;
  v13 = objc_msgSend(v7, "isRecordingEnabled:", &v21);
  v14 = v21;
  if (v13)
  {
    v15 = objc_msgSend(v7, "newRecorderWithTitleBase:", v4);
    -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
    objc_msgSend(v16, "setTargetTime:", 0.0);

    if ((objc_msgSend(v15, "startRecording") & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper recordingError](self, "recordingError"));
      objc_msgSend(v17, "captureFailedWithError:", v18);

    }
  }
  else if (-[RCMainControllerHelper _errorIsRecordingUnavailable:](self, "_errorIsRecordingUnavailable:", v14))
  {
    -[RCMainControllerHelper _handleRecordingUnavailableError:](self, "_handleRecordingUnavailableError:", v14);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v19, "captureFailedWithError:", v14);

  }
  return v13;
}

- (void)pauseCapturing
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;

  v3 = kVMLogCategoryDefault;
  v4 = OSLogForCategory(kVMLogCategoryDefault);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[RCMainControllerHelper pauseCapturing]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Requested pause capturing", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  objc_msgSend(v7, "setSubActivityType:", 4);

  if (v6)
  {
    if (objc_msgSend(v6, "recording"))
    {
      -[RCMainControllerHelper _stopDisplayLink](self, "_stopDisplayLink");
      if ((objc_msgSend(v6, "stopRecording") & 1) == 0)
      {
        v8 = OSLogForCategory(v3);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_10010D870(self, v9);

      }
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
  objc_msgSend(v10, "setUndoDisabled:", 0);

}

- (void)resumeCapturing
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = OSLogForCategory(kVMLogCategoryDefault);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[RCMainControllerHelper resumeCapturing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s -- Requested resume capture", (uint8_t *)&v5, 0xCu);
  }

  -[RCMainControllerHelper _beginOrResumeCaptureSessionWithReplace:](self, "_beginOrResumeCaptureSessionWithReplace:", 0);
}

- (void)replaceCapturing
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = OSLogForCategory(kVMLogCategoryDefault);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[RCMainControllerHelper replaceCapturing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s -- Requested replace capture", (uint8_t *)&v5, 0xCu);
  }

  -[RCMainControllerHelper _beginOrResumeCaptureSessionWithReplace:](self, "_beginOrResumeCaptureSessionWithReplace:", 1);
}

- (void)stopCapturing
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  if (objc_msgSend(v3, "activityType") == (id)1 && objc_msgSend(v3, "subActivityType") == (id)4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
    v5 = objc_msgSend(v3, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayModel"));
    objc_msgSend(v4, "transitionToActivityType:subType:withDisplayModel:", v5, 5, v6);

  }
  if (v8 && objc_msgSend(v8, "recording") && objc_msgSend(v8, "stopRecording"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
    objc_msgSend(v7, "setUndoDisabled:", 0);

  }
  -[RCMainControllerHelper setDidTrimPlayback:](self, "setDidTrimPlayback:", 0);

}

- (BOOL)isRecording
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "preparing") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "recording");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isPlaying
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "playing");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isPaused
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "playing") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)recordingInProgressUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingID"));

  return v3;
}

- (void)_beginOrResumeCaptureSessionWithReplace:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  void *v28;
  double v29;
  void *v30;
  RCUndoTarget *editModeUndoTarget;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  _QWORD v41[5];
  id v42;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance", a3));
  v42 = 0;
  v5 = objc_msgSend(v4, "isRecordingEnabled:", &v42);
  v6 = v42;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    if (objc_msgSend((id)v7, "shouldWaitForAccessToken"))
    {
      v8 = OSLogForCategory(kVMLogCategoryDefault);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
        sub_10010D8FC(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingOrSelectedRecording](self, "uuidOfPlayingOrSelectedRecording"));
      if (v7 | v9)
      {
        if (!v7)
        {
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recorderForRecordingID:", v9));
          -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", v7);
        }
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "recordingID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchRecording:", v18));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
        objc_msgSend(v28, "currentTime");
        objc_msgSend(v28, "setTargetTime:");
        self->_isResumingOrReplacing = 1;
        if ((objc_msgSend((id)v7, "startRecording") & 1) != 0)
        {
          objc_msgSend(v27, "length");
          if (v29 > 0.0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
            editModeUndoTarget = self->_editModeUndoTarget;
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_100093C94;
            v41[3] = &unk_1001AD220;
            v41[4] = self;
            objc_msgSend(v30, "registerUndoWithTarget:handler:", editModeUndoTarget, v41);

            v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
            v40 = v27;
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("TITLE_FOR_OVERDUB_UNDO"), &stru_1001B2BC0, 0));
            objc_msgSend(v32, "setActionName:", v34);

            v27 = v40;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
            objc_msgSend(v35, "enableUndoFirstResponder");

          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
          objc_msgSend(v36, "setUndoDisabled:", 1);

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
          objc_msgSend(v37, "setSubActivityType:", 4);

          -[RCMainControllerHelper setUuidOfPlayingRecording:](self, "setUuidOfPlayingRecording:", 0);
        }
        else
        {
          self->_isResumingOrReplacing = 0;
          v38 = OSLogForCategory(kVMLogCategoryDefault);
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            sub_10010D9DC(self, v39);

        }
      }
      else
      {
        v17 = OSLogForCategory(kVMLogCategoryDefault);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_10010D96C(v18, v19, v20, v21, v22, v23, v24, v25);
        v7 = 0;
      }

    }
  }
  else if (-[RCMainControllerHelper _errorIsRecordingUnavailable:](self, "_errorIsRecordingUnavailable:", v6))
  {
    -[RCMainControllerHelper _handleRecordingUnavailableError:](self, "_handleRecordingUnavailableError:", v6);
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v26, "captureFailedWithError:", v6);

  }
}

- (void)_recordingStarted:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "isRunningTest");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    objc_msgSend(v8, "ppt_didStartRecording");

  }
  v9 = OSLogForCategory(kVMLogCategoryDefault);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[RCMainControllerHelper _recordingStarted:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- Recording started UI callback", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingStartTimeInfo infoWithCurrentDateAndTime](RCRecordingStartTimeInfo, "infoWithCurrentDateAndTime"));
  -[RCMainControllerHelper currentTime](self, "currentTime");
  objc_msgSend(v11, "setRecordingTimeAtStartTime:");
  -[RCMainControllerHelper currentDuration](self, "currentDuration");
  objc_msgSend(v11, "setRecordingDurationAtStartTime:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v34 = v11;
  objc_msgSend(v12, "recordingDidStartWithInfo:", v11);

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "fetchRecording:", v13));
  if (v14)
    -[RCMainControllerHelper _addRecordingObservations:](self, "_addRecordingObservations:", v14);
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "creationDate"));
  if (self->_isResumingOrReplacing)
    objc_msgSend(v14, "length");
  else
    v17 = 0.0;
  BYTE2(v29) = 0;
  LOWORD(v29) = 0;
  v31 = (void *)v15;
  v18 = objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v15, v16, v13, 0, 0, 0, v17, v29));
  -[RCMainControllerHelper setCurrentRecordingDisplayModel:](self, "setCurrentRecordingDisplayModel:", v18);
  v33 = (void *)v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", v13));
  -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:", v19);

  v35 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waveformDataSource"));
  objc_msgSend(v20, "addObserver:", self);
  -[RCMainControllerHelper setUuidOfPlayingRecording:](self, "setUuidOfPlayingRecording:", 0);
  if (self->_isResumingOrReplacing)
    v21 = 4;
  else
    v21 = 3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
  v30 = (void *)v18;
  -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", 1, v21, v18, v20, v22);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v28, "timeController:didChangeState:") & 1) != 0)
          objc_msgSend(v28, "timeController:didChangeState:", self, 2);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v25);
  }

  -[RCMainControllerHelper _startDisplayLink](self, "_startDisplayLink");
}

- (void)_recordingStopped:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;

  v4 = a3;
  v5 = kVMLogCategoryDefault;
  v6 = OSLogForCategory(kVMLogCategoryDefault);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[RCMainControllerHelper _recordingStopped:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s -- Recording stopped UI callback", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v8, "recordingDidEnd");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));
  if (v9
    && (v10 = objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](self->_recordingsModelInteractor, "recordingForUUID:", v9))) != 0)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
    v13 = objc_msgSend(v12, "subActivityType");

    if (v13 == (id)3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
      objc_msgSend(v14, "setTargetTime:", 0.0);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", v9));
    -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:", v15);

    v34 = v9;
    -[RCMainControllerHelper _performRecordingEndTransitionWithUUID:](self, "_performRecordingEndTransitionWithUUID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
    objc_msgSend(v16, "currentTime");
    v18 = v17;

    -[NSObject length](v11, "length");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:](RCRecordingDisplayModel, "recordingDisplayModelWithSavedRecording:", v11));
    -[RCMainControllerHelper setCurrentRecordingDisplayModel:](self, "setCurrentRecordingDisplayModel:", v21);

    v22 = RCTimeRangeMake(0.0, v20);
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
    objc_msgSend(v25, "setAllowedTimeRange:", v22, v24);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects"));
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v31, "timeController:didChangeCurrentTime:didChangeDuration:") & 1) != 0)
            objc_msgSend(v31, "timeController:didChangeCurrentTime:didChangeDuration:", self, v18, v20);
          if ((objc_opt_respondsToSelector(v31, "timeController:didChangeState:") & 1) != 0)
            objc_msgSend(v31, "timeController:didChangeState:", self, 0);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v28);
    }

    -[RCMainControllerHelper _stopDisplayLink](self, "_stopDisplayLink");
    v9 = v34;
    -[RCMainControllerHelper _preloadRecordingForPlayback:](self, "_preloadRecordingForPlayback:", v34);
    v32 = v11;
  }
  else
  {
    v33 = OSLogForCategory(v5);
    v32 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_10010DA68();
  }

}

- (void)_recordingFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = OSLogForCategory(kVMLogCategoryDefault);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10010DAD8();

  if ((objc_msgSend(v6, "recording") & 1) == 0)
  {
    -[RCMainControllerHelper _recordingStopped:](self, "_recordingStopped:", v6);
    -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v10, "captureFailedWithError:", v7);

}

- (BOOL)_errorIsRecordingUnavailable:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("VMAudioServiceErrorDomain")))
    v5 = objc_msgSend(v3, "code") == (id)5;
  else
    v5 = 0;

  return v5;
}

- (void)_handleRecordingUnavailableError:(id)a3
{
  id v4;
  UIAlertController **p_recordingUnavailableAlertController;
  id WeakRetained;
  void *v7;
  void ***v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  RCMainControllerHelper *v16;
  id v17;

  v4 = a3;
  p_recordingUnavailableAlertController = &self->_recordingUnavailableAlertController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingUnavailableAlertController);

  if (!WeakRetained)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10009463C;
    v15 = &unk_1001AB6E8;
    v16 = self;
    v17 = v4;
    v8 = objc_retainBlock(&v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey, v12, v13, v14, v15, v16));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSLocalizedRecoverySuggestionErrorKey));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController rc_OKAlertControllerWithTitle:message:handler:](UIAlertController, "rc_OKAlertControllerWithTitle:message:handler:", v9, v10, v8));

    objc_msgSend(v11, "rc_showInMainWindow");
    objc_storeWeak((id *)p_recordingUnavailableAlertController, v11);

  }
}

- (void)prepareForPlaybackForUUID:(id)a3
{
  -[RCMainControllerHelper prepareForPlaybackForUUID:force:](self, "prepareForPlaybackForUUID:force:", a3, 0);
}

- (void)prepareForPlaybackForUUID:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id WeakRetained;
  RCAVWaveformViewController *v12;
  RCAVWaveformViewController *waveformViewController;
  id v14;
  RCAVWaveformViewController *v15;
  RCAVWaveformViewController *overviewWaveformViewController;
  RCRecordingsModelInteractor *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v4 = a4;
  v26 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savedRecordingUUID"));
  v8 = objc_msgSend(v7, "isEqualToString:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));

  if (v4 || !v9 || (v8 & 1) == 0)
  {
    -[RCMainControllerHelper setUuidOfPlayingRecording:](self, "setUuidOfPlayingRecording:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", v26));
    -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:", v10);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
    waveformViewController = self->_waveformViewController;
    self->_waveformViewController = v12;

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "overviewWaveformViewController"));
    overviewWaveformViewController = self->_overviewWaveformViewController;
    self->_overviewWaveformViewController = v15;

    -[RCAVWaveformViewController setActiveTimeController:](self->_waveformViewController, "setActiveTimeController:", self);
    -[RCAVWaveformViewController setActiveTimeController:](self->_overviewWaveformViewController, "setActiveTimeController:", self);
    v17 = self->_recordingsModelInteractor;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](v17, "recordingForUUID:", v7));
    if (v18)
      -[RCMainControllerHelper _removeRecordingObservations:](self, "_removeRecordingObservations:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](v17, "recordingForUUID:", v26));
    if (v19)
    {
      -[RCMainControllerHelper _addRecordingObservations:](self, "_addRecordingObservations:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:](RCRecordingDisplayModel, "recordingDisplayModelWithSavedRecording:", v19));
      -[RCMainControllerHelper setCurrentRecordingDisplayModel:](self, "setCurrentRecordingDisplayModel:", v20);

      if ((v8 & 1) == 0)
      {
        objc_msgSend(v19, "length");
        v22 = RCTimeRangeMake(0.0, v21);
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
        objc_msgSend(v25, "setAllowedTimeRange:", v22, v24);

      }
    }
    -[RCMainControllerHelper _preloadRecordingForPlayback:](self, "_preloadRecordingForPlayback:", v26);

  }
}

- (BOOL)readyForPlayback
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingID"));
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingID"));
    v5 = v7 != 0;

  }
  return v5;
}

- (void)playbackForUUID:(id)a3 atPosition:(double)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;

  v5 = a3;
  if (-[RCMainControllerHelper isRecording](self, "isRecording"))
  {
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010DB48(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
    v16 = objc_msgSend(v15, "isEqualToString:", v5);

    if ((v16 & 1) == 0)
    {
      -[RCMainControllerHelper setUuidOfPlayingRecording:](self, "setUuidOfPlayingRecording:", v5);
      -[RCMainControllerHelper prepareForPlaybackForUUID:](self, "prepareForPlaybackForUUID:", v5);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
    objc_msgSend(v17, "currentTime");
    -[RCMainControllerHelper _startPlaybackOfUUID:atPosition:](self, "_startPlaybackOfUUID:atPosition:", v5);

  }
}

- (void)togglePlayback
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  -[RCMainControllerHelper toggleForUUID:](self, "toggleForUUID:", v3);

}

- (void)toggleForUUID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:"));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "playing"))
    {
      -[RCMainControllerHelper pauseForUUID:](self, "pauseForUUID:", v6);
    }
    else
    {
      objc_msgSend(v5, "playerTime");
      -[RCMainControllerHelper playbackForUUID:atPosition:](self, "playbackForUUID:atPosition:", v6);
    }
  }

}

- (void)pauseForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:", v4));
    -[RCMainControllerHelper _stopPlaybackInAudioPlayer:](self, "_stopPlaybackInAudioPlayer:", v7);
  }
  else
  {
    v8 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010DBB8((uint64_t)v4, self);
  }

}

- (void)stopForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:", v4));
    -[RCMainControllerHelper _clearPlaybackInAudioPlayer:](self, "_clearPlaybackInAudioPlayer:", v7);
  }
  else
  {
    v8 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010DC48((uint64_t)v4, self);
  }

}

- (void)startScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  id v5;

  v5 = a3;
  if ((-[VMAudioPlayer playing](self->_audioPlayer, "playing") & 1) != 0
    || -[VMAudioPlayer willPlayPendingPreparation](self->_audioPlayer, "willPlayPendingPreparation"))
  {
    self->_scrubState = 1;
    -[RCMainControllerHelper pauseForUUID:](self, "pauseForUUID:", v5);
  }
  else
  {
    self->_scrubState = 2;
  }

}

- (void)updateScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController", a3));
  objc_msgSend(v5, "setTargetTime:", a4);

}

- (void)endScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  if (self->_scrubState == 1)
    -[RCMainControllerHelper playbackForUUID:atPosition:](self, "playbackForUUID:atPosition:", a3, a4);
  self->_scrubState = 0;
}

- (BOOL)canJumpForward
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[RCMainControllerHelper isRecording](self, "isRecording"))
    goto LABEL_5;
  v3 = -[RCMainControllerHelper readyForPlayback](self, "readyForPlayback");
  if (v3)
  {
    -[RCMainControllerHelper currentDuration](self, "currentDuration");
    if (v4 > 0.05)
    {
      -[RCMainControllerHelper currentTime](self, "currentTime");
      v6 = v5;
      -[RCMainControllerHelper currentDuration](self, "currentDuration");
      LOBYTE(v3) = v6 < v7;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)jumpForwardForUUID:(id)a3
{
  -[RCMainControllerHelper _jumpByIncrement:forUUID:](self, "_jumpByIncrement:forUUID:", a3, 15.0);
}

- (BOOL)canJumpBackward
{
  _BOOL4 v3;
  double v4;
  double v5;

  if (-[RCMainControllerHelper isRecording](self, "isRecording"))
    goto LABEL_5;
  v3 = -[RCMainControllerHelper readyForPlayback](self, "readyForPlayback");
  if (v3)
  {
    -[RCMainControllerHelper currentDuration](self, "currentDuration");
    if (v4 > 0.05)
    {
      -[RCMainControllerHelper currentTime](self, "currentTime");
      LOBYTE(v3) = v5 > 0.0;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)jumpBackwardForUUID:(id)a3
{
  -[RCMainControllerHelper _jumpByIncrement:forUUID:](self, "_jumpByIncrement:forUUID:", a3, -15.0);
}

- (void)_stopForUUIDs:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
    -[RCMainControllerHelper stopForUUID:](self, "stopForUUID:", v7);

  }
}

- (void)_preloadRecordingForPlayback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingID")),
        v9 = objc_msgSend(v8, "isEqualToString:", v4),
        v8,
        v7,
        v6,
        (v9 & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:", v4));
    if (!v10)
    {
      v11 = OSLogForCategory(kVMLogCategoryDefault);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10010DCD8();

    }
  }

}

- (void)_startPlaybackOfUUID:(id)a3 atPosition:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v6 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:", v6));

  objc_msgSend(v13, "allowedTimeRange");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "setPlayableRange:");
  if (v11 - a4 >= 0.01)
    v12 = a4;
  else
    v12 = v9;
  objc_msgSend(v13, "setTargetTime:", v12);
  objc_msgSend(v7, "startPlaying");

}

- (void)_clearPlaybackInAudioPlayer:(id)a3
{
  -[RCMainControllerHelper _stopPlaybackInAudioPlayer:](self, "_stopPlaybackInAudioPlayer:", a3);
  -[RCMainControllerHelper setUuidOfPlayingRecording:](self, "setUuidOfPlayingRecording:", 0);
}

- (void)_stopPlaybackInAudioPlayer:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "playing");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(v6, "stopPlaying");
      v4 = v6;
    }
  }

}

- (id)currentPlayerForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    v6 = v5;
    if (v5
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID")),
          v8 = objc_msgSend(v4, "isEqualToString:", v7),
          v7,
          v8))
    {
      v9 = v6;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerForRecordingID:", v4));
      LODWORD(v11) = 1.0;
      -[RCMainControllerHelper setTargetRate:](self, "setTargetRate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingID"));
      v14 = objc_msgSend(v4, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        -[RCMainControllerHelper targetTime](self, "targetTime");
        objc_msgSend(v9, "setPlayerTime:");
      }
      else
      {
        -[RCMainControllerHelper setTargetTime:](self, "setTargetTime:", 0.0);
      }
      objc_msgSend(v9, "setController:", self);
      -[RCMainControllerHelper setAudioPlayer:](self, "setAudioPlayer:", v9);

    }
  }
  else
  {
    v15 = OSLogForCategory(kVMLogCategoryDefault);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10010DD48(v16, v17, v18, v19, v20, v21, v22, v23);

    v9 = 0;
  }

  return v9;
}

- (void)_jumpByIncrement:(double)a3 forUUID:(id)a4
{
  void *v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  if (objc_msgSend(v8, "playing"))
    objc_msgSend(v8, "playerTime");
  else
    objc_msgSend(v6, "currentTime");
  -[RCMainControllerHelper _jumpToTargetTime:](self, "_jumpToTargetTime:", v7 + a3);

}

- (void)_jumpToTargetTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v7 = v6;
  v10 = 0.0;
  v11 = 0;
  if (v6
    && objc_msgSend(v6, "recording")
    && objc_msgSend(v7, "monitorRecordingTime:duration:", &v11, &v10))
  {
    v8 = RCTimeRangeMake(0.0, v10);
  }
  else
  {
    objc_msgSend(v5, "allowedTimeRange", *(_QWORD *)&v10, v11);
  }
  if (v8 <= a3)
  {
    v8 = a3;
    if (v9 < a3)
      v8 = v9;
  }
  objc_msgSend(v5, "setTargetTime:", v8, *(_QWORD *)&v10);
  -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState");

}

- (void)endDescriptionViewTextEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RecordingDescriptionViewShouldEndEditingNotificationName"), 0);

}

- (void)enterTrimMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RCMainControllerHelper *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingOrSelectedRecording](self, "uuidOfPlayingOrSelectedRecording"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recorderForRecordingID:", v5));

  }
  if (objc_msgSend(v3, "recording"))
  {
    if (objc_msgSend(v3, "stopRecording"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "recording"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100095458;
      v8[3] = &unk_1001AC8D0;
      v9 = v3;
      v10 = self;
      v7 = (id)RCObserveChangesToKeyPath(v9, v6, v8);

    }
  }
  else
  {
    -[RCMainControllerHelper _enterTrimMode](self, "_enterTrimMode");
  }

}

- (void)exitTrimMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[4];
  id v10;

  -[RCUndoTarget setShouldEnableSave:](self->_trimModeUndoTarget, "setShouldEnableSave:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  -[RCMainControllerHelper currentDuration](self, "currentDuration");
  objc_msgSend(v3, "recordingDurationUpdated:");

  -[RCMainControllerHelper _setIsInSelectionEditingMode:forInsertMode:](self, "_setIsInSelectionEditingMode:forInsertMode:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  objc_msgSend(v4, "setSubActivityType:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRIM_END_ANNOUNCE"), &stru_1001B2BC0, 0));

  v7 = dispatch_time(0, 800000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000955C0;
  block[3] = &unk_1001AB588;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)cancelTrimModeWithDismissal:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  v3 = a3;
  if (-[RCUndoTarget sizeOfUndoStack](self->_trimModeUndoTarget, "sizeOfUndoStack") >= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    if (objc_msgSend(v5, "restoreMarkedVersion"))
    {
      -[RCMainControllerHelper _reloadWaveformDataSourceAndPreviewAssetWithInitialTime:](self, "_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:", 0.0);
      -[RCMainControllerHelper _clearTrimModeUndoStack](self, "_clearTrimModeUndoStack");
      v6 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
      -[NSObject setTargetTime:](v6, "setTargetTime:", 0.0);
    }
    else
    {
      v7 = OSLogForCategory(kVMLogCategoryDefault);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10010DDB8(self, v6);
    }

  }
  if (v3)
    -[RCMainControllerHelper exitTrimMode](self, "exitTrimMode");
}

- (void)doneButtonShouldSaveAsNew:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v6 = objc_msgSend(v5, "isNewRecording");

  -[RCMainControllerHelper setShouldSaveAsNew:](self, "setShouldSaveAsNew:", v3 & (v6 ^ 1));
}

- (void)exitEditMode
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
  objc_msgSend(v3, "removeAllActionsWithTarget:", self->_editModeUndoTarget);

  -[RCUndoTarget setSizeOfUndoStack:](self->_editModeUndoTarget, "setSizeOfUndoStack:", 0);
  -[RCMainControllerHelper _clearTrimModeUndoStack](self, "_clearTrimModeUndoStack");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  if (v4)
  {
    objc_msgSend(v4, "finishEditing:", -[RCMainControllerHelper shouldSaveAsNew](self, "shouldSaveAsNew"));
    -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", 0);
  }

}

- (void)performTrimByKeepingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  RCUndoTarget *trimModeUndoTarget;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  -[RCMainControllerHelper _selectedTimeRange](self, "_selectedTimeRange");
  v7 = v6;
  v9 = v8;
  if (-[RCMainControllerHelper _isSelectionTrimmableByKeepingRange:](self, "_isSelectionTrimmableByKeepingRange:"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    v12 = v11;
    if (!v11
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingID")),
          v14 = objc_msgSend(v5, "isEqualToString:", v13),
          v13,
          (v14 & 1) == 0))
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recorderForRecordingID:", v5));

      -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", v15);
      v12 = (void *)v15;
    }
    -[RCMainControllerHelper _markCurrentFileVersionIfNecessary](self, "_markCurrentFileVersionIfNecessary");
    v24 = 0;
    v16 = objc_msgSend(v12, "trimRecording:error:", &v24, v7, v9);
    v17 = v24;
    if (v16)
    {
      -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v5);
      v18 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
      -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject undoManager](v18, "undoManager"));
      trimModeUndoTarget = self->_trimModeUndoTarget;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10009599C;
      v23[3] = &unk_1001AD220;
      v23[4] = self;
      objc_msgSend(v19, "registerUndoWithTarget:handler:", trimModeUndoTarget, v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _undoActionNameForTrimMode:isUndo:](self, "_undoActionNameForTrimMode:isUndo:", 0, 1));
      objc_msgSend(v19, "setActionName:", v21);

      -[NSObject enableUndoFirstResponder](v18, "enableUndoFirstResponder");
    }
    else
    {
      v22 = OSLogForCategory(kVMLogCategoryDefault);
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10010DE44();
    }

  }
  else
  {
    -[RCMainControllerHelper _cancelTrim](self, "_cancelTrim");
  }

}

- (void)performTrimByDeletingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  RCUndoTarget *trimModeUndoTarget;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v5 = a3;
  -[RCMainControllerHelper _selectedTimeRange](self, "_selectedTimeRange");
  v7 = v6;
  v9 = v8;
  if (-[RCMainControllerHelper _isSelectionTrimmableByDeletingRange:](self, "_isSelectionTrimmableByDeletingRange:"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    v12 = v11;
    if (!v11
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingID")),
          v14 = objc_msgSend(v5, "isEqualToString:", v13),
          v13,
          (v14 & 1) == 0))
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recorderForRecordingID:", v5));

      -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", v15);
      v12 = (void *)v15;
    }
    -[RCMainControllerHelper _markCurrentFileVersionIfNecessary](self, "_markCurrentFileVersionIfNecessary");
    v24 = 0;
    v16 = objc_msgSend(v12, "cutRecording:error:", &v24, v7, v9);
    v17 = v24;
    if (v16)
    {
      -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v5);
      v18 = objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
      -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject undoManager](v18, "undoManager"));
      trimModeUndoTarget = self->_trimModeUndoTarget;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100095BBC;
      v23[3] = &unk_1001AD220;
      v23[4] = self;
      objc_msgSend(v19, "registerUndoWithTarget:handler:", trimModeUndoTarget, v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _undoActionNameForTrimMode:isUndo:](self, "_undoActionNameForTrimMode:isUndo:", 1, 1));
      objc_msgSend(v19, "setActionName:", v21);

      -[NSObject enableUndoFirstResponder](v18, "enableUndoFirstResponder");
    }
    else
    {
      v22 = OSLogForCategory(kVMLogCategoryDefault);
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10010DEB4();
    }

  }
  else
  {
    -[RCMainControllerHelper _cancelTrim](self, "_cancelTrim");
  }

}

- (void)openForModifyRecordingWithUUID:(id)a3 withSubActivityType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:"));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "recentlyDeleted") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recorderForRecordingID:", v13));
    -[RCMainControllerHelper setAudioRecorder:](self, "setAudioRecorder:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", v13));
    -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _previewWaveformDataSource](self, "_previewWaveformDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", 3, a4, v7, v11, v12);

  }
}

- (void)_enterTrimMode
{
  void *v3;

  -[RCMainControllerHelper _setIsInSelectionEditingMode:forInsertMode:](self, "_setIsInSelectionEditingMode:forInsertMode:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  objc_msgSend(v3, "setSubActivityType:", 2);

  -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", 0);
}

- (void)_cancelTrim
{
  -[RCMainControllerHelper _setIsInSelectionEditingMode:forInsertMode:](self, "_setIsInSelectionEditingMode:forInsertMode:", 0, 0);
}

- (void)_resetSelectedTimeRangeToFullDuration
{
  RCMainControllerHelperDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
  objc_msgSend(v5, "resetSelectedTimeRangeToFullDuration");

  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overviewWaveformViewController"));
  objc_msgSend(v7, "resetSelectedTimeRangeToFullDuration");

  v14 = objc_loadWeakRetained((id *)p_delegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waveformViewController"));
  objc_msgSend(v8, "selectedTimeRange");
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  objc_msgSend(v13, "setAllowedTimeRange:", v10, v12);

}

- (void)_setIsInSelectionEditingMode:(BOOL)a3 forInsertMode:(BOOL)a4
{
  int v5;

  v5 = byte_1001F6C10;
  if (byte_1001F6C10 != a3)
  {
    byte_1001F6C10 = a3;
    if (a3)
      -[RCMainControllerHelper _beginSelectionEditingModeForInsertMode:](self, "_beginSelectionEditingModeForInsertMode:", a4);
    else
      -[RCMainControllerHelper _endSelectionEditingMode](self, "_endSelectionEditingMode", a3, a4);
    v5 = byte_1001F6C10;
  }
  if (v5)
    -[RCMainControllerHelper _resetSelectedTimeRangeToFullDuration](self, "_resetSelectedTimeRangeToFullDuration");
}

- (void)_endSelectionEditingMode
{
  RCMainControllerHelperDelegate **p_delegate;
  id WeakRetained;
  RCAVWaveformViewController *v5;
  RCAVWaveformViewController *waveformViewController;
  id v7;
  RCAVWaveformViewController *v8;
  RCAVWaveformViewController *overviewWaveformViewController;
  RCAVWaveformViewController *v10;
  _QWORD v11[5];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overviewWaveformViewController"));
  overviewWaveformViewController = self->_overviewWaveformViewController;
  self->_overviewWaveformViewController = v8;

  v10 = self->_waveformViewController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100095F30;
  v11[3] = &unk_1001AB588;
  v11[4] = self;
  -[RCAVWaveformViewController hidSelectionOverlayWithCompletionBlock:](v10, "hidSelectionOverlayWithCompletionBlock:", v11);
  -[RCAVWaveformViewController hidSelectionOverlayWithCompletionBlock:](self->_overviewWaveformViewController, "hidSelectionOverlayWithCompletionBlock:", &stru_1001AD240);
  -[RCMainControllerHelper pauseCapturing](self, "pauseCapturing");
}

- (void)_beginSelectionEditingModeForInsertMode:(BOOL)a3
{
  _BOOL8 v3;
  RCMainControllerHelperDelegate **p_delegate;
  id WeakRetained;
  RCAVWaveformViewController *v7;
  RCAVWaveformViewController *waveformViewController;
  id v9;
  RCAVWaveformViewController *v10;
  RCAVWaveformViewController *overviewWaveformViewController;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v7;

  v9 = objc_loadWeakRetained((id *)p_delegate);
  v10 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overviewWaveformViewController"));
  overviewWaveformViewController = self->_overviewWaveformViewController;
  self->_overviewWaveformViewController = v10;

  -[RCAVWaveformViewController showSelectionOverlayAndEnableInsertMode:](self->_waveformViewController, "showSelectionOverlayAndEnableInsertMode:", v3);
  -[RCAVWaveformViewController showSelectionOverlayAndEnableInsertMode:](self->_overviewWaveformViewController, "showSelectionOverlayAndEnableInsertMode:", v3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_selectedTimeRange
{
  id WeakRetained;
  RCAVWaveformViewController *v4;
  RCAVWaveformViewController *waveformViewController;
  double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v4;

  -[RCAVWaveformViewController selectedTimeRange](self->_waveformViewController, "selectedTimeRange");
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)_refreshAfterEditingOperation:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", a3));
  -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:", v4);

  -[RCAVWaveformViewController nextPreviewStartTime](self->_waveformViewController, "nextPreviewStartTime");
  -[RCMainControllerHelper _reloadWaveformDataSourceAndPreviewAssetWithInitialTime:](self, "_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:");
  -[RCMainControllerHelper _resetSelectedTimeRangeToFullDuration](self, "_resetSelectedTimeRangeToFullDuration");
}

- (void)_markCurrentFileVersionIfNecessary
{
  id v3;

  if (!-[RCUndoTarget sizeOfUndoStack](self->_trimModeUndoTarget, "sizeOfUndoStack"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    objc_msgSend(v3, "markCurrentVersion");

  }
}

- (BOOL)_isSelectionTrimmableByKeepingRange:(id)a3
{
  double v4;
  double v6;

  v4 = RCTimeRangeDeltaWithUIPrecision(a3.var0, a3.var1);
  if (v4 < 1.0)
    return 0;
  -[RCMainControllerHelper currentDuration](self, "currentDuration");
  return v6 - v4 > 0.05;
}

- (BOOL)_isSelectionTrimmableByDeletingRange:(id)a3
{
  double v4;
  double v5;

  v4 = RCTimeRangeDeltaWithUIPrecision(a3.var0, a3.var1);
  if (v4 <= 0.05)
    return 0;
  -[RCMainControllerHelper currentDuration](self, "currentDuration");
  return v5 - v4 >= 1.0;
}

- (void)_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:(double)a3
{
  double v5;
  id WeakRetained;
  RCAVWaveformViewController *v7;
  RCAVWaveformViewController *waveformViewController;
  id v9;
  RCAVWaveformViewController *v10;
  RCAVWaveformViewController *overviewWaveformViewController;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _previewWaveformDataSource](self, "_previewWaveformDataSource"));
  objc_msgSend(v13, "beginLoading");
  objc_msgSend(v13, "duration");
  if (v5 <= a3)
    a3 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformViewController"));
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v7;

  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = (RCAVWaveformViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overviewWaveformViewController"));
  overviewWaveformViewController = self->_overviewWaveformViewController;
  self->_overviewWaveformViewController = v10;

  -[RCAVWaveformViewController reloadWaveformDataSource:initialTime:](self->_waveformViewController, "reloadWaveformDataSource:initialTime:", v13, a3);
  -[RCAVWaveformViewController reloadWaveformDataSource:initialTime:](self->_overviewWaveformViewController, "reloadWaveformDataSource:initialTime:", v13, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  objc_msgSend(v12, "setTargetTime:", a3);

}

- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  -[RCMainControllerHelper setFavorite:forRecordingsWithUUIDs:](self, "setFavorite:forRecordingsWithUUIDs:", v4, v7, v8);
}

- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[RCMainControllerHelper endDescriptionViewTextEditing](self, "endDescriptionViewTextEditing");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor setFavorite:forUUIDs:](self->_recordingsModelInteractor, "setFavorite:forUUIDs:", v4, v6));

  -[RCMainControllerHelper _registerUndoForSetFavorite:changedUUIDs:](self, "_registerUndoForSetFavorite:changedUUIDs:", v4, v7);
}

- (void)_registerUndoForSetFavorite:(BOOL)a3 changedUUIDs:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  BOOL v24;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100096514;
  v22 = &unk_1001AD268;
  v24 = v4;
  v8 = v6;
  v23 = v8;
  objc_msgSend(v7, "registerUndoWithTarget:handler:", self, &v19);
  LODWORD(self) = objc_msgSend(v7, "isUndoing", v19, v20, v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if ((_DWORD)self)
    v11 = CFSTR("REMOVE_FROM_FAVORITES");
  else
    v11 = CFSTR("ADD_TO_FAVORITES");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1001B2BC0, 0));

  v13 = objc_msgSend(v7, "isUndoing");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = v14;
  if (v13)
    v16 = CFSTR("ADD_TO_FAVORITES");
  else
    v16 = CFSTR("REMOVE_FROM_FAVORITES");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1001B2BC0, 0));

  if (v4)
    v18 = v12;
  else
    v18 = v17;
  objc_msgSend(v7, "setActionName:", v18);

}

- (BOOL)isFavoriteForUUID:(id)a3
{
  return -[RCRecordingsModelInteractor isFavoriteForUUID:](self->_recordingsModelInteractor, "isFavoriteForUUID:", a3);
}

- (void)toggleFavoriteForUUID:(id)a3
{
  id v4;

  v4 = a3;
  -[RCMainControllerHelper setFavorite:forRecordingWithUUID:](self, "setFavorite:forRecordingWithUUID:", -[RCMainControllerHelper isFavoriteForUUID:](self, "isFavoriteForUUID:", v4) ^ 1, v4);

}

- (id)compositionForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "savedRecordingUUID"));
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
      v8 = v5;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor compositionLoadedForSavedRecordingUUID:](self->_recordingsModelInteractor, "compositionLoadedForSavedRecordingUUID:", v4));
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isSilenceRemovedForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));

  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    v8 = objc_msgSend(v7, "silenceRemoverEnabled");

  }
  else
  {
    v9 = OSLogForCategory(kVMLogCategoryDefault);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10010DF24();

    v8 = 0;
  }

  return v8;
}

- (double)playbackSpeedForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));

  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    objc_msgSend(v7, "rate");
    v9 = v8;

  }
  else
  {
    v10 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10010DF90();

    v9 = 1.0;
  }

  return v9;
}

- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingID"));

  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    objc_msgSend(v9, "setSilenceRemoverEnabled:", v4);

    -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState");
  }
  else
  {
    v10 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10010DFFC();

  }
}

- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSObject *v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingID"));

  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    v9 = a3;
    *(float *)&v11 = v9;
    objc_msgSend(v10, "setRate:", v11);

    -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState");
  }
  else
  {
    v12 = OSLogForCategory(kVMLogCategoryDefault);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10010E068();

  }
}

- (void)shareRecordingsWithUUIDs:(id)a3 inViewController:(id)a4 source:(id)a5 isShareButton:(BOOL)a6 completionWithItemsHandler:(id)a7
{
  id v11;
  id v12;
  RCRecordingsModelInteractor *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v24 = a4;
  v11 = a5;
  v12 = a7;
  v13 = self->_recordingsModelInteractor;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](v13, "recordingsForUUIDs:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v20)));
        objc_msgSend(v15, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  LOBYTE(v22) = a6;
  +[RCShareMemoViewController presentInViewController:source:compositions:ignoringInteraction:shouldContinuePreparingBlock:preparedToPresentBlock:isShareButton:completionWithItemsHandler:](RCShareMemoViewController, "presentInViewController:source:compositions:ignoringInteraction:shouldContinuePreparingBlock:preparedToPresentBlock:isShareButton:completionWithItemsHandler:", v24, v11, v15, 1, 0, 0, v22, v12);

}

- (id)eraseAndConfirmWithUUIDs:(id)a3 source:(id)a4 collectionViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  RCMainControllerHelper *v27;
  id v28;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_msgSend(v8, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERASE_RECORDINGS"), &stru_1001B2BC0, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v11));

  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE_FOREVER"), &stru_1001B2BC0, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v19 = objc_msgSend(v18, "presentsRecoverConfirmationAsAlert");

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100096D08;
  v25[3] = &unk_1001AD290;
  v26 = v9;
  v27 = self;
  v28 = v8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100096D38;
  v24[3] = &unk_1001AC188;
  v24[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:](self, "_alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:", v15, 0, 1, v19, v10, v25, v17, v24));

  return v22;
}

- (id)eraseAllRecordingsAndConfirmWithSource:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "presentsRecoverConfirmationAsAlert");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ERASE_ALL_MEMOS_CONFIRMATION_ALERT_TITLE"), &stru_1001B2BC0, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100096E84;
  v13[3] = &unk_1001AC188;
  v13[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_FOREVER"), &stru_1001B2BC0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:](self, "_alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:", v8, 0, 1, v6, v4, v13, v10, 0));

  return v11;
}

- (void)_eraseRecordingsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RCMainControllerHelper _stopForUUIDs:](self, "_stopForUUIDs:", v4);
  -[RCMainControllerHelper _removeRecordingsObservationsForUUIDs:](self, "_removeRecordingsObservationsForUUIDs:", v4);
  -[RCRecordingsModelInteractor eraseRecordingsWithUUIDs:](self->_recordingsModelInteractor, "eraseRecordingsWithUUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v5, "userDidEraseRecordingsWithUUIDs:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "undoManager"));
  objc_msgSend(v6, "removeAllActionsWithTarget:", self);

}

- (id)deleteWithUUIDs:(id)a3 source:(id)a4 showInfo:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  __CFString *v27;

  v5 = a5;
  v7 = a3;
  -[RCMainControllerHelper _deleteRecordingsWithUUIDs:isRecover:](self, "_deleteRecordingsWithUUIDs:isRecover:", v7, 0);
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (uint64_t)objc_msgSend(v8, "rc_recentlyDeletedWindow");
    v10 = objc_msgSend(v8, "rc_deletionIsImmediate");
    v11 = objc_msgSend(v8, "BOOLForKey:", CFSTR("kRCDeleteInformationAlertAlreadyShownKey"));
    v12 = 0;
    if ((v10 & 1) != 0 || (v11 & 1) != 0)
      goto LABEL_19;
    v13 = objc_msgSend(v7, "count");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    if (v13 == (id)1)
      v16 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_ONE");
    else
      v16 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_MULTIPLE");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1001B2BC0, 0));

    v18 = 0;
    if (v9 > 6)
    {
      if (v9 == 7)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = v19;
        v21 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_MESSAGE_SEVEN_DAYS");
        goto LABEL_17;
      }
      if (v9 == 30)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = v19;
        v21 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_MESSAGE_THIRTY_DAYS");
        goto LABEL_17;
      }
    }
    else
    {
      if (v9 == -1)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = v19;
        v21 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_MESSAGE_FOREVER");
        goto LABEL_17;
      }
      if (v9 == 1)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = v19;
        v21 = CFSTR("DELETE_MEMO_INFORMATION_ALERT_MESSAGE_ONE_DAY");
LABEL_17:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1001B2BC0, 0));

      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1001B2BC0, 0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000971C4;
    v26[3] = &unk_1001AC188;
    v27 = CFSTR("kRCDeleteInformationAlertAlreadyShownKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 0, v26));
    objc_msgSend(v12, "addAction:", v24);

LABEL_19:
    goto LABEL_20;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (void)performClearAllRecentlyDeleted
{
  void *v3;
  id v4;

  -[RCRecordingsModelInteractor eraseAllDeleted](self->_recordingsModelInteractor, "eraseAllDeleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoManager"));

  objc_msgSend(v4, "removeAllActionsWithTarget:", self);
}

- (id)restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 force:(BOOL)a6 collectionViewController:(id)a7
{
  if (!a6)
    return (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _restoreRecordingsWithUUIDs:isRecover:source:collectionViewController:](self, "_restoreRecordingsWithUUIDs:isRecover:source:collectionViewController:", a3, a4, a5, a7));
  -[RCMainControllerHelper _restoreRecordingsWithUUIDs:isRecover:](self, "_restoreRecordingsWithUUIDs:isRecover:", a3, a4, a5, a6, a7);
  return 0;
}

- (void)deleteRecordingCanceled
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v2, "userDidCancelDeleteRecording");

}

- (void)_deleteRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  BOOL v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v7, "rc_deletionIsImmediate"))
  {
    -[RCMainControllerHelper _stopForUUIDs:](self, "_stopForUUIDs:", v6);
    -[RCMainControllerHelper _removeRecordingsObservationsForUUIDs:](self, "_removeRecordingsObservationsForUUIDs:", v6);
    -[RCRecordingsModelInteractor eraseRecordingsWithUUIDs:](self->_recordingsModelInteractor, "eraseRecordingsWithUUIDs:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v8, "userDidEraseRecordingsWithUUIDs:", v6);

  }
  else
  {
    -[RCMainControllerHelper _stopForUUIDs:](self, "_stopForUUIDs:", v6);
    -[RCRecordingsModelInteractor deleteRecordingsWithUUIDs:](self->_recordingsModelInteractor, "deleteRecordingsWithUUIDs:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v9, "userDidDeleteRecordingsWithUUIDs:", v6);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "undoManager"));

    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100097468;
    v19 = &unk_1001AD2B8;
    v20 = v6;
    v21 = v4;
    objc_msgSend(v11, "registerUndoWithTarget:handler:", self, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v16, v17, v18, v19));
    v13 = v12;
    if (v4)
      v14 = CFSTR("RECOVER_RECORDING_ACTION");
    else
      v14 = CFSTR("DELETE_RECORDING_ACTION");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1001B2BC0, 0));

    objc_msgSend(v11, "setActionName:", v15);
  }

}

- (void)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  BOOL v19;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor restoreRecordingsWithUUIDs:](self->_recordingsModelInteractor, "restoreRecordingsWithUUIDs:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v7, "userDidRecoverRecordingsWithUUIDs:", v6);

  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "undoManager"));

    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1000975DC;
    v17 = &unk_1001AD2B8;
    v18 = v6;
    v19 = v4;
    objc_msgSend(v9, "registerUndoWithTarget:handler:", self, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v14, v15, v16, v17));
    v11 = v10;
    if (v4)
      v12 = CFSTR("RECOVER_RECORDING_ACTION");
    else
      v12 = CFSTR("DELETE_RECORDING_ACTION");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1001B2BC0, 0));

    objc_msgSend(v9, "setActionName:", v13);
  }

}

- (id)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 collectionViewController:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  _BOOL8 v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  RCMainControllerHelper *v28;
  id v29;
  BOOL v30;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = objc_msgSend(v10, "count");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = v14;
  if (v8)
    v16 = CFSTR("Recover %lu Recordings");
  else
    v16 = CFSTR("Permanently Delete %lu Recordings");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1001B2BC0, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v13));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v20 = objc_msgSend(v19, "presentsRecoverConfirmationAsAlert");

  v21 = !v8;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10009778C;
  v26[3] = &unk_1001AD2E0;
  v27 = v11;
  v28 = self;
  v29 = v10;
  v30 = v8;
  v22 = v10;
  v23 = v11;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:](self, "_alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:", 0, 0, v21, v20, v12, v26, v18, 0));

  return v24;
}

- (id)deleteFolder:(id)a3 source:(id)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  RCRecordingsModelInteractor *recordingsModelInteractor;
  id v11;
  void *v12;

  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  recordingsModelInteractor = self->_recordingsModelInteractor;
  v11 = a3;
  if (-[RCRecordingsModelInteractor playableCountForFolder:](recordingsModelInteractor, "playableCountForFolder:", v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _presentFolderDeletionConfirmationForFolder:source:completionBlock:](self, "_presentFolderDeletionConfirmationForFolder:source:completionBlock:", v11, v8, v9));

  }
  else
  {
    -[RCRecordingsModelInteractor deleteUserFolder:](self->_recordingsModelInteractor, "deleteUserFolder:", v11);

    if (v9)
      v9[2](v9, 1);
    v12 = 0;
  }

  return v12;
}

- (id)_presentFolderDeletionConfirmationForFolder:(id)a3 source:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[RCRecordingsModelInteractor playableCountForFolder:](self->_recordingsModelInteractor, "playableCountForFolder:", v8);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(v13, "rc_deletionIsImmediate");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_FOLDER_TITLE_PERMANENT"), &stru_1001B2BC0, 0));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("ERASE_FOLDER_IMMEDIATE");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_FOLDER_TITLE"), &stru_1001B2BC0, 0));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("ERASE_FOLDER");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1001B2BC0, 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v12));

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100097B18;
    v29[3] = &unk_1001AD308;
    v29[4] = self;
    v30 = v8;
    v31 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1001B2BC0, 0));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100097B5C;
    v27[3] = &unk_1001AC630;
    v28 = v31;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:](self, "_alertControllerWithTitle:message:isDestructive:preferredStyle:source:handler:actionTitle:cancelHandler:", v17, v23, 1, 1, v9, v29, v25, v27));

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_addCommandTarget:(id)a3 withHandler:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addTargetWithHandler:", a4));
  if (v6)
    -[NSMapTable setObject:forKey:](self->_commandTargets, "setObject:forKey:", v6, v7);

}

- (void)_updateRemoteControlState:(int64_t)a3
{
  NSMapTable *v5;
  NSMapTable *commandTargets;

  if (self->_remoteControlState != a3)
  {
    self->_remoteControlState = a3;
    -[RCMainControllerHelper _teardownRemoteControlCommands](self, "_teardownRemoteControlCommands");
    if (a3)
    {
      v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
      commandTargets = self->_commandTargets;
      self->_commandTargets = v5;

      if (a3 == 2)
      {
        -[RCMainControllerHelper __setupRemoteControlCommandsForRecordingForeground](self, "__setupRemoteControlCommandsForRecordingForeground");
      }
      else if (a3 == 1)
      {
        -[RCMainControllerHelper __setupRemoteControlCommandsForPlayback](self, "__setupRemoteControlCommandsForPlayback");
      }
    }
  }
}

- (void)_updateNowPlayingInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t remoteControlState;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  -[NSTimer invalidate](self->_nowPlayingUpdateTimer, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](MPNowPlayingInfoCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentRecordingDisplayModel](self, "currentRecordingDisplayModel"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)v5;
  if (!v4 || !self->_remoteControlState || !v5)
  {
    objc_msgSend(v3, "setNowPlayingInfo:", 0);
    objc_msgSend(v3, "setPlaybackState:", 0);
    goto LABEL_19;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeController](self, "timeController"));
  remoteControlState = self->_remoteControlState;
  v10 = 1.0;
  v11 = 0.0;
  v12 = 3.40282347e38;
  if (remoteControlState == 2)
  {
    v15 = 1;
  }
  else
  {
    if (remoteControlState != 1)
      goto LABEL_15;
    objc_msgSend(v4, "duration");
    v12 = v13;
    if (objc_msgSend(v7, "playing"))
      objc_msgSend(v7, "playerTime");
    else
      objc_msgSend(v8, "currentTime");
    v11 = v14;
    objc_msgSend(v7, "rate");
    v10 = v16;
    if (objc_msgSend(v7, "playing"))
      v15 = 1;
    else
      v15 = 2;
  }
  objc_msgSend(v3, "setPlaybackState:", v15);
LABEL_15:
  v22[0] = v6;
  v21[0] = MPMediaItemPropertyTitle;
  v21[1] = MPMediaItemPropertyPlaybackDuration;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  v22[1] = v17;
  v22[2] = &off_1001B73A8;
  v21[2] = MPNowPlayingInfoPropertyMediaType;
  v21[3] = MPNowPlayingInfoPropertyElapsedPlaybackTime;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
  v22[3] = v18;
  v21[4] = MPNowPlayingInfoPropertyPlaybackRate;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
  v22[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 5));
  objc_msgSend(v3, "setNowPlayingInfo:", v20);

  if (objc_msgSend(v7, "playing") && objc_msgSend(v7, "silenceRemoverEnabled"))
    -[RCMainControllerHelper _startNowPlayingUpdateTimerWithPlaybackTime:playbackRate:](self, "_startNowPlayingUpdateTimerWithPlaybackTime:playbackRate:", v11, v10);

LABEL_19:
}

- (void)_startNowPlayingUpdateTimerWithPlaybackTime:(double)a3 playbackRate:(double)a4
{
  void *v7;
  id v8;
  NSTimer *v9;
  NSTimer *nowPlayingUpdateTimer;
  _QWORD v11[4];
  id v12;
  id v13[4];
  id location;

  -[NSTimer invalidate](self->_nowPlayingUpdateTimer, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098014;
  v11[3] = &unk_1001AD330;
  objc_copyWeak(v13, &location);
  v8 = v7;
  v12 = v8;
  v13[1] = *(id *)&a3;
  v13[2] = *(id *)&a4;
  v13[3] = (id)0x3FF0000000000000;
  v9 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v11, 1.0));
  nowPlayingUpdateTimer = self->_nowPlayingUpdateTimer;
  self->_nowPlayingUpdateTimer = v9;

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)__setupRemoteControlCommandsForPlayback
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
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  _UNKNOWN **v15;
  id v16;
  _QWORD v17[4];
  _UNKNOWN **v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  objc_initWeak(location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pauseCommand"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009851C;
  v28[3] = &unk_1001AD358;
  objc_copyWeak(&v29, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v4, v28);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playCommand"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10009858C;
  v26[3] = &unk_1001AD358;
  objc_copyWeak(&v27, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v5, v26);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "togglePlayPauseCommand"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100098618;
  v24[3] = &unk_1001AD358;
  objc_copyWeak(&v25, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v6, v24);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipBackwardCommand"));
  objc_msgSend(v7, "setPreferredIntervals:", &off_1001B7538);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100098688;
  v22[3] = &unk_1001AD358;
  objc_copyWeak(&v23, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v7, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "skipForwardCommand"));
  objc_msgSend(v8, "setPreferredIntervals:", &off_1001B7550);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100098714;
  v20[3] = &unk_1001AD358;
  objc_copyWeak(&v21, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v8, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seekBackwardCommand"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009879C;
  v17[3] = &unk_1001AD380;
  objc_copyWeak(&v19, location);
  v18 = &off_1001B7538;
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v9, v17);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seekForwardCommand"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009882C;
  v14[3] = &unk_1001AD380;
  objc_copyWeak(&v16, location);
  v15 = &off_1001B7538;
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v10, v14);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "changePlaybackPositionCommand"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000988B8;
  v12[3] = &unk_1001AD358;
  objc_copyWeak(&v13, location);
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

- (void)__setupRemoteControlCommandsForRecordingForeground
{
  void ***v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100098A54;
  v10 = &unk_1001AD358;
  objc_copyWeak(&v11, &location);
  v3 = objc_retainBlock(&v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter", v7, v8, v9, v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pauseCommand"));
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v5, v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "togglePlayPauseCommand"));
  -[RCMainControllerHelper _addCommandTarget:withHandler:](self, "_addCommandTarget:withHandler:", v6, v3);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_teardownRemoteControlCommands
{
  NSMapTable *commandTargets;
  NSMapTable *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSMapTable *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  commandTargets = self->_commandTargets;
  if (commandTargets)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = commandTargets;
    v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_commandTargets, "objectForKey:", v9, (_QWORD)v12));
          objc_msgSend(v9, "removeTarget:", v10);

        }
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v11 = self->_commandTargets;
    self->_commandTargets = 0;

  }
}

- (void)_sceneWillDeactivateNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098C40;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_startDisplayLink
{
  -[RCDisplayLinkManager addDisplayLinkObserver:](self->_displayLinkManager, "addDisplayLinkObserver:", self);
}

- (void)_stopDisplayLink
{
  -[RCDisplayLinkManager removeDisplayLinkObserver:](self->_displayLinkManager, "removeDisplayLinkObserver:", self);
}

- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  double v20;
  _BYTE v21[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity", a3, a4));
  if (objc_msgSend(v5, "activityType") || objc_msgSend(v5, "subActivityType") == (id)4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "recording"))
    {
      v19 = 0.0;
      v20 = 0.0;
      if (!objc_msgSend(v7, "monitorRecordingTime:duration:", &v20, &v19))
      {
LABEL_20:

        goto LABEL_21;
      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            if ((objc_opt_respondsToSelector(v13, "timeController:didChangeCurrentTime:didChangeDuration:") & 1) != 0)
              objc_msgSend(v13, "timeController:didChangeCurrentTime:didChangeDuration:", self, v20, v19);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v10);
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
      v8 = v14;
      if (v14 && objc_msgSend(v14, "playing"))
      {
        objc_msgSend(v8, "playerTime");
        -[RCMainControllerHelper setCurrentTime:](self, "setCurrentTime:");
      }
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (BOOL)_transitionToActivityType:(int64_t)a3 toSubType:(int64_t)a4 withDisplayModel:(id)a5 waveformDataSource:(id)a6 composition:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  RCUserActivityTypeTransitionInfo *v24;
  void *v25;
  BOOL v26;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (-[RCMainControllerHelper _requiresUUIDForActivityType:](self, "_requiresUUIDForActivityType:", a3))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));

    if (!v15)
      goto LABEL_8;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  v17 = objc_msgSend(v16, "activityType");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  v19 = objc_msgSend(v18, "subActivityType");

  if (v17 == (id)3)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
    v21 = objc_msgSend(v20, "subActivityType");

    if (v21 == (id)2)
      -[RCUndoTarget setShouldEnableSave:](self->_trimModeUndoTarget, "setShouldEnableSave:", 1);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  v23 = objc_msgSend(v22, "transitionToActivityType:subType:withDisplayModel:", a3, a4, v12);

  if (v23)
  {
    v24 = -[RCUserActivityTypeTransitionInfo initWithToActivityType:toSubType:fromActivityType:fromSubType:displayModel:waveformDataSource:composition:]([RCUserActivityTypeTransitionInfo alloc], "initWithToActivityType:toSubType:fromActivityType:fromSubType:displayModel:waveformDataSource:composition:", a3, a4, v17, v19, v12, v13, v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v25, "didTransitionWithTransitionInfo:", v24);

    v26 = 1;
  }
  else
  {
LABEL_8:
    v26 = 0;
  }

  return v26;
}

- (BOOL)_performRecordingEndTransitionWithUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
  v6 = objc_msgSend(v5, "requiresDismissalAtEndOfCapture");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "isQuickRecordingWorkflowDismissal");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v4));
  if (v9)
  {
    if (v6 | v8)
      v10 = 0;
    else
      v10 = 3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    v12 = -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", v10, 0, v9, 0, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_transitionToIdleForItemWithUUID:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", a3));
  if (v4)
  {
    if (self->_scrubState == 1)
    {
      v5 = 6;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
      v8 = objc_msgSend(v7, "isTrim");

      if (v8)
        v5 = 2;
      else
        v5 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    v6 = -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", 0, v5, v4, 0, v9);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_transitionToPlayingBackForItemWithUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _previewWaveformDataSource](self, "_previewWaveformDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    v7 = -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", 2, 0, v4, v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_requiresUUIDForActivityType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return v3;
}

- (void)_undoCaptureFragment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RCUndoTarget *editModeUndoTarget;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  RCMainControllerHelper *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  if (objc_msgSend(v3, "undoEditing"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingID"));
    -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
    editModeUndoTarget = self->_editModeUndoTarget;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100099390;
    v16 = &unk_1001AD3A8;
    v17 = self;
    v18 = v5;
    v8 = v5;
    objc_msgSend(v6, "registerUndoWithTarget:handler:", editModeUndoTarget, &v13);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager", v13, v14, v15, v16, v17));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TITLE_FOR_OVERDUB_REDO"), &stru_1001B2BC0, 0));
    objc_msgSend(v9, "setActionName:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v12, "enableUndoFirstResponder");

  }
}

- (void)_undoTrim:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  RCUndoTarget *trimModeUndoTarget;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  if (objc_msgSend(v5, "undoEditing"))
  {
    -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", -1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));
    -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "undoManager"));

    trimModeUndoTarget = self->_trimModeUndoTarget;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000994DC;
    v12[3] = &unk_1001AD3D0;
    v12[4] = self;
    v12[5] = a3;
    -[NSObject registerUndoWithTarget:handler:](v8, "registerUndoWithTarget:handler:", trimModeUndoTarget, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _undoActionNameForTrimMode:isUndo:](self, "_undoActionNameForTrimMode:isUndo:", a3, 0));
    -[NSObject setActionName:](v8, "setActionName:", v10);

  }
  else
  {
    v11 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10010E0D4(self, v8);
  }

}

- (void)_redoTrim:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  RCUndoTarget *trimModeUndoTarget;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  if (objc_msgSend(v5, "redoEditing"))
  {
    -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));
    -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "undoManager"));

    trimModeUndoTarget = self->_trimModeUndoTarget;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100099628;
    v12[3] = &unk_1001AD3D0;
    v12[4] = self;
    v12[5] = a3;
    -[NSObject registerUndoWithTarget:handler:](v8, "registerUndoWithTarget:handler:", trimModeUndoTarget, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _undoActionNameForTrimMode:isUndo:](self, "_undoActionNameForTrimMode:isUndo:", a3, 1));
    -[NSObject setActionName:](v8, "setActionName:", v10);

  }
  else
  {
    v11 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10010E160(self, v8);
  }

}

- (void)_redoCaptureFragmentWithCompositionControllerRedoInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  RCUndoTarget *editModeUndoTarget;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder", a3));
  if (objc_msgSend(v4, "redoEditing"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));
    -[RCMainControllerHelper _refreshAfterEditingOperation:](self, "_refreshAfterEditingOperation:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
    editModeUndoTarget = self->_editModeUndoTarget;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100099764;
    v12[3] = &unk_1001AD220;
    v12[4] = self;
    objc_msgSend(v6, "registerUndoWithTarget:handler:", editModeUndoTarget, v12);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TITLE_FOR_OVERDUB_UNDO"), &stru_1001B2BC0, 0));
    objc_msgSend(v8, "setActionName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    objc_msgSend(v11, "enableUndoFirstResponder");

  }
}

- (id)_undoActionNameForTrimMode:(int64_t)a3 isUndo:(BOOL)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;

  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (a4)
      v6 = CFSTR("TITLE_FOR_TRIM_TO_RANGE_UNDO");
    else
      v6 = CFSTR("TITLE_FOR_TRIM_TO_RANGE_REDO");
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (a4)
      v6 = CFSTR("TITLE_FOR_DELETE_RANGE_UNDO");
    else
      v6 = CFSTR("TITLE_FOR_DELETE_RANGE_REDO");
LABEL_10:
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1001B2BC0, 0));

    return v7;
  }
  v7 = 0;
  return v7;
}

- (void)_beginSelectionEditingModeAction
{
  -[RCMainControllerHelper _setIsInSelectionEditingMode:forInsertMode:](self, "_setIsInSelectionEditingMode:forInsertMode:", 1, 0);
}

- (void)_adjustCurrentTrimOperationUndoCount:(int64_t)a3
{
  RCUndoTarget *trimModeUndoTarget;

  trimModeUndoTarget = self->_trimModeUndoTarget;
  if (a3)
    a3 += -[RCUndoTarget sizeOfUndoStack](self->_trimModeUndoTarget, "sizeOfUndoStack");
  -[RCUndoTarget setSizeOfUndoStack:](trimModeUndoTarget, "setSizeOfUndoStack:", a3);
  -[RCMainControllerHelper _updateTrimSaveEnabledState](self, "_updateTrimSaveEnabledState");
}

- (void)_clearTrimModeUndoStack
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper undoManager](self, "undoManager"));
  objc_msgSend(v3, "removeAllActionsWithTarget:", self->_trimModeUndoTarget);

  -[RCMainControllerHelper _adjustCurrentTrimOperationUndoCount:](self, "_adjustCurrentTrimOperationUndoCount:", 0);
}

- (void)_updateTrimSaveEnabledState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v3, "shouldEnableTrimSave:", -[RCMainControllerHelper _shouldEnableTrimSave](self, "_shouldEnableTrimSave"));

}

- (BOOL)_shouldEnableTrimSave
{
  if (-[RCUndoTarget sizeOfUndoStack](self->_trimModeUndoTarget, "sizeOfUndoStack") <= 0)
    return -[RCUndoTarget shouldEnableSave](self->_trimModeUndoTarget, "shouldEnableSave");
  else
    return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a4;
  if (self->_audioProperties == a6)
  {
    v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

    LOBYTE(v12) = objc_msgSend(v13, "isEqual:", v14);
    if ((v12 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
      v16 = v15;
      if (v15 && objc_msgSend(v15, "playing"))
        self->_hasDeferredContentChanges = 1;
      else
        -[RCMainControllerHelper _audioContentOrDurationDidChange:](self, "_audioContentOrDurationDidChange:", v10);

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RCMainControllerHelper;
    v11 = a5;
    -[RCMainControllerHelper observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, v10, v11, a6);

  }
}

- (void)_addRecordingObservations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v6 = objc_opt_class(NSManagedObject, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (-[NSMutableSet containsObject:](self->_recordingObservances, "containsObject:", v4) & 1) == 0)
  {
    v7 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10010E1EC(v4);

    -[NSMutableSet addObject:](self->_recordingObservances, "addObject:", v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_audioProperties;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), 3, self->_audioProperties, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_removeRecordingObservations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v6 = objc_opt_class(NSManagedObject, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[NSMutableSet containsObject:](self->_recordingObservances, "containsObject:", v4))
  {
    v7 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10010E270(v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_audioProperties;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), self->_audioProperties, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    -[NSMutableSet removeObject:](self->_recordingObservances, "removeObject:", v4);
  }

}

- (void)_removeRecordingsObservationsForUUIDs:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingsForUUIDs:](self->_recordingsModelInteractor, "recordingsForUUIDs:", a3));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSManagedObject, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          -[RCMainControllerHelper _removeRecordingObservations:](self, "_removeRecordingObservations:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_audioContentOrDurationDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", v4));
  -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  objc_msgSend(v4, "length");
  v7 = v6;

  objc_msgSend(v5, "recordingDurationUpdated:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  if (objc_msgSend(v8, "playing"))
    objc_msgSend(v8, "stopPlaying");

}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099F94;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A034;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A0D4;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setAllowedTimeRange:(id)a3
{
  double var1;
  double var0;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  if (RCTimeRangeEqualToTimeRange(a3.var0, a3.var1, RCTimeRangeEverything[0], RCTimeRangeEverything[1]))
  {
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10010E2F4(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  self->_allowedTimeRange.beginTime = var0;
  self->_allowedTimeRange.endTime = var1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "setPlayableRange:", var0, var1);

}

- (int64_t)timeControllerState
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "recording") & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "playing");
    else
      v5 = 0;

  }
  return v5;
}

- (NSHashTable)timeObservers
{
  NSHashTable *timeObservers;
  NSHashTable *v4;
  NSHashTable *v5;

  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v5 = self->_timeObservers;
    self->_timeObservers = v4;

    timeObservers = self->_timeObservers;
  }
  return timeObservers;
}

- (void)pauseTime
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioPlayer](self, "audioPlayer"));
  if (v5)
    objc_msgSend(v5, "stopPlaying");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stopRecording");

}

- (void)addTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeObservers](self, "timeObservers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper timeObservers](self, "timeObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activityWaveformProcessor"));

  return (RCActivityWaveformProcessor *)v3;
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "liveTranscription"));

  return (_TtC10VoiceMemos19RCLiveTranscription *)v3;
}

- (void)setTargetTime:(double)a3
{
  VMAudioPlayer *audioPlayer;

  self->_targetTime = a3;
  audioPlayer = self->_audioPlayer;
  if (audioPlayer)
    -[VMAudioPlayer setPlayerTime:](audioPlayer, "setPlayerTime:", a3);
  if ((id)-[RCMainControllerHelper timeControllerState](self, "timeControllerState") != (id)2)
    -[RCMainControllerHelper setCurrentTime:](self, "setCurrentTime:", a3);
}

- (void)setCurrentRate:(float)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  self->_currentRate = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "timeController:didChangeRate:") & 1) != 0)
        {
          *(float *)&v11 = a3;
          objc_msgSend(v10, "timeController:didChangeRate:", self, v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)setCurrentTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_currentTime = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingOrSelectedRecording](self, "uuidOfPlayingOrSelectedRecording"));
  objc_msgSend(v5, "setCurrentTime:withUUID:", v6, a3);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "timeController:didChangeCurrentTime:") & 1) != 0)
          objc_msgSend(v12, "timeController:didChangeCurrentTime:", self, a3);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setPlaybackError:(id)a3
{
  objc_storeStrong((id *)&self->_playbackError, a3);
}

- (void)setRecordingError:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_recordingError, a3);
  if (v5)
  {
    v6 = objc_retainBlock(self->_recordingErrorHandler);
    v7 = v6;
    if (v6)
      ((void (*)(NSObject *, id))v6[2].isa)(v6, v5);
  }
  else
  {
    v8 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010E364(v7, v9, v10);
  }

}

- (double)currentDuration
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v9;
  double v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "recording"))
  {
    v10 = 0.0;
    v11 = 0;
    if (objc_msgSend(v4, "monitorRecordingTime:duration:", &v11, &v10))
    {
      v5 = v10;
    }
    else
    {
      objc_msgSend(v4, "idleDuration");
      v5 = v9;
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentRecordingDisplayModel](self, "currentRecordingDisplayModel"));
    objc_msgSend(v6, "duration");
    v5 = v7;

  }
  return v5;
}

- (void)_checkAudioPlayer:(id)a3
{
  void *v3;
  id v5;
  double v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  double v22;
  void *v23;
  RCRecordingsModelInteractor *recordingsModelInteractor;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  double v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v5 = a3;
  if (!objc_msgSend(v5, "playing"))
  {
    LODWORD(v6) = 0;
    -[RCMainControllerHelper setCurrentRate:](self, "setCurrentRate:", v6);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v21, "timeController:didChangeRate:") & 1) != 0)
          {
            LODWORD(v22) = 0;
            objc_msgSend(v21, "timeController:didChangeRate:", self, v22);
          }
          if ((objc_opt_respondsToSelector(v21, "timeController:didChangeState:") & 1) != 0)
            objc_msgSend(v21, "timeController:didChangeState:", self, 0);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v18);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
    -[RCMainControllerHelper _transitionToIdleForItemWithUUID:](self, "_transitionToIdleForItemWithUUID:", v23);

    -[RCMainControllerHelper _stopDisplayLink](self, "_stopDisplayLink");
    if (!self->_hasDeferredContentChanges)
      goto LABEL_37;
    recordingsModelInteractor = self->_recordingsModelInteractor;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsModelInteractor recordingForUUID:](recordingsModelInteractor, "recordingForUUID:", v25));

    if (v12)
    {
      -[RCMainControllerHelper _audioContentOrDurationDidChange:](self, "_audioContentOrDurationDidChange:", v12);
      self->_hasDeferredContentChanges = 0;
    }
LABEL_36:

LABEL_37:
    -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState");
    goto LABEL_38;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "isRunningTest");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    objc_msgSend(v10, "ppt_didStartVoiceMemoPreviewPlayback");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v11));

  if (v12)
  {
    v36 = v5;
    objc_msgSend(v12, "setIsPlaying:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
    v14 = objc_msgSend(v13, "isTrim");
    if (v14)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentUserActivity](self, "currentUserActivity"));
      v15 = objc_msgSend(v3, "subActivityType");
    }
    else
    {
      v15 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper _previewWaveformDataSource](self, "_previewWaveformDataSource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    -[RCMainControllerHelper _transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:](self, "_transitionToActivityType:toSubType:withDisplayModel:waveformDataSource:composition:", 2, v15, v12, v26, v27);

    if (v14)
    +[RCAnalyticsUtilities sendDidPlaybackVoiceMemo](RCAnalyticsUtilities, "sendDidPlaybackVoiceMemo");
    -[RCMainControllerHelper _startDisplayLink](self, "_startDisplayLink");
    LODWORD(v28) = 1.0;
    -[RCMainControllerHelper setCurrentRate:](self, "setCurrentRate:", v28);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timeObservers, "allObjects"));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          if ((objc_opt_respondsToSelector(v34, "timeController:didChangeRate:") & 1) != 0)
          {
            LODWORD(v35) = 1.0;
            objc_msgSend(v34, "timeController:didChangeRate:", self, v35);
          }
          if ((objc_opt_respondsToSelector(v34, "timeController:didChangeState:") & 1) != 0)
            objc_msgSend(v34, "timeController:didChangeState:", self, 1);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v31);
    }

    v5 = v36;
    goto LABEL_36;
  }
LABEL_38:

}

- (void)setAudioPlayer:(id)a3
{
  id v5;
  RCKeyPathObservance *playerObservance;
  RCKeyPathObservance *v7;
  void *v8;
  uint64_t v9;
  RCKeyPathObservance *v10;
  RCKeyPathObservance *v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  RCMainControllerHelper *v16;
  id v17;

  v5 = a3;
  playerObservance = self->_playerObservance;
  if (playerObservance)
  {
    -[RCKeyPathObservance remove](playerObservance, "remove");
    v7 = self->_playerObservance;
    self->_playerObservance = 0;

  }
  objc_storeStrong((id *)&self->_audioPlayer, a3);
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "playing"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10009AD24;
    v15 = &unk_1001AC8D0;
    v16 = self;
    v17 = v5;
    v9 = RCObserveChangesToKeyPath(v17, v8, &v12);
    v10 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue(v9);
    v11 = self->_playerObservance;
    self->_playerObservance = v10;

  }
  -[RCMainControllerHelper _reconcileAudioStateWithApplicationState](self, "_reconcileAudioStateWithApplicationState", v12, v13, v14, v15, v16);

}

- (void)setAudioRecorder:(id)a3
{
  id v5;
  VMAudioRecorder *audioRecorder;
  RCKeyPathObservance *recorderObservance;
  RCKeyPathObservance *v8;
  NSArray *audioVersions;
  void *v10;
  id v11;
  uint64_t v12;
  RCKeyPathObservance *v13;
  RCKeyPathObservance *v14;
  id v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v5 = a3;
  audioRecorder = self->_audioRecorder;
  if (audioRecorder)
    -[VMAudioRecorder setController:](audioRecorder, "setController:", 0);
  recorderObservance = self->_recorderObservance;
  if (recorderObservance)
  {
    -[RCKeyPathObservance remove](recorderObservance, "remove");
    v8 = self->_recorderObservance;
    self->_recorderObservance = 0;

  }
  audioVersions = self->_audioVersions;
  if (audioVersions)
  {
    self->_audioVersions = 0;

  }
  objc_storeStrong((id *)&self->_audioRecorder, a3);
  if (self->_audioRecorder)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "recording"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10009AF24;
    v21[3] = &unk_1001AD3F8;
    objc_copyWeak(&v23, &location);
    v11 = v5;
    v22 = v11;
    v12 = RCObserveChangesToKeyPath(v11, v10, v21);
    v13 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue(v12);
    v14 = self->_recorderObservance;
    self->_recorderObservance = v13;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009AF8C;
    v19[3] = &unk_1001ACB88;
    v19[4] = self;
    v15 = v11;
    v20 = v15;
    v16 = objc_retainBlock(v19);
    -[RCMainControllerHelper setRecordingErrorHandler:](self, "setRecordingErrorHandler:", v16);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "versions"));
    v18 = self->_audioVersions;
    self->_audioVersions = v17;

    -[VMAudioRecorder setController:](self->_audioRecorder, "setController:", self);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    -[RCMainControllerHelper setRecordingErrorHandler:](self, "setRecordingErrorHandler:", 0);
  }

}

- (id)_previewWaveformDataSource
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper audioRecorder](self, "audioRecorder"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "recording"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waveformDataSource"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper currentComposition](self, "currentComposition"));
    if (v6)
      v5 = objc_msgSend(objc_alloc((Class)RCCompositionWaveformDataSource), "initWithComposition:", v6);
    else
      v5 = 0;

  }
  return v5;
}

- (void)_reconcileAudioStateWithApplicationState
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[RecorderAppDelegate sharedAppDelegate](RecorderAppDelegate, "sharedAppDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "defaultSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connectedLockScreenSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dynamicIslandSceneDelegate"));
  v6 = objc_msgSend(v3, "isInForeground");
  v7 = v6 | objc_msgSend(v4, "isInForeground");
  v8 = -[RCMainControllerHelper isPlaying](self, "isPlaying");
  v9 = -[RCMainControllerHelper isPaused](self, "isPaused");
  v10 = -[RCMainControllerHelper isRecording](self, "isRecording");
  if ((objc_msgSend(v3, "isInAndromeda") & 1) != 0
    || (objc_msgSend(v4, "isInAndromeda") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v11 = (uint64_t)objc_msgSend(v5, "isInAndromeda");
  }
  -[RCDisplayLinkManager setPaused:](self->_displayLinkManager, "setPaused:", v11);
  if (((v8 | v10 | v7) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    objc_msgSend(v12, "deactivateAudioSession");

  }
  if ((v7 & v10) != 0)
    v13 = 2;
  else
    v13 = v8 | v9 & v7;
  -[RCMainControllerHelper _updateRemoteControlState:](self, "_updateRemoteControlState:", v13);
  -[RCMainControllerHelper _updateNowPlayingInfo](self, "_updateNowPlayingInfo");

}

- (id)_alertControllerWithTitle:(id)a3 message:(id)a4 isDestructive:(BOOL)a5 preferredStyle:(int64_t)a6 source:(id)a7 handler:(id)a8 actionTitle:(id)a9 cancelHandler:(id)a10
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v12 = a5;
  v15 = a8;
  v16 = a9;
  v17 = a10;
  if (a7)
    v18 = a6;
  else
    v18 = 1;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, v18));
  if (v12)
    v20 = 2;
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, v20, v15));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 1, v17));

  v36[0] = v21;
  v36[1] = v24;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v19, "addAction:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), (_QWORD)v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v27);
  }

  return v19;
}

- (id)uuidOfPlayingOrSelectedRecording
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper uuidOfPlayingRecording](self, "uuidOfPlayingRecording"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainControllerHelper delegate](self, "delegate"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedUUID"));

  }
  return v5;
}

- (void)promptForRatingIfNeeded
{
  -[RCAppStoreRatingPrompter promptForRatingIfNeeded](self->_appStoreRatingPrompter, "promptForRatingIfNeeded");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)allowedTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_allowedTimeRange.beginTime;
  endTime = self->_allowedTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (float)targetRate
{
  return self->_targetRate;
}

- (void)setTargetRate:(float)a3
{
  self->_targetRate = a3;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (float)currentRate
{
  return self->_currentRate;
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (RCMainControllerHelperDelegate)delegate
{
  return (RCMainControllerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setUuidOfPlayingRecording:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (_TtC10VoiceMemos28RCUserActivityStatePublisher)activityStatePublisher
{
  return (_TtC10VoiceMemos28RCUserActivityStatePublisher *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)shouldSaveAsNew
{
  return self->_shouldSaveAsNew;
}

- (void)setShouldSaveAsNew:(BOOL)a3
{
  self->_shouldSaveAsNew = a3;
}

- (void)setTimeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_timeObservers, a3);
}

- (VMAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (id)recordingErrorHandler
{
  return self->_recordingErrorHandler;
}

- (void)setRecordingErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)audioVersions
{
  return self->_audioVersions;
}

- (void)setAudioVersions:(id)a3
{
  objc_storeStrong((id *)&self->_audioVersions, a3);
}

- (RCKeyPathObservance)playerObservance
{
  return self->_playerObservance;
}

- (void)setPlayerObservance:(id)a3
{
  objc_storeStrong((id *)&self->_playerObservance, a3);
}

- (RCKeyPathObservance)recorderObservance
{
  return self->_recorderObservance;
}

- (void)setRecorderObservance:(id)a3
{
  objc_storeStrong((id *)&self->_recorderObservance, a3);
}

- (RCKeyPathObservance)finalizingRecordingsObservance
{
  return self->_finalizingRecordingsObservance;
}

- (void)setFinalizingRecordingsObservance:(id)a3
{
  objc_storeStrong((id *)&self->_finalizingRecordingsObservance, a3);
}

- (void)setCurrentUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserActivity, a3);
}

- (RCComposition)currentComposition
{
  return self->_currentComposition;
}

- (void)setCurrentComposition:(id)a3
{
  objc_storeStrong((id *)&self->_currentComposition, a3);
}

- (RCAVWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformViewController, a3);
}

- (RCAVWaveformViewController)overviewWaveformViewController
{
  return self->_overviewWaveformViewController;
}

- (void)setOverviewWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overviewWaveformViewController, a3);
}

- (id)endTrimReloadDataSourceBlock
{
  return self->_endTrimReloadDataSourceBlock;
}

- (void)setEndTrimReloadDataSourceBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (RCUndoTarget)trimModeUndoTarget
{
  return self->_trimModeUndoTarget;
}

- (void)setTrimModeUndoTarget:(id)a3
{
  objc_storeStrong((id *)&self->_trimModeUndoTarget, a3);
}

- (RCUndoTarget)editModeUndoTarget
{
  return self->_editModeUndoTarget;
}

- (void)setEditModeUndoTarget:(id)a3
{
  objc_storeStrong((id *)&self->_editModeUndoTarget, a3);
}

- (BOOL)didTrimPlayback
{
  return self->_didTrimPlayback;
}

- (void)setDidTrimPlayback:(BOOL)a3
{
  self->_didTrimPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editModeUndoTarget, 0);
  objc_storeStrong((id *)&self->_trimModeUndoTarget, 0);
  objc_storeStrong(&self->_endTrimReloadDataSourceBlock, 0);
  objc_storeStrong((id *)&self->_overviewWaveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_currentComposition, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_finalizingRecordingsObservance, 0);
  objc_storeStrong((id *)&self->_recorderObservance, 0);
  objc_storeStrong((id *)&self->_playerObservance, 0);
  objc_storeStrong((id *)&self->_audioVersions, 0);
  objc_storeStrong(&self->_recordingErrorHandler, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_activityStatePublisher, 0);
  objc_storeStrong((id *)&self->_currentRecordingDisplayModel, 0);
  objc_storeStrong((id *)&self->_uuidOfPlayingRecording, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_appStoreRatingPrompter, 0);
  objc_storeStrong((id *)&self->_nowPlayingUpdateTimer, 0);
  objc_storeStrong((id *)&self->_commandTargets, 0);
  objc_destroyWeak((id *)&self->_recordingUnavailableAlertController);
  objc_storeStrong((id *)&self->_recordingObservances, 0);
  objc_storeStrong((id *)&self->_audioProperties, 0);
  objc_storeStrong((id *)&self->_recordingsModelInteractor, 0);
  objc_storeStrong((id *)&self->_displayLinkManager, 0);
}

@end
