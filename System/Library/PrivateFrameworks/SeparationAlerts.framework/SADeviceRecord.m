@implementation SADeviceRecord

- (void)updateLocation:(id)a3
{
  id v5;
  TALocationLite *v6;
  id *p_lastLocation;
  TALocationLite *lastLocation;
  void *v9;
  void *v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  lastLocation = self->_lastLocation;
  p_lastLocation = (id *)&self->_lastLocation;
  v6 = lastLocation;
  if (lastLocation)
  {
    -[TALocationLite getDate](v6, "getDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10) != 0;

    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v11 = 1;
    if (!v5)
      goto LABEL_9;
  }
  objc_msgSend(v5, "horizontalAccuracy");
  if (!v11 || v12 >= 70.0)
  {
LABEL_9:
    v17 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      v18 = *p_lastLocation;
      v15 = v17;
      objc_msgSend(v18, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v16;
      v26 = 2113;
      v27 = v19;
      _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SADeviceRecord updateLocation update criteria not satisfied\", \"lastLocation\":\"%{private}@\", \"newLocation\":\"%{private}@\"}", (uint8_t *)&v20, 0x26u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_storeStrong(p_lastLocation, a3);
  v13 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    v14 = *p_lastLocation;
    v15 = v13;
    objc_msgSend(v14, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 68289283;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2113;
    v25 = v16;
    _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SADeviceRecord updateLocation updated\", \"lastLocation\":\"%{private}@\"}", (uint8_t *)&v20, 0x1Cu);
LABEL_11:

  }
LABEL_12:

}

- (void)ingestTAEvent:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SADeviceRecord _updateSingleDeviceRecordForDevice:](self, "_updateSingleDeviceRecordForDevice:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SADeviceRecord _updateDeviceRecordOnDeviceUpdateEvent:](self, "_updateDeviceRecordOnDeviceUpdateEvent:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SADeviceRecord _updateConnectionStateOnConnectionEvent:](self, "_updateConnectionStateOnConnectionEvent:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SADeviceRecord _updateLatestCaseAdvertisementDate:](self, "_updateLatestCaseAdvertisementDate:", v4);
    -[SADeviceRecord _updateLatestAdvertisement:](self, "_updateLatestAdvertisement:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SADeviceRecord updateLocation:](self, "updateLocation:", v4);

}

- (SADeviceRecord)initWithClock:(id)a3 analytics:(id)a4
{
  id v7;
  id v8;
  SADeviceRecord *v9;
  SADeviceRecord *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *deviceRecord;
  TALocationLite *lastLocation;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SADeviceRecord;
  v9 = -[SADeviceRecord init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clock, a3);
    objc_storeStrong((id *)&v10->_analytics, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceRecord = v10->_deviceRecord;
    v10->_deviceRecord = v11;

    lastLocation = v10->_lastLocation;
    v10->_lastLocation = 0;

  }
  return v10;
}

- (id)getAllUUIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys");
}

- (id)getSADevice:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)getConnectionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "connectionState");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getWithYouStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "withYouStatus");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getDeviceNotificationState:(id)a3
{
  return 0;
}

- (id)getLatestAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLatestNOAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestNOAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLatestWildAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestWildAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLatestCaseAdvertisementDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestCaseAdvertisementDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLastWithYouDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastWithYouDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLastCompanionDisconnectionDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastCompanionDisconnectionDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getScenarioClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentScenarioClass");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)getMonitoringSessionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentMonitoringSessionState");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRelatedDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuidsOfRelatedDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLastWithYouLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastWithYouLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateLatestAdvertisement:(id)a3 forDeviceWithUUID:(id)a4
{
  NSMutableDictionary *deviceRecord;
  id v6;
  id v7;

  deviceRecord = self->_deviceRecord;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLatestAdvertisement:", v6);

}

- (void)_updateSingleDeviceRecordForDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *deviceRecord;
  SASingleDeviceRecord *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  deviceRecord = self->_deviceRecord;
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
    v7 = (SASingleDeviceRecord *)objc_claimAutoreleasedReturnValue();
    -[SASingleDeviceRecord setDevice:](v7, "setDevice:", v4);

  }
  else
  {
    v7 = -[SASingleDeviceRecord initWithDevice:clock:analytics:]([SASingleDeviceRecord alloc], "initWithDevice:clock:analytics:", v4, self->_clock, self->_analytics);

    -[NSMutableDictionary setObject:forKey:](deviceRecord, "setObject:forKey:", v7, v8);
  }

}

- (void)_updateDeviceRecordOnDeviceUpdateEvent:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableDictionary *deviceRecord;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_13;
  if (!objc_msgSend(v14, "eventType"))
  {
    objc_msgSend(v14, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SADeviceRecord _updateSingleDeviceRecordForDevice:](self, "_updateSingleDeviceRecordForDevice:", v8);
LABEL_10:

    v6 = v14;
    goto LABEL_11;
  }
  v5 = objc_msgSend(v14, "eventType") == 1;
  v6 = v14;
  if (v5)
  {
    objc_msgSend(v14, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isConnected");

    deviceRecord = self->_deviceRecord;
    if (v10)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDevice:", 0);
    }
    else
    {
      objc_msgSend(v14, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](deviceRecord, "removeObjectForKey:", v13);

    }
    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v6, "lastEvent"))
    -[SADeviceRecord _updateAllRelatedDevices](self, "_updateAllRelatedDevices");
LABEL_13:

}

- (void)_updateAllRelatedDevices
{
  __int128 v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v33;
    *(_QWORD *)&v2 = 68289795;
    v22 = v2;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[SADeviceRecord getSADevice:](self, "getSADevice:", v4, v22);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "groupIdentifier");
        v6 = objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "resetRelatedDevices");

        v8 = (void *)v6;
        if (v6)
        {
          v26 = i;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v9 = obj;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v29 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                if ((objc_msgSend(v14, "isEqual:", v4) & 1) == 0)
                {
                  -[SADeviceRecord getSADevice:](self, "getSADevice:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "groupIdentifier");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v16, "isEqual:", v8);

                  if (v17)
                  {
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "insertRelatedDevice:", v14);

                  }
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
            }
            while (v11);
          }

          i = v26;
        }
        v19 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          -[SADeviceRecord getRelatedDevices:](self, "getRelatedDevices:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v37 = 0;
          v38 = 2082;
          v39 = "";
          v40 = 2113;
          v41 = v4;
          v42 = 2113;
          v43 = v8;
          v44 = 2113;
          v45 = v21;
          _os_log_impl(&dword_1CA04F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa related devices update for device\", \"uuid\":\"%{private}@\", \"groupID\":\"%{private}@\", \"related devices\":\"%{private}@\"}", buf, 0x30u);

        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    }
    while (v24);
  }

}

- (void)_updateConnectionStateOnConnectionEvent:(id)a3
{
  NSMutableDictionary *deviceRecord;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  SASingleDeviceRecord *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  id v24;

  v24 = a3;
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v24, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_3;
  }
  if (objc_msgSend(v24, "state") == 2)
  {

LABEL_14:
    v21 = self->_deviceRecord;
    v16 = -[SASingleDeviceRecord initWithConnectionEvent:clock:analytics:]([SASingleDeviceRecord alloc], "initWithConnectionEvent:clock:analytics:", v24, self->_clock, self->_analytics);
    objc_msgSend(v24, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v16, v22);

    goto LABEL_17;
  }
  v20 = objc_msgSend(v24, "state");

  if (v20 == 3)
    goto LABEL_14;
LABEL_3:
  objc_msgSend(v24, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADeviceRecord getSADevice:](self, "getSADevice:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (objc_msgSend(v24, "state"))
    {
      v19 = objc_msgSend(v24, "state");

      if (v19 != 1)
        goto LABEL_5;
    }
    else
    {

    }
    v23 = self->_deviceRecord;
    objc_msgSend(v24, "identifier");
    v16 = (SASingleDeviceRecord *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v23, "removeObjectForKey:", v16);
    goto LABEL_17;
  }

LABEL_5:
  v9 = self->_deviceRecord;
  objc_msgSend(v24, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConnectionState:", objc_msgSend(v24, "state"));

  v12 = objc_msgSend(v24, "state");
  v13 = v24;
  if (!v12 || (v14 = objc_msgSend(v24, "state"), v13 = v24, v14 == 1))
  {
    v15 = self->_deviceRecord;
    objc_msgSend(v13, "identifier");
    v16 = (SASingleDeviceRecord *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateLastCompanionDisconnectionDate:", v18);

LABEL_17:
    v13 = v24;
  }

}

- (void)_updateLatestAdvertisement:(id)a3
{
  NSMutableDictionary *deviceRecord;
  id v4;
  void *v5;
  id v6;

  deviceRecord = self->_deviceRecord;
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLatestAdvertisement:", v4);

}

- (void)_updateLatestCaseAdvertisementDate:(id)a3
{
  id v4;
  NSMutableDictionary *deviceRecord;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  deviceRecord = self->_deviceRecord;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAirPodsCase");

  if (v9)
  {
    objc_msgSend(v4, "scanDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateLatestCaseAdvertisementDate:", v10);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "uuidsOfRelatedDevices", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "scanDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateLatestCaseAdvertisementDate:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
}

- (void)updateLastWithYouDate:(id)a3 forDeviceWithUUID:(id)a4
{
  NSMutableDictionary *deviceRecord;
  id v6;
  id v7;

  deviceRecord = self->_deviceRecord;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLastWithYouDate:", v6);

}

- (void)updateScenario:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  id v5;

  -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCurrentScenarioClass:", a3);

}

- (void)updateMonitoringSessionState:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  id v5;

  -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentMonitoringSessionState:", a3);

}

- (void)updateLastWithYouLocation:(id)a3 forDeviceWithUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  TALocationLite *lastLocation;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSMutableDictionary *deviceRecord;
  id v27;

  v27 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "currentScenarioClass");

      if (v9 == 3)
      {
        lastLocation = self->_lastLocation;
        if (lastLocation)
        {
          -[TALocationLite latitude](lastLocation, "latitude");
          v12 = v11;
          -[TALocationLite longitude](self->_lastLocation, "longitude");
          v14 = v13;
          v15 = objc_alloc(MEMORY[0x1E0C9E368]);
          -[TALocationLite horizontalAccuracy](self->_lastLocation, "horizontalAccuracy");
          v17 = v16;
          objc_msgSend(v6, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v15, "initWithCenter:radius:identifier:", v18, v12, v14, v17);

          -[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          v22 = v19;
LABEL_12:
          objc_msgSend(v20, "setLastWithYouLocation:", v22);

        }
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "currentScenarioClass");

        if (v27 && v24 == 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v27;
          else
            v25 = 0;
          deviceRecord = self->_deviceRecord;
          v21 = v25;
          -[NSMutableDictionary objectForKey:](deviceRecord, "objectForKey:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v20;
          v22 = v21;
          goto LABEL_12;
        }
      }
    }
  }

}

- (void)resetAllWithYouStatus
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_deviceRecord, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateWithYouStatus:", 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)hasSurfacedNotificationFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4
    && (-[NSMutableDictionary objectForKey:](self->_deviceRecord, "objectForKey:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSurfacedNotification");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasDisconnectedDevices
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_deviceRecord;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "connectionState");

        if (v9 < 2)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADeviceRecord)initWithCoder:(id)a3
{
  id v4;
  SADeviceRecord *v5;
  uint64_t v6;
  NSMutableDictionary *deviceRecord;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SADeviceRecord;
  v5 = -[SADeviceRecord init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceRecord"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceRecord, CFSTR("DeviceRecord"));
}

- (void)updatedWithYouStatusFrom:(unint64_t)a3 to:(unint64_t)a4 forDeviceWithUUID:(id)a5
{
  id v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithYouStatus:", a4);

}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (NSMutableDictionary)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (TALocationLite)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

@end
