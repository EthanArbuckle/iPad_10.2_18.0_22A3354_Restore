@implementation MapsAppTestAR

- (MapsAppTestAR)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  MapsAppTestAR *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v25.receiver = self;
  v25.super_class = (Class)MapsAppTestAR;
  v5 = -[MapsAppTest initWithApplication:testName:options:](&v25, "initWithApplication:testName:options:", a3, a4, a5);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "auxiliaryTasksManager"));
    v9 = objc_msgSend(v8, "auxilaryTaskForClass:", objc_opt_class(PedestrianARSessionTask));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_storeWeak((id *)&v5->_task, v10);

    WeakRetained = objc_loadWeakRetained((id *)&v5->_task);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stateManager"));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "monitors", 0));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v19 = objc_opt_class(PedestrianARSessionTileAvailabilityMonitor);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            objc_storeWeak((id *)&v5->_tileAvailabilityMonitor, v18);
            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  if (self->_waitingForTileAvailability)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("state"));

  }
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestAR;
  -[MapsAppTestAR dealloc](&v4, "dealloc");
}

+ (id)pptRecordingFileLocation
{
  if (qword_1014D2FE8 != -1)
    dispatch_once(&qword_1014D2FE8, &stru_1011C5268);
  return (id)qword_1014D2FE0;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapstest_directionsPlan"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_waitForTileAvailability", CFSTR("MapsRoutePlanningShowingRoutesNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v7, "setPPTTestDirectionsPlan:", v5);

  return 1;
}

- (void)_waitForTileAvailability
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MapsRoutePlanningShowingRoutesNotification"), 0);

  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("tileAvailability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestAR tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tileObserver"));
  v6 = objc_msgSend(v5, "areTilesAvailable");

  if (v6)
  {
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("tileAvailability"));
    -[MapsAppTestAR _showARUI](self, "_showARUI");
  }
  else
  {
    -[MapsAppTestAR setWaitingForTileAvailability:](self, "setWaitingForTileAvailability:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTestAR tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 1, 0);

  }
}

- (void)_showARUI
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("showARUI"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100740CFC;
  v12[3] = &unk_1011AD1C0;
  v12[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PedestrianARViewControllerDidAppearNotification"), 0, v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend((id)objc_opt_class(self), "pptRecordingFileLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  v7 = objc_msgSend((id)objc_opt_class(self), "pptRecordingFileLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ((v6 & 1) != 0)
  {
    GEOConfigSetString(MapsConfig_MapsARSessionPlaybackFilePathKey, off_1014B55D8, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "setInteger:forKey:", 1, CFSTR("MapsARSessionPlaybackModeKey"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v10, "setBool:forKey:", 0, CFSTR("MapsARSessionRecordingEnabledKey"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v8, "pptTestEnterAR");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PPT recording file is not present at expected location: %@"), v8));
    -[MapsAppTest failedTestWithReason:](self, "failedTestWithReason:", v11);

  }
}

- (void)_runARLocalization
{
  _QWORD v3[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("runARLocalization"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100740DA8;
  v3[3] = &unk_1011AD1C0;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("VLFSessionDidStopNotification"), 0, v3);
}

- (void)_displayARElement
{
  _QWORD v3[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("displayARElement"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100740E90;
  v3[3] = &unk_1011AD1C0;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PedestrianARViewControllerARFeatureDidAppearNotification"), 0, v3);
}

- (void)_dismissARUI
{
  dispatch_time_t v3;
  _QWORD v4[5];
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100740F7C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100740FC8;
  v4[3] = &unk_1011AD1C0;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), 0, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTestAR tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  if (v13 != v11)
  {

LABEL_6:
    v19.receiver = self;
    v19.super_class = (Class)MapsAppTestAR;
    -[MapsAppTestAR observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_7;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("tileObserver"));

  if (!v14)
    goto LABEL_6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestAR tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tileObserver"));
  v17 = objc_msgSend(v16, "areTilesAvailable");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestAR tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
    objc_msgSend(v18, "removeObserver:forKeyPath:", self, CFSTR("tileObserver"));

    -[MapsAppTestAR setWaitingForTileAvailability:](self, "setWaitingForTileAvailability:", 0);
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("tileAvailability"));
    -[MapsAppTestAR _showARUI](self, "_showARUI");
  }
LABEL_7:

}

- (PedestrianARSessionTask)task
{
  return (PedestrianARSessionTask *)objc_loadWeakRetained((id *)&self->_task);
}

- (void)setTask:(id)a3
{
  objc_storeWeak((id *)&self->_task, a3);
}

- (PedestrianARSessionTileAvailabilityMonitor)tileAvailabilityMonitor
{
  return (PedestrianARSessionTileAvailabilityMonitor *)objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);
}

- (void)setTileAvailabilityMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_tileAvailabilityMonitor, a3);
}

- (BOOL)isWaitingForTileAvailability
{
  return self->_waitingForTileAvailability;
}

- (void)setWaitingForTileAvailability:(BOOL)a3
{
  self->_waitingForTileAvailability = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tileAvailabilityMonitor);
  objc_destroyWeak((id *)&self->_task);
}

@end
