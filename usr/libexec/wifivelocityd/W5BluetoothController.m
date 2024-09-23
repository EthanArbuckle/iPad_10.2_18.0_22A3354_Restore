@implementation W5BluetoothController

- (W5BluetoothController)init
{
  W5BluetoothController *v2;
  NSObject *v3;
  CBCentralManager *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)W5BluetoothController;
  v2 = -[W5BluetoothController init](&v7, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.bt", 0), (v2->_queue = (OS_dispatch_queue *)v3) != 0)
    && (dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0),
        v4 = (CBCentralManager *)objc_alloc_init((Class)CBCentralManager),
        (v2->_centralManager = v4) != 0))
  {
    +[BluetoothManager setSharedInstanceQueue:](BluetoothManager, "setSharedInstanceQueue:", v2->_queue);
    -[BluetoothManager maskLocalDeviceEvents:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "maskLocalDeviceEvents:", 0xFFFFFFFFLL);
    v5 = 10;
    do
    {
      if ((-[BluetoothManager available](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "available") & 1) != 0)break;
      usleep(0x30D40u);
      --v5;
    }
    while (v5);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)setUpdatedBluetoothCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100050864;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)W5BluetoothController;
  -[W5BluetoothController dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005095C;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050AD4;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)powerOn
{
  NSObject *queue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050BC8;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)address
{
  NSObject *queue;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_100050CD4;
  v10 = sub_100050CE4;
  v11 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050CF0;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDiscoverable
{
  NSObject *queue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050DC4;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConnectable
{
  NSObject *queue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050E94;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAvailable
{
  NSObject *queue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050F64;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScanning
{
  NSObject *queue;
  char v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051034;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__ios__handleBTAvailabilityNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000510D0;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTPowerNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000511A0;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTConnectabiliyNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051270;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTDiscoveryNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051340;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTAdvertisingNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051410;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)__ios__deviceList
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  W5BluetoothDeviceInternal *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  W5BluetoothDeviceInternal *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  void *v24;
  W5BluetoothDeviceInternal *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  void *v31;
  W5BluetoothDeviceInternal *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *n;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = objc_msgSend(-[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent"), "retrievePairedPeers");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "name"))
        {
          v11 = objc_alloc_init(W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setPeripheral:centralManager:](v11, "setPeripheral:centralManager:", v10, self->_centralManager);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, objc_msgSend(v10, "name"));
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v7);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v17, "name"))
        {
          v18 = objc_alloc_init(W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setPeripheral:centralManager:](v18, "setPeripheral:centralManager:", v17, self->_centralManager);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, objc_msgSend(v17, "name"));
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v14);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = -[BluetoothManager pairedDevices](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "pairedDevices");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v24, "name"))
        {
          v25 = (W5BluetoothDeviceInternal *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v24, "name"));
          if (!v25)
            v25 = objc_alloc_init(W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setBluetoothDevice:](v25, "setBluetoothDevice:", v24);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, objc_msgSend(v24, "name"));
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v21);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = -[BluetoothManager connectedDevices](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "connectedDevices");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)m);
        if (objc_msgSend(v31, "name"))
        {
          v32 = (W5BluetoothDeviceInternal *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v31, "name"));
          if (!v32)
            v32 = objc_alloc_init(W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setBluetoothDevice:](v32, "setBluetoothDevice:", v31);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, objc_msgSend(v31, "name"));
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v28);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = objc_msgSend(v4, "allValues", 0);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v35; n = (char *)n + 1)
      {
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)n), "device"));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v35);
  }
  return objc_msgSend(v3, "copy");
}

- (id)devices
{
  return objc_msgSend(-[W5BluetoothController __ios__deviceList](self, "__ios__deviceList"), "copy");
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

@end
