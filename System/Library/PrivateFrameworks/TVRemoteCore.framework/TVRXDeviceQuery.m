@implementation TVRXDeviceQuery

- (TVRXDeviceQuery)init
{
  TVRXDeviceQuery *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *aggregateDevices;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRXDeviceQuery;
  v2 = -[TVRXDeviceQuery init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    aggregateDevices = v2->_aggregateDevices;
    v2->_aggregateDevices = v3;

  }
  return v2;
}

- (NSSet)devices
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_aggregateDevices, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "publicDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "publicDevice");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v12;
}

- (void)start
{
  NSObject *v3;
  int v4;
  TVRXDeviceQuery *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_isRunning)
  {
    -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");
  }
  else
  {
    _TVRCGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = self;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> starting.", (uint8_t *)&v4, 0xCu);
    }

    self->_isRunning = 1;
    -[NSMutableDictionary removeAllObjects](self->_aggregateDevices, "removeAllObjects");
    -[TVRXDeviceQuery _startSearch](self, "_startSearch");
  }
}

- (void)stop
{
  NSObject *v3;
  int v4;
  TVRXDeviceQuery *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_isRunning)
  {
    _TVRCGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = self;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> stopping.", (uint8_t *)&v4, 0xCu);
    }

    self->_isRunning = 0;
    -[TVRXDeviceQuery _stopSearch](self, "_stopSearch");
    -[NSMutableDictionary removeAllObjects](self->_aggregateDevices, "removeAllObjects");
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)_startSearch
{
  NSObject *v3;
  TVRCRapportDeviceQuery *v4;
  TVRCRapportDeviceQuery *rapportDeviceQuery;
  NSObject *v6;
  _TVRCRMSDeviceQuery *v7;
  _TVRCRMSDeviceQuery *rmsDeviceQuery;
  TVRCMatchPointDeviceQuery *v9;
  TVRCMatchPointDeviceQuery *matchPointQuery;
  int v11;
  TVRXDeviceQuery *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> has Rapport enabled.", (uint8_t *)&v11, 0xCu);
  }

  v4 = objc_alloc_init(TVRCRapportDeviceQuery);
  rapportDeviceQuery = self->_rapportDeviceQuery;
  self->_rapportDeviceQuery = v4;

  -[TVRCRapportDeviceQuery setDelegate:](self->_rapportDeviceQuery, "setDelegate:", self);
  -[TVRCRapportDeviceQuery start](self->_rapportDeviceQuery, "start");
  if (!+[TVRCFeatures legacyDevicesDisabled](TVRCFeatures, "legacyDevicesDisabled"))
  {
    _TVRCGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> has Legacy devices enabled.", (uint8_t *)&v11, 0xCu);
    }

    v7 = objc_alloc_init(_TVRCRMSDeviceQuery);
    rmsDeviceQuery = self->_rmsDeviceQuery;
    self->_rmsDeviceQuery = v7;

    -[_TVRCRMSDeviceQuery setDelegate:](self->_rmsDeviceQuery, "setDelegate:", self);
    -[_TVRCRMSDeviceQuery start](self->_rmsDeviceQuery, "start");
  }
  v9 = objc_alloc_init(TVRCMatchPointDeviceQuery);
  matchPointQuery = self->_matchPointQuery;
  self->_matchPointQuery = v9;

  -[TVRCMatchPointDeviceQuery setDelegate:](self->_matchPointQuery, "setDelegate:", self);
  -[TVRCMatchPointDeviceQuery start](self->_matchPointQuery, "start");
}

- (void)_stopSearch
{
  TVRCMatchPointDeviceQuery *matchPointQuery;
  TVRCRapportDeviceQuery *rapportDeviceQuery;
  _TVRCRMSDeviceQuery *rmsDeviceQuery;

  -[TVRCMatchPointDeviceQuery setDelegate:](self->_matchPointQuery, "setDelegate:", 0);
  -[TVRCMatchPointDeviceQuery stop](self->_matchPointQuery, "stop");
  matchPointQuery = self->_matchPointQuery;
  self->_matchPointQuery = 0;

  -[TVRCRapportDeviceQuery stop](self->_rapportDeviceQuery, "stop");
  -[TVRCRapportDeviceQuery setDelegate:](self->_rapportDeviceQuery, "setDelegate:", 0);
  rapportDeviceQuery = self->_rapportDeviceQuery;
  self->_rapportDeviceQuery = 0;

  -[_TVRCRMSDeviceQuery stop](self->_rmsDeviceQuery, "stop");
  -[_TVRCRMSDeviceQuery setDelegate:](self->_rmsDeviceQuery, "setDelegate:", 0);
  rmsDeviceQuery = self->_rmsDeviceQuery;
  self->_rmsDeviceQuery = 0;

}

- (id)_findAggregateForIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  id v5;
  _TVRDeviceAggregate *v6;
  NSObject *v7;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_aggregateDevices, "objectForKey:", v5);
  v6 = (_TVRDeviceAggregate *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (v5)
    {
      v6 = objc_alloc_init(_TVRDeviceAggregate);
      -[NSMutableDictionary setObject:forKey:](self->_aggregateDevices, "setObject:forKey:", v6, v5);
    }
    else
    {
      _TVRCGeneralLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:].cold.1(v7);

      v6 = 0;
    }
  }

  return v6;
}

- (void)_reevaluateAggregates
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  TVRXDeviceQuery *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  _TVRCGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Re-evaluating aggregates.", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_aggregateDevices, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 134218242;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_aggregateDevices, "objectForKey:", v11, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEmpty"))
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v12, "publicDevice");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = -[TVRXDevice _init]([TVRXDevice alloc], "_init");
            _TVRCGeneralLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v25 = self;
              v26 = 2114;
              v27 = (uint64_t)v13;
              _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Created %{public}@", buf, 0x16u);
            }

            objc_msgSend(v12, "setPublicDevice:", v13);
          }
          objc_msgSend(v13, "_impl");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            objc_msgSend(v12, "bestImpl");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_setImpl:", v16);

          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

  _TVRCGeneralLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218240;
    v25 = self;
    v26 = 2048;
    v27 = v18;
    _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Removing %lu aggregates.", buf, 0x16u);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_aggregateDevices, "removeObjectsForKeys:", v4);
}

- (void)_notifyDelegateDidUpdateDevices
{
  TVRXDeviceQueryDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "deviceQueryDidUpdateDevices:", self);

  }
}

- (void)matchpointDeviceQuery:(id)a3 addedService:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  TVRXDeviceQuery *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRCDeviceQuery %p> HomeKit added service %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHomeKit:", v5);
  -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
  -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");

}

- (void)matchpointDeviceQuery:(id)a3 removedService:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  TVRXDeviceQuery *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRCDeviceQuery %p> HomeKit removed service %{public}@.", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _TVRCGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "<TVRCDeviceQuery %p> Aggregate existed for removed service.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v8, "setHomeKit:", 0);
    -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
    -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");
  }

}

- (void)rapportDeviceQuery:(id)a3 addedDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  TVRXDeviceQuery *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Rapport found new device %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRapport:", v5);
  -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
  -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");

}

- (void)rapportDeviceQuery:(id)a3 removedDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  TVRXDeviceQuery *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Rapport removed device %{public}@.", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _TVRCGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Aggregate existed for removed television.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v8, "setRapport:", 0);
    -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
    -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");
  }

}

- (void)rmsDeviceQuery:(id)a3 addedDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  TVRXDeviceQuery *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> RMS found new device %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRemoteMediaService:", v5);
  -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
  -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");

}

- (void)rmsDeviceQuery:(id)a3 removedDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  TVRXDeviceQuery *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _TVRCGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> RMS removed device %{public}@.", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRXDeviceQuery _findAggregateForIdentifier:createIfNeeded:](self, "_findAggregateForIdentifier:createIfNeeded:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _TVRCGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Aggregate existed for removed television.", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v8, "setRemoteMediaService:", 0);
    -[TVRXDeviceQuery _reevaluateAggregates](self, "_reevaluateAggregates");
    -[TVRXDeviceQuery _notifyDelegateDidUpdateDevices](self, "_notifyDelegateDidUpdateDevices");
  }

}

- (TVRXDeviceQueryDelegate)delegate
{
  return (TVRXDeviceQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)aggregateDevices
{
  return self->_aggregateDevices;
}

- (void)setAggregateDevices:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateDevices, a3);
}

- (TVRCRapportDeviceQuery)rapportDeviceQuery
{
  return self->_rapportDeviceQuery;
}

- (void)setRapportDeviceQuery:(id)a3
{
  objc_storeStrong((id *)&self->_rapportDeviceQuery, a3);
}

- (_TVRCRMSDeviceQuery)rmsDeviceQuery
{
  return self->_rmsDeviceQuery;
}

- (void)setRmsDeviceQuery:(id)a3
{
  objc_storeStrong((id *)&self->_rmsDeviceQuery, a3);
}

- (TVRCMatchPointDeviceQuery)matchPointQuery
{
  return self->_matchPointQuery;
}

- (void)setMatchPointQuery:(id)a3
{
  objc_storeStrong((id *)&self->_matchPointQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchPointQuery, 0);
  objc_storeStrong((id *)&self->_rmsDeviceQuery, 0);
  objc_storeStrong((id *)&self->_rapportDeviceQuery, 0);
  objc_storeStrong((id *)&self->_aggregateDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_findAggregateForIdentifier:(os_log_t)log createIfNeeded:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Device with nil identifier", v1, 2u);
}

@end
