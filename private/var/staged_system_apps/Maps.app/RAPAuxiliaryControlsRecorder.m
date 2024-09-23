@implementation RAPAuxiliaryControlsRecorder

+ (void)fetchCurrentlyConnectedControlsWithCompletion:(id)a3
{
  objc_msgSend(a1, "fetchCurrentlyConnectedControlsRecordingOrigin:completion:", 0, a3);
}

+ (void)fetchCurrentlyConnectedControlsRecordingOrigin:(int64_t)a3 completion:(id)a4
{
  id v5;
  RAPAuxiliaryControlsRecorder *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v5 = a4;
  v6 = objc_alloc_init(RAPAuxiliaryControlsRecorder);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008F3C44;
  v8[3] = &unk_1011DB780;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  -[RAPAuxiliaryControlsRecorder startWithFetchCompletion:](v6, "startWithFetchCompletion:", v8);

}

- (void)startWithFetchCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (*(_WORD *)&self->_started)
  {
    if (v4)
      (*((void (**)(id, RAPAuxiliaryControlsRecorder *))v4 + 2))(v4, self);
  }
  else
  {
    self->_started = 1;
    -[RAPAuxiliaryControlsRecorder _updateCurrentCarPlayControl](self, "_updateCurrentCarPlayControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_updateCurrentCarPlayControl", CFSTR("MapsExternalDeviceUpdated"), v7);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008F3DC4;
    v8[3] = &unk_1011AE240;
    v8[4] = self;
    v9 = v5;
    -[RAPAuxiliaryControlsRecorder _updateWatchControlsWithFetchCompletion:](self, "_updateWatchControlsWithFetchCompletion:", v8);

  }
}

- (void)start
{
  -[RAPAuxiliaryControlsRecorder startWithFetchCompletion:](self, "startWithFetchCompletion:", 0);
}

- (void)stop
{
  void *v3;
  id v4;

  if (!self->_stopped)
  {
    self->_stopped = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MapsExternalDeviceUpdated"), 0);

    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, NRPairedDeviceRegistryDeviceDidPairNotification, 0);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[RAPAuxiliaryControlsRecorder stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)RAPAuxiliaryControlsRecorder;
  -[RAPAuxiliaryControlsRecorder dealloc](&v3, "dealloc");
}

- (void)setOriginatingDeviceFromOrigin:(int64_t)a3
{
  if (a3 == 2)
  {
    -[RAPAuxiliaryControlsRecorder _setOriginatingControlToCurrentActiveWatch](self, "_setOriginatingControlToCurrentActiveWatch");
  }
  else if (a3 == 1)
  {
    -[RAPAuxiliaryControlsRecorder _setOriginatingControlToCurrentCarPlayScreen](self, "_setOriginatingControlToCurrentCarPlayScreen");
  }
}

- (void)_addControlIfNotDuplicate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *relevantAuxiliaryControls;
  NSMutableArray *v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_relevantAuxiliaryControls;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "isSameControlAsControl:", v4, (_QWORD)v13) & 1) != 0)
        {

          goto LABEL_13;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  relevantAuxiliaryControls = self->_relevantAuxiliaryControls;
  if (!relevantAuxiliaryControls)
  {
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12 = self->_relevantAuxiliaryControls;
    self->_relevantAuxiliaryControls = v11;

    relevantAuxiliaryControls = self->_relevantAuxiliaryControls;
  }
  -[NSMutableArray addObject:](relevantAuxiliaryControls, "addObject:", v4, (_QWORD)v13);
LABEL_13:

}

- (void)_updateCurrentCarPlayControl
{
  void *v3;
  void *v4;
  RAPAuxiliaryControlCarPlay *v5;
  void *v6;
  void *v7;
  RAPAuxiliaryControlCarPlay *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarPlayExternalDeviceMonitor sharedInstance](MapsCarPlayExternalDeviceMonitor, "sharedInstance"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "carPlayExternalDevice"));

  v4 = v9;
  if (v9)
  {
    v5 = [RAPAuxiliaryControlCarPlay alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v8 = -[RAPAuxiliaryControlCarPlay initWithInformationFromDevice:accessory:displayController:](v5, "initWithInformationFromDevice:accessory:displayController:", v9, v6, v7);

    if (v8)
    {
      if (!-[RAPAuxiliaryControlCarPlay isSameControlAsControl:](self->_currentCarPlayAuxiliaryControl, "isSameControlAsControl:", v8))objc_storeStrong((id *)&self->_currentCarPlayAuxiliaryControl, v8);
      -[RAPAuxiliaryControlsRecorder _addControlIfNotDuplicate:](self, "_addControlIfNotDuplicate:", v8);
    }

    v4 = v9;
  }

}

- (void)_setOriginatingControlToCurrentCarPlayScreen
{
  objc_storeStrong((id *)&self->_originatingAuxiliaryControl, self->_currentCarPlayAuxiliaryControl);
}

- (void)_updateWatchControls
{
  -[RAPAuxiliaryControlsRecorder _updateWatchControlsWithFetchCompletion:](self, "_updateWatchControlsWithFetchCompletion:", 0);
}

- (void)_updateWatchControlsWithFetchCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ++self->_countOfNanoRegistryFetchesInFlight;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008F4224;
  v7[3] = &unk_1011DB7A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getDevicesWithBlock:", v7);

}

- (void)_setOriginatingControlToCurrentActiveWatch
{
  if (self->_countOfNanoRegistryFetchesInFlight)
    self->_waitingToSetActiveWatchAsOriginating = 1;
  else
    objc_storeStrong((id *)&self->_originatingAuxiliaryControl, self->_currentActiveWatchAuxiliaryControl);
}

- (RAPAuxiliaryControlsRecording)copyCurrentPartialRecording
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  RAPAuxiliaryControlsRecording *v22;
  RAPAuxiliaryControlsRecorder *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = self;
  v4 = self->_relevantAuxiliaryControls;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(RAPAuxiliaryControlCarPlay);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          v11 = v9;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {
          v13 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reportAProblemControlMessage"));
          objc_msgSend(v13, "setCar:", v14);

          objc_msgSend(v3, "addObject:", v13);
        }
        v15 = v9;
        v16 = objc_opt_class(RAPAuxiliaryControlWatch);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          v17 = v15;
        else
          v17 = 0;
        v18 = v17;

        if (v18)
        {
          v19 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reportAProblemControlMessage"));
          objc_msgSend(v19, "setWatch:", v20);

          objc_msgSend(v3, "addObject:", v19);
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  if (v24->_originatingAuxiliaryControl)
    v21 = (uint64_t)-[NSMutableArray indexOfObject:](v24->_relevantAuxiliaryControls, "indexOfObject:");
  else
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  v22 = -[RAPAuxiliaryControlsRecording initWithControlsGeo:originatingIndex:]([RAPAuxiliaryControlsRecording alloc], "initWithControlsGeo:originatingIndex:", v3, v21);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActiveWatchAuxiliaryControl, 0);
  objc_storeStrong((id *)&self->_currentCarPlayAuxiliaryControl, 0);
  objc_storeStrong((id *)&self->_originatingAuxiliaryControl, 0);
  objc_storeStrong((id *)&self->_relevantAuxiliaryControls, 0);
}

@end
