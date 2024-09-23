@implementation PSGMousePointerController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSGMousePointerController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance;
}

void __43__PSGMousePointerController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (NSMutableSet)pointerDevices
{
  return self->_pointerDevices;
}

- (PSGMousePointerController)init
{
  PSGMousePointerController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGMousePointerController;
  v2 = -[PSGMousePointerController init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PSGMousePointerController setPointerDevices:](v2, "setPointerDevices:", v3);

    objc_msgSend(MEMORY[0x24BE0B6C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addPointerDeviceObserver:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGMousePointerController setObserverToken:](v2, "setObserverToken:", v5);

  }
  return v2;
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  id v4;
  PSGMousePointerController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PSGMousePointerController mousePointerDevicesDidConnect:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (productName CONTAINS[c] %@)"), CFSTR("UC Automouse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGMousePointerController pointerDevices](v5, "pointerDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v8);

  objc_sync_exit(v5);
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_9);

}

void __59__PSGMousePointerController_mousePointerDevicesDidConnect___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", PSGPointerDevicesDidChangeNotification, 0);

}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  id v4;
  PSGMousePointerController *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSGMousePointerController mousePointerDevicesDidDisconnect:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  -[PSGMousePointerController pointerDevices](v5, "pointerDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v4);

  objc_sync_exit(v5);
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_9_0);

}

void __62__PSGMousePointerController_mousePointerDevicesDidDisconnect___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", PSGPointerDevicesDidChangeNotification, 0);

}

- (id)globalDevicePreferences
{
  PSGMousePointerController *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BE0B6C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalDevicePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE0B6B8], "defaultPreferencesForHardwareType:", 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setGlobalDevicePreferences:(id)a3
{
  PSGMousePointerController *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BE0B6C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlobalDevicePreferences:", v6);

  objc_sync_exit(v4);
}

- (int)trackingSpeedIndex
{
  void *v2;
  float v3;
  float v4;
  uint64_t i;

  -[PSGMousePointerController globalDevicePreferences](self, "globalDevicePreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointerAccelerationFactor");
  v4 = v3;

  for (i = 0; i != 10; ++i)
  {
    if (PSGTrackingSpeedFactors[i] >= v4)
      break;
  }
  return i;
}

- (void)setTrackingSpeedIndex:(int)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalDevicePreferences");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = PSGTrackingSpeedFactors[a3];
  *(float *)&v5 = v5;
  objc_msgSend(v7, "setPointerAccelerationFactor:", v5);
  +[PSGMousePointerController sharedInstance](PSGMousePointerController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlobalDevicePreferences:", v7);

}

- (BOOL)hasTrackpad
{
  PSGMousePointerController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PSGMousePointerController pointerDevices](v2, "pointerDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "senderDescriptor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hardwareType") == 9;

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)hasMouse
{
  PSGMousePointerController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PSGMousePointerController pointerDevices](v2, "pointerDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "senderDescriptor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hardwareType") == 8;

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)hasMagicMouse
{
  PSGMousePointerController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PSGMousePointerController pointerDevices](v2, "pointerDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasVirtualMouseButtons") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)trackpadSupportsSilentClick
{
  PSGMousePointerController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[PSGMousePointerController hasTrackpad](self, "hasTrackpad"))
  {
    v3 = self;
    objc_sync_enter(v3);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PSGMousePointerController pointerDevices](v3, "pointerDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportsLightClick") & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)trackpadSupportsSystemHaptics
{
  PSGMousePointerController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[PSGMousePointerController hasTrackpad](self, "hasTrackpad"))
  {
    v3 = self;
    objc_sync_enter(v3);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PSGMousePointerController pointerDevices](v3, "pointerDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportsSystemHaptics") & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setPointerDevices:(id)a3
{
  objc_storeStrong((id *)&self->_pointerDevices, a3);
}

- (BSInvalidatable)observerToken
{
  return (BSInvalidatable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserverToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_pointerDevices, 0);
}

@end
