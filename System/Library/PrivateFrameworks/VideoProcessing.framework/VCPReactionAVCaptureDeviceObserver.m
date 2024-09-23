@implementation VCPReactionAVCaptureDeviceObserver

- (id)discoverCaptureDevices
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C8B0A8];
  v3 = *MEMORY[0x1E0C89FA0];
  v9[0] = *MEMORY[0x1E0C89FA8];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0C89F98];
  v9[2] = *MEMORY[0x1E0C89F78];
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v5, *MEMORY[0x1E0C8A808], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)discoverCaptureDevicesAndSetupReactionObserver
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *captureDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCPReactionAVCaptureDeviceObserver discoverCaptureDevices](self, "discoverCaptureDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  captureDevices = self->_captureDevices;
  self->_captureDevices = v4;

  v6 = self->_captureDevices;
  if (v6 && -[NSMutableArray count](v6, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = self->_captureDevices;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          -[VCPReactionAVCaptureDeviceObserver setupReactionObserverForDevice:observe:](self, "setupReactionObserverForDevice:observe:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (VCPReactionAVCaptureDeviceObserver)initWithCallerID:(unint64_t)a3 listener:(void *)a4 callback:(void *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *deviceConnectedObserver;
  NSObject *v12;
  NSObject *deviceDisconnectedObserver;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  self->_callerID = (unint64_t)self;
  self->_callback = a5;
  self->_listener = a4;
  -[VCPReactionAVCaptureDeviceObserver discoverCaptureDevicesAndSetupReactionObserver](self, "discoverCaptureDevicesAndSetupReactionObserver", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B677CFC4;
  v17[3] = &unk_1E6A165B8;
  objc_copyWeak(&v18, &location);
  v8 = (void *)MEMORY[0x1BCC9874C](v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = sub_1B677D060;
  v15[3] = &unk_1E6A165B8;
  objc_copyWeak(&v16, &location);
  v9 = (void *)MEMORY[0x1BCC9874C](v15);
  objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C89FB8], 0, 0, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  deviceConnectedObserver = self->_deviceConnectedObserver;
  self->_deviceConnectedObserver = v10;

  objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C89FC0], 0, 0, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  deviceDisconnectedObserver = self->_deviceDisconnectedObserver;
  self->_deviceDisconnectedObserver = v12;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return self;
}

- (void)dealloc
{
  NSMutableArray *captureDevices;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  captureDevices = self->_captureDevices;
  if (captureDevices)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = captureDevices;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          -[VCPReactionAVCaptureDeviceObserver setupReactionObserverForDevice:observe:](self, "setupReactionObserverForDevice:observe:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), 0);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  if (self->_deviceConnectedObserver || self->_deviceDisconnectedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self->_deviceConnectedObserver);
    objc_msgSend(v8, "removeObserver:", self->_deviceDisconnectedObserver);

  }
  v9.receiver = self;
  v9.super_class = (Class)VCPReactionAVCaptureDeviceObserver;
  -[VCPReactionAVCaptureDeviceObserver dealloc](&v9, sel_dealloc);
}

- (void)addDevice:(id)a3
{
  id v4;
  NSMutableArray *captureDevices;
  unint64_t callerID;
  NSObject *v7;
  const char *v8;
  unint64_t v9;
  uint32_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    captureDevices = self->_captureDevices;
    if (captureDevices)
    {
      if (-[NSMutableArray containsObject:](captureDevices, "containsObject:", v4))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          callerID = self->_callerID;
          v13 = 134218242;
          v14 = callerID;
          v15 = 2112;
          v16 = v4;
          v7 = MEMORY[0x1E0C81028];
          v8 = "VCPReactionObserverSession (0x%llx): new device is duplicated: %@\n";
LABEL_13:
          v10 = 22;
          goto LABEL_14;
        }
      }
      else
      {
        -[VCPReactionAVCaptureDeviceObserver setupReactionObserverForDevice:observe:](self, "setupReactionObserverForDevice:observe:", v4, 1);
        -[NSMutableArray addObject:](self->_captureDevices, "addObject:", v4);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v12 = self->_callerID;
          v13 = 134218242;
          v14 = v12;
          v15 = 2112;
          v16 = v4;
          v7 = MEMORY[0x1E0C81028];
          v8 = "VCPReactionObserverSession (0x%llx): new device is added: %@";
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_callerID;
        v13 = 134217984;
        v14 = v11;
        _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): buffered capture devices are empty; re-setup\n",
          (uint8_t *)&v13,
          0xCu);
      }
      -[VCPReactionAVCaptureDeviceObserver discoverCaptureDevicesAndSetupReactionObserver](self, "discoverCaptureDevicesAndSetupReactionObserver");
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_callerID;
    v13 = 134217984;
    v14 = v9;
    v7 = MEMORY[0x1E0C81028];
    v8 = "VCPReactionObserverSession (0x%llx): new device is nil\n";
    v10 = 12;
LABEL_14:
    _os_log_impl(&dword_1B676B000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
  }

}

- (void)removeDevice:(id)a3
{
  id v4;
  NSMutableArray *captureDevices;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  unint64_t callerID;
  unint64_t v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    callerID = self->_callerID;
    v12 = 134217984;
    v13 = callerID;
    v7 = MEMORY[0x1E0C81028];
    v8 = "VCPReactionObserverSession (0x%llx): old device is nil\n";
LABEL_10:
    v9 = 12;
    goto LABEL_11;
  }
  captureDevices = self->_captureDevices;
  if (!captureDevices)
    goto LABEL_12;
  if ((-[NSMutableArray containsObject:](captureDevices, "containsObject:", v4) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = self->_callerID;
    v12 = 134217984;
    v13 = v11;
    v7 = MEMORY[0x1E0C81028];
    v8 = "VCPReactionObserverSession (0x%llx): old device does not exist\n";
    goto LABEL_10;
  }
  -[VCPReactionAVCaptureDeviceObserver setupReactionObserverForDevice:observe:](self, "setupReactionObserverForDevice:observe:", v4, 0);
  -[NSMutableArray removeObject:](self->_captureDevices, "removeObject:", v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_callerID;
    v12 = 134218242;
    v13 = v6;
    v14 = 2112;
    v15 = v4;
    v7 = MEMORY[0x1E0C81028];
    v8 = "VCPReactionObserverSession (0x%llx): old device is removed: %@";
    v9 = 22;
LABEL_11:
    _os_log_impl(&dword_1B676B000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v9);
  }
LABEL_12:

}

- (void)setupReactionObserverForDevice:(id)a3 observe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t callerID;
  const char *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    callerID = self->_callerID;
    v8 = "remove observer";
    v9 = 134218498;
    if (v4)
      v8 = "add observer";
    v10 = callerID;
    v11 = 2080;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): %s for device %@", (uint8_t *)&v9, 0x20u);
  }
  if (v4)
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("reactionEffectsInProgress"), 1, 0);
  else
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("reactionEffectsInProgress"), 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t callerID;
  int hasReactions;
  int v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("reactionEffectsInProgress")) ^ 1;
    if (!v11)
      LOBYTE(v12) = 1;
    if ((v12 & 1) == 0)
    {
      v13 = *MEMORY[0x1E0CB2CB8];
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          callerID = self->_callerID;
          v19 = 134218498;
          v20 = callerID;
          v21 = 2112;
          v22 = v10;
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_1B676B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): reactionEffectsInProgress change in device: %@, new change: %@\n", (uint8_t *)&v19, 0x20u);
        }
        hasReactions = self->_hasReactions;
        if (v15)
          v18 = objc_msgSend(v15, "count") != 0;
        else
          v18 = 0;
        self->_hasReactions = v18;
        if (hasReactions != v18)
          ((void (*)(void *))self->_callback)(self->_listener);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDisconnectedObserver, 0);
  objc_storeStrong((id *)&self->_deviceConnectedObserver, 0);
  objc_storeStrong((id *)&self->_captureDevices, 0);
}

@end
