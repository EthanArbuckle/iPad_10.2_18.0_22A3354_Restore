@implementation CBWHBRouter

- (CBWHBRouter)init
{
  CBWHBRouter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deviceTable;
  NSMutableDictionary *v5;
  NSMutableDictionary *whbHostTable;
  const char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CBWHBRouter;
  v2 = -[CBWHBRouter init](&v9, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceTable = v2->_deviceTable;
    v2->_deviceTable = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    whbHostTable = v2->_whbHostTable;
    v2->_whbHostTable = v5;

    v2->_options = 7;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_isActivated = 0;
  }
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
  {
    v7 = "SUCCESS";
    if (!v2)
      v7 = "FAILURE";
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter init]", 30, "Init status : %s", v7);
  }
  return v2;
}

- (CBWHBRouter)initWithOptions:(unint64_t)a3
{
  CBWHBRouter *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *deviceTable;
  NSMutableDictionary *v7;
  NSMutableDictionary *whbHostTable;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CBWHBRouter;
  v4 = -[CBWHBRouter init](&v11, "init");
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceTable = v4->_deviceTable;
    v4->_deviceTable = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    whbHostTable = v4->_whbHostTable;
    v4->_whbHostTable = v7;

    v4->_options = a3 | 1;
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v4->_isActivated = 0;
  }
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
  {
    v9 = "SUCCESS";
    if (!v4)
      v9 = "FAILURE";
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter initWithOptions:]", 30, "Init status : %s", v9);
  }
  return v4;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)activate
{
  -[CBWHBRouter subscribeToCoexStateUpdates](self, "subscribeToCoexStateUpdates");
  self->_isActivated = 1;
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter activate]", 30, "WHB Router activated");
}

- (void)invalidate
{
  self->_isActivated = 0;
  -[CBWHBRouter unSubscribeFromCoexStateUpdates](self, "unSubscribeFromCoexStateUpdates");
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter invalidate]", 30, "WHB Router invalidated");
}

- (unint64_t)coexUsageOfWHBHost:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t Int64;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  char *v16;
  void *v17;
  int v19;

  v4 = a3;
  if ((self->_options & 2) == 0)
  {
    v5 = 1;
LABEL_23:
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter coexUsageOfWHBHost:]", 30, " CoexUsage:%llu for WHBHost:%@", v5, v4);
    }
    goto LABEL_27;
  }
  v19 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "estimatedConnectionsLastUpdatedTicks");
    if (v8)
    {
      v9 = v8;
      v10 = mach_absolute_time();
      if ((unint64_t)UpTicksToSeconds(v10 - (_QWORD)v9) >= 0xA)
      {
        objc_msgSend(v7, "setEstimatedConnections:", 0);
        objc_msgSend(v7, "setEstimatedConnectionsLastUpdatedTicks:", 0);
      }
    }
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("whbMaxLEConnections"), &v19);
    v12 = 3;
    if (!v19)
    {
      v13 = Int64;
      if (Int64 != 3)
      {
        if (dword_100977AA0 <= 30
          && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
        {
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter coexUsageOfWHBHost:]", 30, "WHB Max LE Connections: %llu -> %llu", 3, v13);
        }
        v12 = v13;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coexUsage"));
    v15 = objc_msgSend(v14, "numLEConnection");

    if ((unint64_t)v15 >= v12)
    {
      v5 = 0;
    }
    else
    {
      v16 = (char *)objc_msgSend(v7, "estimatedConnections");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coexUsage"));
      v5 = &v16[(_QWORD)objc_msgSend(v17, "numLEConnection")] < (char *)3;

    }
    goto LABEL_23;
  }
  if (dword_100977AA0 <= 90 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter coexUsageOfWHBHost:]", 90, "No Entry for WHBHost %@", v4);
  v5 = 0;
LABEL_27:

  return v5;
}

- (id)rankWHBHosts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v17;
  void *v18;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v21 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100092AC4;
    v26[3] = &unk_100918020;
    v26[4] = self;
    v20 = v4;
    v27 = v20;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingComparator:", v26));

    v10 = objc_msgSend(v9, "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          if ((self->_options & 2) != 0)
          {
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            if (!-[CBWHBRouter coexUsageOfWHBHost:](self, "coexUsageOfWHBHost:", v16))
            {
              if (dword_100977AA0 <= 30
                && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
              {
                LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter rankWHBHosts:]", 30, "Removed host: %@ from ranked list", v16);
              }
              objc_msgSend(v10, "removeObject:", v16);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v13);
    }

    v17 = objc_msgSend(v10, "count");
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter rankWHBHosts:]", 30, "Device %@ ranked %llu hosts succesfully", v20, v17);
    }
    if (v17
      && dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", ")));
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter rankWHBHosts:]", 30, "RankedHosts: %@", v18);

    }
    v6 = v21;
  }
  else
  {
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter rankWHBHosts:]", 30, "Failed to Rank for Device : %@", v4);
    }
    v10 = 0;
  }

  return v10;
}

- (void)subscribeToCoexStateUpdates
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "coexChangeNotification:", CFSTR("com.apple.bluetooth.leconnection"), 0);

}

- (void)unSubscribeFromCoexStateUpdates
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.bluetooth.leconnection"), 0);

}

- (void)coexChangeNotification:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBWHBRouter *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092C64;
  v7[3] = &unk_100917058;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)insertIntoDeviceTableWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CBDeviceEntry *v9;
  CBDeviceEntry *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stableIdentifier"));
  if (v8)
  {
    v9 = (CBDeviceEntry *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v8));
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceEntry hostMap](v9, "hostMap"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "floatValue");
        *(float *)&v15 = (float)(v14 + (float)(int)objc_msgSend(v6, "bleRSSI")) * 0.5;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v7);

        if (dword_100977AA0 <= 30
          && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
        {
          v17 = objc_msgSend(v6, "bleRSSI");
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]", 30, "Updated an entry on Device Table with RSSI %d and  Average RSSI : %@", v17, v18);

        }
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "bleRSSI")));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v7);

        if (dword_100977AA0 <= 30
          && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
        {
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]", 30, "Added new Host entry on Device Table with RSSI %d ", objc_msgSend(v6, "bleRSSI"));
        }
      }

    }
    else
    {
      v10 = objc_alloc_init(CBDeviceEntry);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "bleRSSI")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceEntry hostMap](v10, "hostMap"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v7);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceTable, "setObject:forKeyedSubscript:", v10, v8);
      if (dword_100977AA0 <= 30
        && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
      {
        LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoDeviceTableWithKey:value:]", 30, "Successfully created a new entry into Device Table");
      }
    }

  }
  return v8 != 0;
}

- (void)removeDeviceFromDeviceTable:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v10));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostMap"));
    objc_msgSend(v9, "removeObjectForKey:", v6);

  }
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter removeDeviceFromDeviceTable:value:]", 30, "CBDevice %@ on WHBHost %@ is successfully removed from Device Table", v10, v6);

}

- (void)removeFromDeviceTableWithKey:(id)a3 value:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stableIdentifier"));
  if (v6)
    -[CBWHBRouter removeDeviceFromDeviceTable:value:](self, "removeDeviceFromDeviceTable:value:", v6, v7);

}

- (unint64_t)calculateMetricforDevice:(id)a3 onHost:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  BOOL v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v6));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostMap"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "floatValue");
        v16 = v15;
        if (v15 <= -85.0)
        {
          v9 = 0;
        }
        else if (v15 < -85.0 || v15 > -80.0)
        {
          v18 = v15 > -50.0 || v15 < -70.0;
          v19 = 3;
          if (v18)
            v19 = 4;
          if (v15 < -80.0 || v15 > -70.0)
            v9 = v19;
          else
            v9 = 2;
        }
        else
        {
          v9 = 1;
        }
        if ((self->_options & 2) != 0)
          v9 *= -[CBWHBRouter coexUsageOfWHBHost:](self, "coexUsageOfWHBHost:", v8);
      }
      else
      {
        v9 = 0;
        v16 = 0.0;
      }

    }
    else
    {
      v9 = 0;
      v16 = 0.0;
    }
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter calculateMetricforDevice:onHost:]", 30, "CBDevice %@ on WHBHost %@ has RSSI: %f and ranked: %lld", v6, v8, v16, v9);
    }

  }
  return v9;
}

- (BOOL)insertIntoWHBHostTableWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CBWHBHostEntry *v9;
  CBWHBHostEntry *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stableIdentifier"));
  if (v8)
  {
    v9 = (CBWHBHostEntry *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v6));
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry deviceList](v9, "deviceList"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v8);

      if (dword_100977AA0 <= 30
        && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
      {
        LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]", 30, "Added an entry for device : %@ to WHBHost Table for WHBHost: %@", v7, v6);
      }
    }
    else
    {
      v10 = objc_alloc_init(CBWHBHostEntry);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry deviceList](v10, "deviceList"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v8);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbHostTable, "setObject:forKeyedSubscript:", v10, v6);
      if (dword_100977AA0 <= 30
        && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
      {
        LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]", 30, "Created an entry for device : %@ on WHBHost Table for WHBHost: %@", v7, v6);
      }
    }

  }
  else if (dword_100977AA0 <= 90
         && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
  {
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter insertIntoWHBHostTableWithKey:value:]", 90, "StableIdentifier for device : %@ is nil", v7);
  }

  return v8 != 0;
}

- (void)removefromRemoteHostMapWithKey:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stableIdentifier"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v11));
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceList"));
      objc_msgSend(v10, "removeObjectForKey:", v7);

    }
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter removefromRemoteHostMapWithKey:value:]", 30, "Removed an entry for device : %@ from WHBHost Table for WHBHost: %@", v6, v11);
    }

  }
  else if (dword_100977AA0 <= 90
         && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
  {
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter removefromRemoteHostMapWithKey:value:]", 90, "StableIdentifier for device : %@ is nil", v6);
  }

}

- (void)removefromRemoteHostMapWithKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:"));
  if (v4)
  {
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter removefromRemoteHostMapWithKey:]", 30, "Removing all the devices on WHBHost: %@", v6);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceList"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009387C;
    v7[3] = &unk_100918048;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_whbHostTable, "removeObjectForKey:", v6);
  if (dword_100977AA0 <= 30 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter removefromRemoteHostMapWithKey:]", 30, "Removed an entry for WHBHost: %@ from WHBHost Table", v6);

}

- (void)deviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (self->_isActivated)
  {
    if (v4)
    {
      v11 = v4;
      if (objc_msgSend(v4, "bleRSSI"))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stableIdentifier"));
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteHostID"));
          if (v7)
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteHostID"));
          else
            v8 = CFSTR("CBLocalHostID");

          if (dword_100977AA0 <= 30
            && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
          {
            LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceFound:]", 30, "Device: %@ found on WHBHost: %@", v6, v8);
          }
          -[CBWHBRouter insertIntoDeviceTableWithKey:value:](self, "insertIntoDeviceTableWithKey:value:", v11, v8);
          -[CBWHBRouter insertIntoWHBHostTableWithKey:value:](self, "insertIntoWHBHostTableWithKey:value:", v8, v11);

        }
        goto LABEL_23;
      }
      v5 = v11;
      if (dword_100977AA0 <= 90)
      {
        if (dword_100977AA0 != -1 || (v10 = _LogCategory_Initialize(&dword_100977AA0, 90), v5 = v11, v10))
        {
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceFound:]", 90, "RSSI is unknown. Ignoring device found event");
          goto LABEL_23;
        }
      }
    }
  }
  else if (dword_100977AA0 <= 90)
  {
    v11 = v4;
    if (dword_100977AA0 != -1 || (v9 = _LogCategory_Initialize(&dword_100977AA0, 90), v5 = v11, v9))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceFound:]", 90, "WHB Router object is not activated");
LABEL_23:
      v5 = v11;
    }
  }

}

- (void)deviceLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (self->_isActivated)
  {
    if (v4)
    {
      v10 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stableIdentifier"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteHostID"));
        if (v7)
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteHostID"));
        else
          v8 = CFSTR("CBLocalHostID");

        if (dword_100977AA0 <= 30
          && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
        {
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceLost:]", 30, "Device: %@ lost on WHBHost: %@", v6, v8);
        }
        -[CBWHBRouter removeFromDeviceTableWithKey:value:](self, "removeFromDeviceTableWithKey:value:", v10, v8);
        -[CBWHBRouter removefromRemoteHostMapWithKey:value:](self, "removefromRemoteHostMapWithKey:value:", v8, v10);

      }
      goto LABEL_18;
    }
  }
  else if (dword_100977AA0 <= 90)
  {
    v10 = v4;
    if (dword_100977AA0 != -1 || (v9 = _LogCategory_Initialize(&dword_100977AA0, 90), v5 = v10, v9))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceLost:]", 90, "WHB Router object is not activated");
LABEL_18:
      v5 = v10;
    }
  }

}

- (void)hostConnectionInterruptedOn:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (self->_isActivated)
  {
    v6 = CFSTR("CBLocalHostID");
    v10 = v4;
    if (v4)
      v6 = v4;
    v7 = v6;
    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter hostConnectionInterruptedOn:]", 30, "WHB Infrastructure connection interruptted to WHBHost: %@", v7);
    }
    -[CBWHBRouter removefromRemoteHostMapWithKey:](self, "removefromRemoteHostMapWithKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v8, "reportWhbMetric:", &off_100960F88);

    goto LABEL_12;
  }
  if (dword_100977AA0 <= 90)
  {
    v10 = v4;
    if (dword_100977AA0 != -1 || (v9 = _LogCategory_Initialize(&dword_100977AA0, 90), v5 = v10, v9))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter hostConnectionInterruptedOn:]", 90, "WHB Router object is not activated");
LABEL_12:
      v5 = v10;
    }
  }

}

- (void)deviceConnectionInterruptedOn:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (self->_isActivated)
  {
    v9 = v4;
    if (dword_100977AA0 <= 30)
    {
      if (dword_100977AA0 != -1 || (v6 = _LogCategory_Initialize(&dword_100977AA0, 30), v5 = v9, v6))
        LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceConnectionInterruptedOn:]", 30, "Device connection interruptted to device: %@", v5);
    }
    -[CBWHBRouter deviceLost:](self, "deviceLost:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v7, "reportWhbMetric:", &off_100960FB0);

    goto LABEL_10;
  }
  if (dword_100977AA0 <= 90)
  {
    v9 = v4;
    if (dword_100977AA0 != -1 || (v8 = _LogCategory_Initialize(&dword_100977AA0, 90), v5 = v9, v8))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter deviceConnectionInterruptedOn:]", 90, "WHB Router object is not activated");
LABEL_10:
      v5 = v9;
    }
  }

}

- (id)optimalWHBHostForStableIdentifier:(id)a3 result:(int *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;

  v6 = a3;
  if (self->_isActivated)
  {
    if (a4)
      *a4 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceTable, "objectForKeyedSubscript:", v6));
    if (!v7)
    {
      if (dword_100977AA0 <= 90
        && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
      {
        LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]", 90, "WHB Router device: %@ is not yet discovered", v6);
      }
      v15 = 0;
      if (a4)
        *a4 = 1701;
      goto LABEL_32;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBRouter rankWHBHosts:](self, "rankWHBHosts:", v6));
    v9 = v8;
    if (v8)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBRouter getCBDeviceForStableId:onHost:](self, "getCBDeviceForStableId:onHost:", v6, v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v11));
        objc_msgSend(v13, "setEstimatedConnections:", (char *)objc_msgSend(v13, "estimatedConnections") + 1);
        objc_msgSend(v13, "setEstimatedConnectionsLastUpdatedTicks:", mach_absolute_time());
        if (dword_100977AA0 <= 30
          && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
        {
          LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]", 30, "Estimated Connections:%llu for WHBHost:%@", objc_msgSend(v13, "estimatedConnections"), v11);
        }

        v20 = CFSTR("CBWHBMetricsKeyEventType");
        v21 = CFSTR("CBWHBMetricsKeySubEventType");
        v23 = CFSTR("WhbStateEvent");
        v24 = CFSTR("OptimalWHBHost");
        v22 = CFSTR("CBWHBMetricsKeyHostIdentifier");
        v16 = objc_msgSend(v11, "isEqual:", CFSTR("CBLocalHostID"));
        v14 = CFSTR("NotLocal");
        if (v16)
          v14 = CFSTR("Local");
        goto LABEL_27;
      }
      if (a4)
        *a4 = 345;
    }
    v12 = 0;
    v11 = 0;
    v20 = CFSTR("CBWHBMetricsKeyEventType");
    v21 = CFSTR("CBWHBMetricsKeySubEventType");
    v23 = CFSTR("WhbStateEvent");
    v24 = CFSTR("OptimalWHBHost");
    v22 = CFSTR("CBWHBMetricsKeyHostIdentifier");
    v14 = CFSTR("None");
LABEL_27:
    v25 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v20, 3));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v18, "reportWhbMetric:", v17);

    if (dword_100977AA0 <= 30
      && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 30)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]", 30, "Optimal host to reach stableId: %@ is %@ via CBDevice:%@", v6, v11, v12, v20, v21, v22, v23, v24);
    }
    v15 = v12;

LABEL_32:
    goto LABEL_33;
  }
  if (dword_100977AA0 <= 90 && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter optimalWHBHostForStableIdentifier:result:]", 90, "WHB Router object is not activated");
  v15 = 0;
LABEL_33:

  return v15;
}

- (id)getCBDeviceForStableId:(id)a3 onHost:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v7));
  v9 = v8;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000624AC;
  v21 = sub_100062310;
  v22 = 0;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceList"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100094344;
    v13[3] = &unk_100918070;
    v14 = v6;
    v15 = v7;
    v16 = &v17;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  else if (dword_100977AA0 <= 90
         && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
  {
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter getCBDeviceForStableId:onHost:]", 90, "Unable to find entry for stableIdentifier:%@ on WHBHost: %@", v6, v7);
  }
  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)description
{
  return -[CBWHBRouter descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id *v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  NSMutableDictionary *whbHostTable;
  id v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;

  if (a3 > 0x14u)
  {
    v17 = 0;
    v10 = objc_msgSend((id)objc_opt_class(self), "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    v11 = -[NSMutableDictionary count](self->_deviceTable, "count");
    v16 = -[NSMutableDictionary count](self->_whbHostTable, "count");
    v9 = (id *)&v17;
    NSAppendPrintF_safe(&v17, "%@: devices %d, hosts %d", v8, v11, v16);
    goto LABEL_7;
  }
  v22 = 0;
  v4 = objc_msgSend((id)objc_opt_class(self), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF_safe(&v22, "== %@ ==\n", v5);
  v6 = (__CFString *)v22;

  if (self->_deviceTable)
  {
    v21 = v6;
    NSAppendPrintF_safe(&v21, "DeviceTable:\n");
    v7 = v21;

    v20 = v7;
    NSAppendPrintF_safe(&v20, "%@", self->_deviceTable);
    v6 = v20;

  }
  if (self->_whbHostTable)
  {
    v19 = v6;
    NSAppendPrintF_safe(&v19, "WHBHostTable:\n");
    v8 = v19;

    v18 = v8;
    whbHostTable = self->_whbHostTable;
    v9 = (id *)&v18;
    NSAppendPrintF_safe(&v18, "%@", whbHostTable);
LABEL_7:
    v6 = (__CFString *)*v9;

  }
  if (v6)
    v12 = v6;
  else
    v12 = &stru_100941758;
  v13 = v12;

  return v13;
}

- (void)updateCoexUpdate:(id)a3 whbHost:(id)a4
{
  void *v6;
  id v7;
  CBWHBHostEntry *v8;
  CBWHBHostEntry *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NUMBER_OF_LE_CONNECTIONS")));
  v7 = objc_msgSend(v6, "unsignedLongValue");
  v8 = (CBWHBHostEntry *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbHostTable, "objectForKeyedSubscript:", v12));
  if (v8)
  {
    v9 = v8;
    -[CBWHBHostEntry setEstimatedConnections:](v8, "setEstimatedConnections:", 0);
    -[CBWHBHostEntry setEstimatedConnectionsLastUpdatedTicks:](v9, "setEstimatedConnectionsLastUpdatedTicks:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry coexUsage](v9, "coexUsage"));
    objc_msgSend(v10, "setNumLEConnection:", v7);

  }
  else
  {
    v9 = objc_alloc_init(CBWHBHostEntry);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWHBHostEntry coexUsage](v9, "coexUsage"));
    objc_msgSend(v11, "setNumLEConnection:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbHostTable, "setObject:forKeyedSubscript:", v9, v12);
  }

}

- (void)receivedUpdateEvent:(id)a3 hostID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v6 = a3;
  v7 = a4;
  if (self->_isActivated)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NUMBER_OF_LE_CONNECTIONS")));
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "unsignedLongValue");
      -[CBWHBRouter updateCoexUpdate:whbHost:](self, "updateCoexUpdate:whbHost:", v6, v7);
      v14[0] = CFSTR("CBWHBMetricsKeyEventType");
      v14[1] = CFSTR("CBWHBMetricsKeySubEventType");
      v15[0] = CFSTR("CoexUpdateEvent");
      v15[1] = CFSTR("ReceivedCoexUpdate");
      v14[2] = CFSTR("CBWHBMetricsKeyNumLEConnections");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
      v15[2] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
      objc_msgSend(v13, "reportWhbMetric:", v12);

    }
    else if (dword_100977AA0 <= 90
           && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
    {
      LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter receivedUpdateEvent:hostID:]", 90, "Invalid event received from WHBHost %@", v7);
    }

  }
  else if (dword_100977AA0 <= 90
         && (dword_100977AA0 != -1 || _LogCategory_Initialize(&dword_100977AA0, 90)))
  {
    LogPrintF_safe(&dword_100977AA0, "-[CBWHBRouter receivedUpdateEvent:hostID:]", 90, "WHB Router object is not activated");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_whbHostTable, 0);
  objc_storeStrong((id *)&self->_deviceTable, 0);
}

@end
