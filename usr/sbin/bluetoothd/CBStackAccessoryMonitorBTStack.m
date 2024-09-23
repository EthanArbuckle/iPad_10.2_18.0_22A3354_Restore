@implementation CBStackAccessoryMonitorBTStack

- (CBStackAccessoryMonitorBTStack)init
{
  CBStackAccessoryMonitorBTStack *v2;
  CBStackAccessoryMonitorBTStack *v3;
  CBStackAccessoryMonitorBTStack *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBStackAccessoryMonitorBTStack;
  v2 = -[CBStackAccessoryMonitorBTStack init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)getAudioAccessoryDeviceArray
{
  CBStackAccessoryMonitorBTStack *v2;
  NSMutableDictionary *accessoryDeviceInfoMap;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10006251C;
  v11 = sub_100062348;
  v12 = 0;
  v2 = self;
  objc_sync_enter(v2);
  accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DA980;
  v6[3] = &unk_100919CF0;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryDeviceInfoMap, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_sync_exit(v2);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!self->_audioAccessoryEventHandler)
  {
    FatalErrorF("CBStackAccessoryMonitor: No audioAccessoryEventHandler", a2);
    goto LABEL_15;
  }
  if (!self->_audioAccessoryInfoChangedHandler)
  {
LABEL_15:
    FatalErrorF("CBStackAccessoryMonitor: No audioAccessoryInfoChangedHandler", a2);
    goto LABEL_16;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_16:
    FatalErrorF("CBStackAccessoryMonitor: No dispatchQueue", a2);
    goto LABEL_17;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_17:
    v5 = FatalErrorF("CBStackAccessoryMonitor: Activate after invalidate", v4);
    sub_1000DAB7C(v5, v6);
    return;
  }
  if (dword_100978198 <= 30 && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 30)))
    LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack activate]", 30, "Activate");
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB68);
    if (!qword_10097BB70)
      operator new();
    sub_1000DAB7C(qword_10097BB70, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB68);
    self->_addedMonitor = 1;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100978198 <= 30
      && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 30)))
    {
      LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack invalidate]", 30, "Invalidate");
    }
    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB68);
      if (qword_10097BB70)
        sub_1000DADD0(qword_10097BB70, self);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB68);
      self->_addedMonitor = 0;
    }
    -[CBStackAccessoryMonitorBTStack _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  id audioAccessoryEventHandler;
  id audioAccessoryInfoChangedHandler;
  id invalidationHandler;
  void (**v6)(void);

  if (!self->_invalidateDone)
  {
    audioAccessoryEventHandler = self->_audioAccessoryEventHandler;
    self->_audioAccessoryEventHandler = 0;

    audioAccessoryInfoChangedHandler = self->_audioAccessoryInfoChangedHandler;
    self->_audioAccessoryInfoChangedHandler = 0;

    v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v6)
      v6[2]();
    self->_invalidateDone = 1;
    if (dword_100978198 <= 30
      && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 30)))
    {
      LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack _invalidated]", 30, "Invalidated");
    }

  }
}

- (void)localDeviceEvent:(int)a3
{
  if (a3 == 5 && self->_addedMonitor)
  {
    if (dword_100978198 <= 30
      && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 30)))
    {
      LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack localDeviceEvent:]", 30, "Connection status changed");
    }
    -[CBStackAccessoryMonitorBTStack updateAccessoryInfo](self, "updateAccessoryInfo");
  }
}

- (void)_accessoryContextMessageData:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 4, v9, v6);

}

- (void)_accessoryConversationDetectMessageData:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 2, v9, v6);

}

- (void)_accessoryPMEConfigData:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7)
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 5, v9, v6);

}

- (void)updateAccessoryInfo
{
  CBStackAccessoryMonitorBTStack *v2;
  CBStackAccessoryMonitorBTStack *v3;
  NSMutableDictionary *accessoryDeviceInfoMap;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  CBStackAccessoryMonitorBTStack *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];

  if (self->_addedMonitor)
  {
    v2 = self;
    objc_sync_enter(v2);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v2->_accessoryDeviceInfoMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100919D30);
    objc_sync_exit(v2);

    -[CBStackAccessoryMonitorBTStack _updateConnectedAudioAccessories](v2, "_updateConnectedAudioAccessories");
    v3 = v2;
    objc_sync_enter(v3);
    accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DB570;
    v17[3] = &unk_100919D58;
    v17[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryDeviceInfoMap, "enumerateKeysAndObjectsUsingBlock:", v17);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_accessoryDeviceInfoMap, "allKeys"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_accessoryDeviceInfoMap, "objectForKeyedSubscript:", v9));
          if ((objc_msgSend(v10, "discoveryFlags") & 0x200000) == 0)
          {
            v11 = v3;
            objc_sync_enter(v11);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_accessoryDeviceInfoMap, "setObject:forKeyedSubscript:", 0, v9);
            objc_sync_exit(v11);

            if (dword_100978198 <= 30
              && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 30)))
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
              LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack updateAccessoryInfo]", 30, "Removed Audio Accessory Device: %@", v12);

            }
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

    objc_sync_exit(v3);
  }
}

- (void)_updateConnectedAudioAccessories
{
  int v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (qword_100977898 != -1)
    dispatch_once(&qword_100977898, &stru_100919E48);
  v3 = sub_10006D830((uint64_t)off_100977890, (void **)&v8);
  if (v3
    && dword_100978198 <= 90
    && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 90)))
  {
    v4 = CUPrintErrorCode((v3 + 310000));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack _updateConnectedAudioAccessories]", 90, "### GetConnectedDevices failed: %@", v5);

  }
  v6 = v8;
  v7 = v9;
  if (v8 != v9)
  {
    do
      -[CBStackAccessoryMonitorBTStack _updateAudioAccessoryDeviceInfo:flags:](self, "_updateAudioAccessoryDeviceInfo:flags:", *v6++, 0x200000);
    while (v6 != v7);
    v6 = v8;
  }
  if (v6)
  {
    v9 = v6;
    operator delete(v6);
  }
}

- (void)_updateAudioAccessoryDeviceInfo:(void *)a3 flags:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  CBStackAccessoryMonitorBTStack *v10;
  AudioAccessoryDeviceInfo *v11;
  NSMutableDictionary *accessoryDeviceInfoMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  id v16;

  v16 = 0;
  v7 = objc_msgSend(objc_alloc((Class)CBDevice), "initWithBTStackDevice:error:", a3, &v16);
  v8 = v16;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v10 = self;
    objc_sync_enter(v10);
    v11 = (AudioAccessoryDeviceInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_accessoryDeviceInfoMap, "objectForKeyedSubscript:", v9));
    if (!v11)
    {
      v11 = objc_alloc_init(AudioAccessoryDeviceInfo);
      -[AudioAccessoryDeviceInfo setIdentifier:](v11, "setIdentifier:", v9);
      accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      if (!accessoryDeviceInfoMap)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = v10->_accessoryDeviceInfoMap;
        v10->_accessoryDeviceInfoMap = v13;

        accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](accessoryDeviceInfoMap, "setObject:forKeyedSubscript:", v11, v9);
    }
    -[AudioAccessoryDeviceInfo setChangeFlags:](v11, "setChangeFlags:", -[AudioAccessoryDeviceInfo changeFlags](v11, "changeFlags") | -[AudioAccessoryDeviceInfo updateWithClassicDevice:](v11, "updateWithClassicDevice:", a3));
    -[AudioAccessoryDeviceInfo setDiscoveryFlags:](v11, "setDiscoveryFlags:", -[AudioAccessoryDeviceInfo discoveryFlags](v11, "discoveryFlags") | a4);

    objc_sync_exit(v10);
    goto LABEL_7;
  }
  if (dword_100978198 <= 90 && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 90)))
  {
    v15 = CUPrintNSError(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe(&dword_100978198, "-[CBStackAccessoryMonitorBTStack _updateAudioAccessoryDeviceInfo:flags:]", 90, "### AudioAccessoryDeviceInfo init device failed: %@", v9);
LABEL_7:

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)audioAccessoryEventHandler
{
  return self->_audioAccessoryEventHandler;
}

- (void)setAudioAccessoryEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)audioAccessoryInfoChangedHandler
{
  return self->_audioAccessoryInfoChangedHandler;
}

- (void)setAudioAccessoryInfoChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioAccessoryInfoChangedHandler, 0);
  objc_storeStrong(&self->_audioAccessoryEventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceInfoMap, 0);
}

@end
