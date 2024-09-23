@implementation REBluetoothPredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  void *v5;
  REFeatureSet *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature isConnectedToCarFeature](REFeature, "isConnectedToCarFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[REFeature isConnectedToBluetoothSpeakerFeature](REFeature, "isConnectedToBluetoothSpeakerFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v5);

  return v6;
}

+ (id)bluetoothQueue
{
  if (bluetoothQueue_onceToken != -1)
    dispatch_once(&bluetoothQueue_onceToken, &__block_literal_global_62);
  return (id)bluetoothQueue_queue;
}

void __38__REBluetoothPredictor_bluetoothQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.relevanceengine.predictor.bluetooth", 0);
  v1 = (void *)bluetoothQueue_queue;
  bluetoothQueue_queue = (uint64_t)v0;

}

- (id)_init
{
  id *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)REBluetoothPredictor;
  v2 = -[REPredictor _init](&v23, sel__init);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setLocalDevices:", MEMORY[0x24BDBD1B8]);
    objc_initWeak(&location, v3);
    objc_msgSend(v3, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __29__REBluetoothPredictor__init__block_invoke;
    v20 = &unk_24CF8AAC8;
    objc_copyWeak(&v21, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v4, &v17, 0.1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v3[10];
    v3[10] = (id)v5;

    v7 = (void *)MEMORY[0x24BDBCF20];
    +[REDuetContextDevice localDevice](REDuetContextDevice, "localDevice", v17, v18, v19, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isConnectedToCarQuery");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v3[8];
    v3[8] = (id)v11;

    objc_msgSend(v3[8], "setDevices:", v9);
    +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isConnectedToAudioBluetoothDeviceQuery");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v3[9];
    v3[9] = (id)v14;

    objc_msgSend(v3[9], "setDevices:", v9);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __29__REBluetoothPredictor__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "update");

}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  void *v13;

  v7 = a3;
  +[REFeature isConnectedToCarFeature](REFeature, "isConnectedToCarFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = -[REBluetoothPredictor connectedToCar](self, "connectedToCar");
  }
  else
  {
    +[REFeature isConnectedToBluetoothSpeakerFeature](REFeature, "isConnectedToBluetoothSpeakerFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v10 = -[REBluetoothPredictor connectedToSpeaker](self, "connectedToSpeaker");
  }
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (void)resume
{
  void *v3;
  REDuetContextQuery *connectCarQuery;
  uint64_t v5;
  void *v6;
  REDuetContextQuery *connectAudioQuery;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[REBluetoothPredictor _setConnectedToSpeaker:](self, "_setConnectedToSpeaker:", 0);
  -[REBluetoothPredictor _setConnectedToCar:](self, "_setConnectedToCar:", 0);
  +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  connectCarQuery = self->_connectCarQuery;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__REBluetoothPredictor_resume__block_invoke;
  v10[3] = &unk_24CF8FE60;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "registerForQuery:updateBlock:", connectCarQuery, v10);

  +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connectAudioQuery = self->_connectAudioQuery;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __30__REBluetoothPredictor_resume__block_invoke_2;
  v8[3] = &unk_24CF8FE60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "registerForQuery:updateBlock:", connectAudioQuery, v8);

  -[REBluetoothPredictor _registerForBluetoothNotifications](self, "_registerForBluetoothNotifications");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __30__REBluetoothPredictor_resume__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v6, "BOOLValue");
  else
    v4 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setConnectedToCar:", v4);
  objc_msgSend(WeakRetained, "updateObservers");

}

void __30__REBluetoothPredictor_resume__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v6, "BOOLValue");
  else
    v4 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setConnectedToSpeaker:", v4);
  objc_msgSend(WeakRetained, "updateObservers");

}

- (void)pause
{
  void *v3;
  void *v4;

  +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForQuery:", self->_connectCarQuery);

  +[RESingleton sharedInstance](REDuetContextStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterForQuery:", self->_connectAudioQuery);

  -[REBluetoothPredictor _unregisterForBluetoothNotifications](self, "_unregisterForBluetoothNotifications");
}

- (void)update
{
  NSObject *v3;
  _QWORD block[5];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    v5 = xmmword_24CF8FEA0;
    v6 = 0;
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (BluetoothManagerLibraryCore_frameworkLibrary)
  {
    -[REPredictor beginFetchingData](self, "beginFetchingData");
    if (update_onceToken != -1)
      dispatch_once(&update_onceToken, &__block_literal_global_11);
    -[REPredictor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__REBluetoothPredictor_update__block_invoke_2;
    block[3] = &unk_24CF8AAF0;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __30__REBluetoothPredictor_update__block_invoke()
{
  id BluetoothManagerClass;
  id v1;

  BluetoothManagerClass = getBluetoothManagerClass();
  +[REBluetoothPredictor bluetoothQueue](REBluetoothPredictor, "bluetoothQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(BluetoothManagerClass, "setSharedInstanceQueue:", v1);

}

void __30__REBluetoothPredictor_update__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unsigned int v12;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getBluetoothManagerClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  objc_msgSend(*(id *)(a1 + 32), "localDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v2, "connectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          v12 = objc_msgSend(v10, "type");
          if (v12 <= 0x2F && ((1 << v12) & 0x800000DB0000) != 0)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__REBluetoothPredictor_update__block_invoke_3;
  block[3] = &unk_24CF8C580;
  v18 = v3;
  v19 = v4;
  v20 = *(_QWORD *)(v16 + 32);
  v14 = v4;
  v15 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __30__REBluetoothPredictor_update__block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1[4], "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1[5], "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToSet:", v10);
  v8 = a1[6];
  if (v7)
  {
    objc_msgSend(a1[6], "finishFetchingData");
  }
  else
  {
    v9 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(v8, "setLocalDevices:", v9);

    objc_msgSend(a1[6], "finishFetchingData");
    objc_msgSend(a1[6], "updateObservers");
  }

}

- (BOOL)connectedToSpeaker
{
  BOOL v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  unsigned int v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[REBluetoothPredictor _isConnectedToSpeaker](self, "_isConnectedToSpeaker"))
    return 1;
  -[REBluetoothPredictor localDevices](self, "localDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type", (_QWORD)v14);
        if (v11 <= 0x2F && ((1 << v11) & 0x800000DB0000) != 0)
        {

          v3 = 1;
          goto LABEL_17;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v3 = 0;
    }
    while (v7);
  }
  else
  {
    v3 = 0;
  }
LABEL_17:

  return v3;
}

- (BOOL)connectedToCar
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[REBluetoothPredictor _isConnctedToCar](self, "_isConnctedToCar"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[REBluetoothPredictor localDevices](self, "localDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "type", (_QWORD)v9) == 22)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (void)_registerForBluetoothNotifications
{
  void *v3;
  REUpNextScheduler *bluetoothNotificationScheduler;
  _QWORD *v5;
  void *v6;
  REUpNextScheduler *v7;
  _QWORD *v8;
  void *v9;
  REUpNextScheduler *v10;
  _QWORD *v11;
  void *v12;
  REUpNextScheduler *v13;
  _QWORD *v14;
  void *v15;
  REUpNextScheduler *v16;
  _QWORD *v17;
  void *v18;
  REUpNextScheduler *v19;
  _QWORD *v20;
  void *v21;
  REUpNextScheduler *v22;
  _QWORD *v23;
  void *v24;
  REUpNextScheduler *v25;
  _QWORD *v26;
  void *v27;
  REUpNextScheduler *v28;
  _QWORD *v29;
  void *v30;
  REUpNextScheduler *v31;
  _QWORD *v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    v34 = xmmword_24CF8FEA0;
    v35 = 0;
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (BluetoothManagerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    bluetoothNotificationScheduler = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v5 = (_QWORD *)getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
    v36 = getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
    if (!getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr)
    {
      v6 = (void *)BluetoothManagerLibrary();
      v5 = dlsym(v6, "BluetoothAvailabilityChangedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v5;
      getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v34, 8);
    if (!v5)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", bluetoothNotificationScheduler, sel_schedule, *v5, 0, (_QWORD)v34);
    v7 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v8 = (_QWORD *)getBluetoothPowerChangedNotificationSymbolLoc_ptr;
    v36 = getBluetoothPowerChangedNotificationSymbolLoc_ptr;
    if (!getBluetoothPowerChangedNotificationSymbolLoc_ptr)
    {
      v9 = (void *)BluetoothManagerLibrary();
      v8 = dlsym(v9, "BluetoothPowerChangedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v8;
      getBluetoothPowerChangedNotificationSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v34, 8);
    if (!v8)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v7, sel_schedule, *v8, 0, (_QWORD)v34);
    v10 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v11 = (_QWORD *)getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceRemovedNotificationSymbolLoc_ptr)
    {
      v12 = (void *)BluetoothManagerLibrary();
      v11 = dlsym(v12, "BluetoothDeviceRemovedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v11;
      getBluetoothDeviceRemovedNotificationSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v34, 8);
    if (!v11)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v10, sel_schedule, *v11, 0, (_QWORD)v34);
    v13 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v14 = (_QWORD *)getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr)
    {
      v15 = (void *)BluetoothManagerLibrary();
      v14 = dlsym(v15, "BluetoothDeviceUnpairedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v14;
      getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v34, 8);
    if (!v14)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v13, sel_schedule, *v14, 0, (_QWORD)v34);
    v16 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v17 = (_QWORD *)getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr)
    {
      v18 = (void *)BluetoothManagerLibrary();
      v17 = dlsym(v18, "BluetoothDeviceConnectSuccessNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v17;
      getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(&v34, 8);
    if (!v17)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v16, sel_schedule, *v17, 0, (_QWORD)v34);
    v19 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v20 = (_QWORD *)getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr)
    {
      v21 = (void *)BluetoothManagerLibrary();
      v20 = dlsym(v21, "BluetoothDeviceConnectFailedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v20;
      getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr = (uint64_t)v20;
    }
    _Block_object_dispose(&v34, 8);
    if (!v20)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v19, sel_schedule, *v20, 0, (_QWORD)v34);
    v22 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v23 = (_QWORD *)getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr)
    {
      v24 = (void *)BluetoothManagerLibrary();
      v23 = dlsym(v24, "BluetoothDeviceDisconnectSuccessNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v23;
      getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr = (uint64_t)v23;
    }
    _Block_object_dispose(&v34, 8);
    if (!v23)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v22, sel_schedule, *v23, 0, (_QWORD)v34);
    v25 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v26 = (_QWORD *)getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr;
    v36 = getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr;
    if (!getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr)
    {
      v27 = (void *)BluetoothManagerLibrary();
      v26 = dlsym(v27, "BluetoothDeviceDisconnectFailedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v26;
      getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr = (uint64_t)v26;
    }
    _Block_object_dispose(&v34, 8);
    if (!v26)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v25, sel_schedule, *v26, 0, (_QWORD)v34);
    v28 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v29 = (_QWORD *)getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr;
    v36 = getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr;
    if (!getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr)
    {
      v30 = (void *)BluetoothManagerLibrary();
      v29 = dlsym(v30, "BluetoothConnectionStatusChangedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v29;
      getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v34, 8);
    if (!v29)
      goto LABEL_36;
    objc_msgSend(v3, "addObserver:selector:name:object:", v28, sel_schedule, *v29, 0, (_QWORD)v34);
    v31 = self->_bluetoothNotificationScheduler;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v32 = (_QWORD *)getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
    v36 = getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
    if (!getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr)
    {
      v33 = (void *)BluetoothManagerLibrary();
      v32 = dlsym(v33, "BluetoothPairedStatusChangedNotification");
      *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v32;
      getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr = (uint64_t)v32;
    }
    _Block_object_dispose(&v34, 8);
    if (!v32)
    {
LABEL_36:
      -[RELemmaEnumerator init].cold.1();
      __break(1u);
    }
    objc_msgSend(v3, "addObserver:selector:name:object:", v31, sel_schedule, *v32, 0, (_QWORD)v34);

  }
}

- (void)_unregisterForBluetoothNotifications
{
  void *v3;

  if (!BluetoothManagerLibraryCore_frameworkLibrary)
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (BluetoothManagerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_bluetoothNotificationScheduler);

  }
}

- (BOOL)_isConnctedToCar
{
  return self->_connectedToCar;
}

- (void)_setConnectedToCar:(BOOL)a3
{
  self->_connectedToCar = a3;
}

- (BOOL)_isConnectedToSpeaker
{
  return self->_connectedToSpeaker;
}

- (void)_setConnectedToSpeaker:(BOOL)a3
{
  self->_connectedToSpeaker = a3;
}

- (NSDictionary)localDevices
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocalDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothNotificationScheduler, 0);
  objc_storeStrong((id *)&self->_connectAudioQuery, 0);
  objc_storeStrong((id *)&self->_connectCarQuery, 0);
}

@end
