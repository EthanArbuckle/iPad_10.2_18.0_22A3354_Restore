@implementation ETService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDElapsedTimeServiceString);
}

- (ETService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  ETService *v5;
  ETService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setPriority:](v5, "setPriority:", 5);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  void *v8;

  v7.receiver = self;
  v7.super_class = (Class)ETService;
  -[ClientService start](&v7, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDCurrentElapsedTimeCharacteristicString));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v5, "discoverCharacteristics:forService:", v4, v6);

}

- (void)stop
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ETService;
  -[ClientService stop](&v2, "stop");
}

- (id)dateWithElapsedTimeData:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unint64_t lastTimeSyncFlags;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSDate *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t lastTimeSyncTimeValue;
  unint64_t v23;
  NSDate *lastTimeSyncTimestamp;
  void *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  __int16 v32;
  unint64_t v33;
  unsigned __int8 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BYTE v40[10];
  unint64_t v41;
  __int16 v42;
  NSDate *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;

  v4 = a3;
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v4, 1));
  v6 = 1.0;
  if (objc_msgSend(v5, "readUint8:", &v34))
  {
    lastTimeSyncFlags = self->_lastTimeSyncFlags;
    if ((_DWORD)lastTimeSyncFlags != v34)
    {
      v26 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v28 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
        v31 = self->_lastTimeSyncFlags;
        *(_DWORD *)buf = 141558787;
        v36 = 1752392040;
        v37 = 2113;
        v38 = v30;
        v39 = 1024;
        *(_DWORD *)v40 = v34;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "ETS for peripheral \"%{private, mask.hash}@\" failed: flags: %d, lastTimeSyncFlags %d", buf, 0x22u);

      }
      goto LABEL_14;
    }
    v6 = dbl_100086540[(lastTimeSyncFlags >> 2) & 3];
  }
  if (!objc_msgSend(v5, "readUint48:", &v33)
    || !objc_msgSend(v5, "readUint8:", (char *)&v32 + 1)
    || !objc_msgSend(v5, "readUint8:", &v32))
  {
    v18 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
      lastTimeSyncTimeValue = self->_lastTimeSyncTimeValue;
      v23 = v33;
      lastTimeSyncTimestamp = self->_lastTimeSyncTimestamp;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ETService getDescriptionForTimeSyncSourceType:](self, "getDescriptionForTimeSyncSourceType:", HIBYTE(v32)));
      *(_DWORD *)buf = 141559811;
      v36 = 1752392040;
      v37 = 2113;
      v38 = v21;
      v39 = 2048;
      *(_QWORD *)v40 = v23;
      *(_WORD *)&v40[8] = 2048;
      v41 = lastTimeSyncTimeValue;
      v42 = 2112;
      v43 = lastTimeSyncTimestamp;
      v44 = 2048;
      v45 = 0.0;
      v46 = 2112;
      v47 = v25;
      v48 = 1024;
      v49 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "ETS Error for peripheral \"%{private, mask.hash}@\": timeValue %llu, _lastSyncTime %llu, %@, diffInSeconds %f, timeSyncSource %@, dstOffset %d", buf, 0x4Eu);

    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v8 = v6 * ((double)v33 - (double)self->_lastTimeSyncTimeValue);
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v13 = self->_lastTimeSyncTimeValue;
    v14 = v33;
    v15 = self->_lastTimeSyncTimestamp;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ETService getDescriptionForTimeSyncSourceType:](self, "getDescriptionForTimeSyncSourceType:", HIBYTE(v32)));
    *(_DWORD *)buf = 141559811;
    v36 = 1752392040;
    v37 = 2113;
    v38 = v12;
    v39 = 2048;
    *(_QWORD *)v40 = v14;
    *(_WORD *)&v40[8] = 2048;
    v41 = v13;
    v42 = 2112;
    v43 = v15;
    v44 = 2048;
    v45 = v8;
    v46 = 2112;
    v47 = v16;
    v48 = 1024;
    v49 = v32;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": timeValue %llu, _lastSyncTime %llu, %@, diffInSeconds %f, timeSyncSource %@, dstOffset %d", buf, 0x4Eu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", self->_lastTimeSyncTimestamp, v8));
LABEL_15:

  return v17;
}

- (id)getDescriptionForTimeSyncSourceType:(unsigned __int8)a3
{
  int v3;
  void *v6;

  v3 = a3;
  if (a3 < 8u)
    return off_1000ADA40[(char)a3];
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006CFB4(v6, (uint64_t)self, v3);
  return CFSTR("Invalid");
}

- (void)extractTime
{
  NSDate *v3;
  NSDate *lastTimeSyncTimestamp;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t lastTimeSyncTimeValue;
  NSDate *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  __int16 v31;
  __int16 v32;
  unint64_t v33;
  unsigned __int8 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastTimeSyncTimestamp = self->_lastTimeSyncTimestamp;
  self->_lastTimeSyncTimestamp = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ETService currentElapsedTimeCharacteristic](self, "currentElapsedTimeCharacteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v6, 1));

  v8 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    *(_DWORD *)buf = 141558531;
    v36 = 1752392040;
    v37 = 2113;
    v38 = (uint64_t)v11;
    v39 = 2112;
    v40 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\" data received rawDataBytes %@", buf, 0x20u);

  }
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  if (objc_msgSend(v7, "readUint8:", &v34))
  {
    self->_lastTimeSyncFlags = v34;
    v12 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      *(_DWORD *)buf = 141558531;
      v36 = 1752392040;
      v37 = 2113;
      v38 = (uint64_t)v15;
      v39 = 1024;
      LODWORD(v40) = v34;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\" data received, flags %d", buf, 0x1Cu);

    }
  }
  if (objc_msgSend(v7, "readUint48:", &v33))
  {
    if (objc_msgSend(v7, "readUint8:", (char *)&v32 + 1))
    {
      if (objc_msgSend(v7, "readUint8:", &v32))
      {
        self->_lastTimeSyncTimeValue = v33;
        v16 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          lastTimeSyncTimeValue = self->_lastTimeSyncTimeValue;
          v21 = self->_lastTimeSyncTimestamp;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ETService getDescriptionForTimeSyncSourceType:](self, "getDescriptionForTimeSyncSourceType:", HIBYTE(v32)));
          *(_DWORD *)buf = 141559299;
          v36 = 1752392040;
          v37 = 2113;
          v38 = (uint64_t)v19;
          v39 = 2048;
          v40 = lastTimeSyncTimeValue;
          v41 = 2112;
          v42 = v21;
          v43 = 2112;
          v44 = v22;
          v45 = 1024;
          v46 = v32;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": referenceTimeValue %llu / %@, timeSyncSource %@, dstOffset %d", buf, 0x3Au);

        }
      }
    }
  }
  if (objc_msgSend(v7, "readUint8:", (char *)&v31 + 1) && (v31 & 0x100) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ETService currentElapsedTimeCharacteristic](self, "currentElapsedTimeCharacteristic"));
    objc_msgSend(v23, "properties");

  }
  if (objc_msgSend(v7, "readUint8:", &v31))
  {
    self->_lastTimeSyncClockCapability = v31;
    v24 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
      v28 = (void *)v27;
      *(_DWORD *)buf = 141558787;
      v36 = 1752392040;
      if ((v31 & 1) != 0)
        v29 = "Y";
      else
        v29 = "N";
      v37 = 2113;
      if ((v31 & 2) != 0)
        v30 = "Y";
      else
        v30 = "N";
      v38 = v27;
      v39 = 2080;
      v40 = (unint64_t)v29;
      v41 = 2080;
      v42 = (void *)v30;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ETS for peripheral \"%{private, mask.hash}@\": clockAppliesDSTRules %s, clockManagesTZChanges %s", buf, 0x2Au);

    }
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D080(v10);
  }
  else
  {
    v22 = v8;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristics"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      v15 = CBUUIDCurrentElapsedTimeCharacteristicString;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ETService currentElapsedTimeCharacteristic](self, "currentElapsedTimeCharacteristic"));
          if (v18)
          {

          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v15));
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if (v21)
            {
              -[ETService setCurrentElapsedTimeCharacteristic:](self, "setCurrentElapsedTimeCharacteristic:", v17);
              objc_msgSend(v23, "readValueForCharacteristic:", v17);
              if ((objc_msgSend(v17, "properties") & 0x10) != 0
                || (objc_msgSend(v17, "properties") & 0x20) != 0)
              {
                objc_msgSend(v23, "setNotifyValue:forCharacteristic:", 1, v17);
              }
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    -[ClientService notifyDidStart](self, "notifyDidStart");
    v9 = 0;
    v8 = v22;
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D118(v11);
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ETService currentElapsedTimeCharacteristic](self, "currentElapsedTimeCharacteristic"));

    if (v12 == v9)
      -[ETService extractTime](self, "extractTime");
  }

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D1B0(v10);
  }

}

- (CBCharacteristic)currentElapsedTimeCharacteristic
{
  return self->_currentElapsedTimeCharacteristic;
}

- (void)setCurrentElapsedTimeCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_currentElapsedTimeCharacteristic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElapsedTimeCharacteristic, 0);
  objc_storeStrong((id *)&self->_lastTimeSyncTimestamp, 0);
}

@end
