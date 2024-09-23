@implementation RecorderAppDelegate

+ (RecorderAppDelegate)sharedAppDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (RecorderAppDelegate *)v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((RCIsBeingUnitTested(self, a2, a3, a4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    objc_msgSend(v5, "updateDeviceIsSupported");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    +[RCAppIntentsManager setupIntentSceneConfiguratorWithWindowScene:](_TtC10VoiceMemos19RCAppIntentsManager, "setupIntentSceneConfiguratorWithWindowScene:", v8);

    +[RCAppIntentsManager registerDependencies](_TtC10VoiceMemos19RCAppIntentsManager, "registerDependencies");
  }
  return 1;
}

- (UIWindow)window
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  return (UIWindow *)v3;
}

- (RCDefaultSceneDelegate)defaultSceneDelegate
{
  RCDefaultSceneDelegate **p_defaultSceneDelegate;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  p_defaultSceneDelegate = &self->_defaultSceneDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);

  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9), "delegate"));
          v12 = objc_opt_class(RCDefaultSceneDelegate, v11);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
            objc_storeWeak((id *)p_defaultSceneDelegate, v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    v13 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);

    if (!v13)
    {
      v14 = OSLogForCategory(kVMLogCategoryDefault);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10001CD94(v15);

    }
  }
  return (RCDefaultSceneDelegate *)objc_loadWeakRetained((id *)p_defaultSceneDelegate);
}

- (void)ppt_didShowVoiceMemosList
{
  if ((byte_1001ED7F8 & 1) == 0
    && ((objc_msgSend((id)qword_1001ED7E8, "containsString:", CFSTR("ShowVoiceMemosList")) & 1) != 0
     || objc_msgSend((id)qword_1001ED7E8, "containsString:", CFSTR("WarmShowVoiceMemosList"))))
  {
    _objc_msgSend(UIApp, "finishedTest:", qword_1001ED7E8);
  }
}

- (void)performDeferredInitialization
{
  RCRecorderAppDelegateDependencyContainer *v3;
  RCRecorderAppDelegateDependencyContainer *dependencyContainer;

  v3 = objc_alloc_init(RCRecorderAppDelegateDependencyContainer);
  dependencyContainer = self->_dependencyContainer;
  self->_dependencyContainer = v3;

  objc_storeWeak((id *)&self->_stateObserver, self->_dependencyContainer);
}

- (void)defaultSceneDidBecomeActive
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
  objc_msgSend(WeakRetained, "defaultSceneDidBecomeActive");

}

- (void)applicationWillTerminate:(id)a3
{
  RCRecorderAppDelegateStateObserving **p_stateObserver;
  id v4;
  id WeakRetained;

  p_stateObserver = &self->_stateObserver;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_stateObserver);
  objc_msgSend(WeakRetained, "applicationWillTerminateWithApplication:", v4);

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  __objc2_class **v12;
  void *v13;
  unsigned int v14;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v8 = objc_msgSend(v6, "initWithName:sessionRole:", 0, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v10 = objc_msgSend(v9, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if ((v10 & 1) != 0)
  {
    v12 = off_1001AA3D0;
LABEL_5:
    objc_msgSend(v8, "setDelegateClass:", objc_opt_class(*v12, v11));
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v14 = objc_msgSend(v13, "isEqualToString:", _UIWindowSceneSessionTypeCoverSheet);

  if (v14)
  {
    v12 = &off_1001AA3D8;
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (void)buildMenuWithBuilder:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "system"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCMenuBarManager sharedMenuBarManager](RCMenuBarManager, "sharedMenuBarManager"));
    objc_msgSend(v6, "buildMenuWithBuilder:", v7);

  }
}

- (id)defaultScene
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  return v4;
}

- (BOOL)isLockScreenActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate lockScreenSceneDelegate](self, "lockScreenSceneDelegate"));
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)reconcileApplicationState
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainControllerHelper"));
  objc_msgSend(v3, "reconcileApplicationState");

}

- (BOOL)accessibilityPerformMagicTap
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate"));
  v3 = objc_msgSend(v2, "performActionForMagicTap");

  return v3;
}

- (id)lockScreenSceneDelegate
{
  RCLockScreenSceneDelegate **p_lockScreenSceneDelegate;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  p_lockScreenSceneDelegate = &self->_lockScreenSceneDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenSceneDelegate);

  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "delegate"));
          v12 = objc_opt_class(RCLockScreenSceneDelegate, v11);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
            objc_storeWeak((id *)p_lockScreenSceneDelegate, v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return objc_loadWeakRetained((id *)p_lockScreenSceneDelegate);
}

- (RCPlatterSceneDelegate)dynamicIslandSceneDelegate
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7), "delegate", (_QWORD)v17));
        v10 = objc_opt_class(RCPlatterSceneDelegate, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {
          v11 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platterViewController"));
          v13 = objc_msgSend(v12, "presentationStyle");

          if (!v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platterViewController"));
            v15 = objc_msgSend(v14, "activeLayoutMode");

            if (v15 != (id)-1)
            {

              goto LABEL_14;
            }
          }

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return (RCPlatterSceneDelegate *)v11;
}

- (RCPlatterSceneDelegate)platterSceneDelegate
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "delegate", (_QWORD)v12));
      v10 = objc_opt_class(RCPlatterSceneDelegate, v9);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        break;

      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return (RCPlatterSceneDelegate *)v8;
}

- (RCRecorderAppDelegateDependencyContainer)dependencyContainer
{
  return self->_dependencyContainer;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateObserver);
  objc_storeStrong((id *)&self->_dependencyContainer, 0);
  objc_destroyWeak((id *)&self->_lockScreenSceneDelegate);
  objc_destroyWeak((id *)&self->_defaultSceneDelegate);
}

- (id)_splitViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "splitViewController"));

  return v3;
}

- (id)_mainViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));

  return v5;
}

- (id)_recordingViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeFolderViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));

  return v4;
}

- (id)currentSelectedRecordingCell
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingsCollectionView](self, "_recordingsCollectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForItemAtIndexPath:", v4));
  v7 = objc_opt_class(RCRecordingCollectionViewCell, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  v9 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingsCollectionView](self, "_recordingsCollectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v11));

  }
  return v9;
}

- (id)_recordingsCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeFolderViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingsCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  return v5;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&qword_1001ED7E8, a4);
  objc_storeStrong(&qword_1001ED7F0, a5);
  objc_msgSend(v9, "containsString:", CFSTR("Landscape"));
  byte_1001ED7F8 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v18, &location);
  v11 = v9;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController", _NSConcreteStackBlock, 3221225472, sub_100020830, &unk_1001AB560));
  objc_msgSend(v13, "setForegroundCompletionBlock:", &v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_performTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "containsString:", CFSTR("ScrollVoiceMemosList")))
  {
    -[RecorderAppDelegate startScrollVoiceMemosListTest:](self, "startScrollVoiceMemosListTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("CornobbleScrollAllRecordings")))
  {
    -[RecorderAppDelegate startCornobbleScrollAllRecordingsTest:](self, "startCornobbleScrollAllRecordingsTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("ScrollVoiceMemosEditList")))
  {
    -[RecorderAppDelegate startScrollVoiceMemosEditListTest:](self, "startScrollVoiceMemosEditListTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("RecordNewVoiceMemo")))
  {
    -[RecorderAppDelegate startRecordNewVoiceMemoTest:](self, "startRecordNewVoiceMemoTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("GlitchRecordNewVoiceMemo")))
  {
    -[RecorderAppDelegate glitchStartRecordNewVoiceMemoTest:](self, "glitchStartRecordNewVoiceMemoTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("OpenCloseEditCard")))
  {
    -[RecorderAppDelegate openCloseEditCardTest:](self, "openCloseEditCardTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("CyclerRecordNewVoiceMemo")))
  {
    -[RecorderAppDelegate startCyclerRecordNewVoiceMemoTest:](self, "startCyclerRecordNewVoiceMemoTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("CyclerStopRecordingVoiceMemo")))
  {
    -[RecorderAppDelegate startCyclerEndRecordingTest:](self, "startCyclerEndRecordingTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("PlaySelectedVoiceMemo")))
  {
    -[RecorderAppDelegate startPlaySelectedVoiceMemoTest:](self, "startPlaySelectedVoiceMemoTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("OpenFoldersSidebar")))
  {
    -[RecorderAppDelegate startOpenFoldersSidebarTest:](self, "startOpenFoldersSidebarTest:", v6);
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("PagingScrollPlaybackCardWaveform")))
  {
    -[RecorderAppDelegate startPagingScrollPlaybackCardWaveformTest:](self, "startPagingScrollPlaybackCardWaveformTest:", v6);
  }

}

- (void)ppt_didFinishPostLaunchTasks:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VoiceMemosLaunchPostTasksCompleted"), self);

}

- (void)ppt_didShowVoiceMemoEditor
{
  if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("OpenCloseEditCard")))
    -[RecorderAppDelegate _closeEditCardAndFinishTest](self, "_closeEditCardAndFinishTest");
}

- (void)ppt_didStartRecording
{
  if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("RecordNewVoiceMemo")))
  {
    _objc_msgSend(UIApp, "finishedTest:");
  }
  else if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("GlitchRecordNewVoiceMemo")))
  {
    -[RecorderAppDelegate _finishGlitchRecording](self, "_finishGlitchRecording");
  }
}

- (void)ppt_didStartCyclerRecording
{
  if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("CyclerRecordNewVoiceMemo")))
    _objc_msgSend(UIApp, "finishedTest:", qword_1001ED7E8);
}

- (void)ppt_didEndCyclerRecording
{
  if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("CyclerStopRecordingVoiceMemo")))
    _objc_msgSend(UIApp, "finishedTest:", qword_1001ED7E8);
}

- (void)ppt_didStartVoiceMemoPreviewPlayback
{
  if (objc_msgSend((id)qword_1001ED7E8, "isEqualToString:", CFSTR("PlaySelectedVoiceMemo")))
    _objc_msgSend(UIApp, "finishedTest:", qword_1001ED7E8);
}

- (void)startShowVoiceMemosListTest:(id)a3 warm:(BOOL)a4
{
  byte_1001ED7F8 = 1;
}

- (void)startScrollVoiceMemosListTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeFolderViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingsCollectionViewController"));

  v9 = 0;
  if (-[RecorderAppDelegate _selectFirstVoiceMemoInCollectionViewController:errorString:](self, "_selectFirstVoiceMemoInCollectionViewController:errorString:", v7, &v9))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));
    -[RecorderAppDelegate performLegacyScrollTestForCollectionView:withOptions:](self, "performLegacyScrollTestForCollectionView:withOptions:", v8, v4);

  }
}

- (void)startCornobbleScrollAllRecordingsTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeFolderViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingsCollectionViewController"));

  v9 = 0;
  if (-[RecorderAppDelegate _selectFirstVoiceMemoInCollectionViewController:errorString:](self, "_selectFirstVoiceMemoInCollectionViewController:errorString:", v7, &v9))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));
    -[RecorderAppDelegate performCornobbleScrollTestForCollectionView:withOptions:](self, "performCornobbleScrollTestForCollectionView:withOptions:", v8, v4);

  }
}

- (void)startRecordNewVoiceMemoTest:(id)a3
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingViewController](self, "_recordingViewController", a3));
  if (v3)
  {
    v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020E24;
    block[3] = &unk_1001AB588;
    v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)glitchStartRecordNewVoiceMemoTest:(id)a3
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingViewController](self, "_recordingViewController", a3));
  if (v3)
  {
    v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020F24;
    block[3] = &unk_1001AB588;
    v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_finishGlitchRecording
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingViewController](self, "_recordingViewController"));
  if (v2)
  {
    v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021028;
    block[3] = &unk_1001AB588;
    v5 = v2;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)openCloseEditCardTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000210F4;
  v3[3] = &unk_1001AB588;
  v3[4] = self;
  -[RecorderAppDelegate _selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:](self, "_selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:", v3);
}

- (void)_closeEditCardAndFinishTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021204;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startCyclerRecordNewVoiceMemoTest:(id)a3
{
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingViewController](self, "_recordingViewController", a3));
  v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021344;
    block[3] = &unk_1001AB588;
    v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)startCyclerEndRecordingTest:(id)a3
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _recordingViewController](self, "_recordingViewController", a3));
  if (v3)
  {
    v4 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021444;
    block[3] = &unk_1001AB588;
    v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)startSelectFirstVoiceMemoInRecordingsList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeFolderViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingsCollectionViewController"));
  v7 = 0;
  -[RecorderAppDelegate _selectFirstVoiceMemoInCollectionViewController:errorString:](self, "_selectFirstVoiceMemoInCollectionViewController:errorString:", v6, &v7);

}

- (void)startPlaySelectedVoiceMemoTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeFolderViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingsCollectionViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  objc_msgSend(v6, "selectItemAtIndexPath:animated:scroll:", v7, 0, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate currentSelectedRecordingCell](self, "currentSelectedRecordingCell"));
  v9 = v8;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021610;
    block[3] = &unk_1001AB588;
    v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)startScrollVoiceMemosEditListTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeFolderViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingsCollectionViewController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));
  objc_msgSend(v8, "setEditing:", 1);
  v9 = 0;
  if (-[RecorderAppDelegate _selectFirstVoiceMemoInCollectionViewController:errorString:](self, "_selectFirstVoiceMemoInCollectionViewController:errorString:", v7, &v9))
  {
    -[RecorderAppDelegate performScrollTestForCollectionView:withOptions:](self, "performScrollTestForCollectionView:withOptions:", v8, v4);
  }

}

- (void)startOpenFoldersSidebarTest:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _splitViewController](self, "_splitViewController", a3));
  objc_msgSend(UIApp, "startedTest:", qword_1001ED7E8);
  objc_msgSend(v4, "showColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionCoordinator"));
  objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, &stru_1001AB608);

}

- (void)startPagingScrollPlaybackCardWaveformTest:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100021824;
  v3[3] = &unk_1001AB588;
  v3[4] = self;
  -[RecorderAppDelegate _selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:](self, "_selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:", v3);
}

- (void)performLegacyScrollTestForCollectionView:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("iterations")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("offset")));
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v10, "scrollToTop");
  objc_msgSend(v10, "_performScrollTest:iterations:delta:", qword_1001ED7E8, v7, v9);

}

- (void)performCornobbleScrollTestForCollectionView:(id)a3 withOptions:(id)a4
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "scrollToTop");
  v5 = objc_alloc((Class)RPTScrollViewTestParameters);
  v6 = objc_msgSend(v5, "initWithTestName:scrollView:completionHandler:", qword_1001ED7E8, v4, 0);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v6);
}

- (void)_selectFirstVoiceMemoInActiveRecordingsCollectionViewControllerWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecorderAppDelegate _mainViewController](self, "_mainViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeFolderViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingsCollectionViewController"));

  if (v7)
  {
    v10 = 0;
    if (-[RecorderAppDelegate _selectFirstVoiceMemoInCollectionViewController:errorString:](self, "_selectFirstVoiceMemoInCollectionViewController:errorString:", v7, &v10))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      -[NSObject installCACommitCompletionBlock:](v8, "installCACommitCompletionBlock:", v4);
    }
    else
    {
      v9 = OSLogForCategory(kVMLogCategoryDefault);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_10010A9C8(v8);
    }

  }
}

- (BOOL)_selectFirstVoiceMemoInCollectionViewController:(id)a3 errorString:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", 0);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scroll:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    objc_msgSend(v10, "collectionView:didSelectItemAtIndexPath:", v6, v8);

  }
  else if (a4)
  {
    *a4 = CFSTR("No voice memos found.");
  }

  return v7 != 0;
}

- (BOOL)_isScrollingTest:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_1001ED808;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1001ED808, &stru_1001AB628);
  v5 = objc_msgSend((id)qword_1001ED800, "containsObject:", v4);

  return v5;
}

@end
