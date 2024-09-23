@implementation MapsAppTestVLF

- (MapsAppTestVLF)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  MapsAppTestVLF *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MapsAppTestVLF;
  v5 = -[MapsAppTest initWithApplication:testName:options:](&v13, "initWithApplication:testName:options:", a3, a4, a5);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "auxiliaryTasksManager"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "auxiliaryTasksManagerDidUpdateAuxiliaryTasksNotification:", off_1014BC228, v8);

    v10 = objc_msgSend(v8, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MapsAppTestVLF setTask:](v5, "setTask:", v11);

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
  v4.super_class = (Class)MapsAppTestVLF;
  -[MapsAppTestVLF dealloc](&v4, "dealloc");
}

- (void)setTask:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  if (WeakRetained != v4)
  {
    v6 = objc_storeWeak((id *)&self->_task, v4);

    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "removeObserver:name:object:", self, off_1014BC228, 0);

      v8 = objc_loadWeakRetained((id *)&self->_task);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stateManager"));

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allMonitors"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v16 = objc_opt_class(VLFSessionTileAvailabilityMonitor);
            if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            {
              objc_storeWeak((id *)&self->_tileAvailabilityMonitor, v15);
              goto LABEL_13;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_13:

      if (-[MapsAppTestVLF isWaitingForTask](self, "isWaitingForTask"))
      {
        -[MapsAppTestVLF setWaitingForTask:](self, "setWaitingForTask:", 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10052A334;
        block[3] = &unk_1011AC860;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }

    }
  }

}

+ (id)pptRecordingFileLocation
{
  if (qword_1014D27D8 != -1)
    dispatch_once(&qword_1014D27D8, &stru_1011BA558);
  return (id)qword_1014D27D0;
}

- (BOOL)runTest
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF task](self, "task"));

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10052A48C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestVLF setWaitingForTask:](self, "setWaitingForTask:", 1);
  }
  return 1;
}

- (void)_start
{
  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTestVLF _waitForTileAvailability](self, "_waitForTileAvailability");
}

- (void)_waitForTileAvailability
{
  void *v3;
  id v4;
  id v5;

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("tileAvailability"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  v4 = objc_msgSend(v3, "state");

  if (v4 == (id)2)
  {
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("tileAvailability"));
    -[MapsAppTestVLF _showVLFUI](self, "_showVLFUI");
  }
  else
  {
    -[MapsAppTestVLF setWaitingForTileAvailability:](self, "setWaitingForTileAvailability:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 1, 0);

  }
}

- (void)_showVLFUI
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("showVLFUI"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10052A6CC;
  v10[3] = &unk_1011AD1C0;
  v10[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", off_1014BB958, 0, v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend((id)objc_opt_class(self), "pptRecordingFileLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  v7 = objc_msgSend((id)objc_opt_class(self), "pptRecordingFileLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ((v6 & 1) != 0)
  {
    GEOConfigSetString(MapsConfig_MapsARSessionPlaybackFilePathKey, off_1014B55D8, v8);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF task](self, "task"));
    objc_msgSend(v8, "showVLFUI");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PPT recording file is not present at expected location: %@"), v8));
    -[MapsAppTest failedTestWithReason:](self, "failedTestWithReason:", v9);

  }
}

- (void)_runVLF
{
  _QWORD v3[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("runVLF"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10052A778;
  v3[3] = &unk_1011AD1C0;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("VLFSessionDidStopNotification"), 0, v3);
}

- (void)_dismissVLFUI
{
  _QWORD v3[5];

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("dismissVLFUI"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10052A860;
  v3[3] = &unk_1011AD1C0;
  v3[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", off_1014BB950, 0, v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  if (v13 != v11)
  {

LABEL_6:
    v18.receiver = self;
    v18.super_class = (Class)MapsAppTestVLF;
    -[MapsAppTestVLF observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_7;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("state"));

  if (!v14)
    goto LABEL_6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
  v16 = objc_msgSend(v15, "state");

  if (v16 == (id)2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestVLF tileAvailabilityMonitor](self, "tileAvailabilityMonitor"));
    objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("state"));

    -[MapsAppTestVLF setWaitingForTileAvailability:](self, "setWaitingForTileAvailability:", 0);
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("tileAvailability"));
    -[MapsAppTestVLF _showVLFUI](self, "_showVLFUI");
  }
LABEL_7:

}

- (void)auxiliaryTasksManagerDidUpdateAuxiliaryTasksNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = objc_msgSend(v6, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MapsAppTestVLF setTask:](self, "setTask:", v5);

}

- (VLFSessionTask)task
{
  return (VLFSessionTask *)objc_loadWeakRetained((id *)&self->_task);
}

- (VLFSessionTileAvailabilityMonitor)tileAvailabilityMonitor
{
  return (VLFSessionTileAvailabilityMonitor *)objc_loadWeakRetained((id *)&self->_tileAvailabilityMonitor);
}

- (void)setTileAvailabilityMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_tileAvailabilityMonitor, a3);
}

- (BOOL)isWaitingForTask
{
  return self->_waitingForTask;
}

- (void)setWaitingForTask:(BOOL)a3
{
  self->_waitingForTask = a3;
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
