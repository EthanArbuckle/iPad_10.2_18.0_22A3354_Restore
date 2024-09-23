@implementation CLDurianFetchFirmwareVersionTask

- (CLDurianFetchFirmwareVersionTask)initWithIncludeCrashLogs:(BOOL)a3
{
  CLDurianFetchFirmwareVersionTask *v3;
  objc_super v5;
  BOOL v6;

  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLDurianFetchFirmwareVersionTask;
  v3 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:](&v5, "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 7, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 1)), -6, 1, 0, 0);
  if (v3)
    v3->_crashData = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianFetchFirmwareVersionTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (id)description
{
  id v3;
  CLDurianNordicCrashEvent *nordicCrash;
  NSMutableDictionary *crashData;
  _QWORD v7[5];

  v3 = +[NSMutableString string](NSMutableString, "string");
  nordicCrash = self->_nordicCrash;
  if (nordicCrash)
    objc_msgSend(v3, "appendFormat:", CFSTR("<Nordic Crash: %@>, "), -[CLDurianNordicCrashEvent description](nordicCrash, "description"));
  crashData = self->_crashData;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1014F9D98;
  v7[3] = &unk_1021BC4D8;
  v7[4] = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](crashData, "enumerateKeysAndObjectsUsingBlock:", v7);
  return v3;
}

- (int64_t)timeoutSeconds
{
  return 20;
}

- (NSArray)roseCrashes
{
  id v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = -[NSMutableDictionary allValues](self->_crashData, "allValues");
  if (!objc_msgSend(v2, "count"))
    return 0;
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        -[NSMutableArray addObject:](v3, "addObject:", -[CLDurianRoseCrashEvent initWithData:]([CLDurianRoseCrashEvent alloc], "initWithData:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i)));
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return &v3->super;
}

- (void)appendNordicCrashData:(id)a3
{
  CLDurianNordicCrashEvent *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  CLDurianNordicCrashEvent *v10;

  v4 = -[CLDurianNordicCrashEvent initWithData:]([CLDurianNordicCrashEvent alloc], "initWithData:", a3);
  -[CLDurianFetchFirmwareVersionTask setNordicCrash:](self, "setNordicCrash:", v4);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #crash nordic data\", \"nordicCrashEvent\":%{public, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)appendRoseCrashData:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  v4 = objc_msgSend(a3, "subdataWithRange:", 1, (char *)objc_msgSend(a3, "length") - 1);
  v5 = *(unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = -[NSMutableDictionary objectForKey:](self->_crashData, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5 >> 4));
  if (!v6)
  {
    v6 = +[NSMutableData data](NSMutableData, "data");
    -[NSMutableDictionary setObject:forKey:](self->_crashData, "setObject:forKey:", v6, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5 >> 4));
  }
  objc_msgSend(v6, "appendData:", objc_msgSend(v4, "subdataWithRange:", 1, (char *)objc_msgSend(v4, "length") - 1));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289794;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2050;
    v12 = v5 >> 4;
    v13 = 2050;
    v14 = v5 & 0xF;
    v15 = 2050;
    v16 = objc_msgSend(v4, "length");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #crash rose data\", \"core\":%{public}lu, \"seqno\":%{public}lu, \"length\":%{public}lu}", (uint8_t *)v8, 0x30u);
  }
}

- (CLFindMyAccessoryFirmwareVersion)firmwareVersion
{
  return (CLFindMyAccessoryFirmwareVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CLDurianNordicCrashEvent)nordicCrash
{
  return (CLDurianNordicCrashEvent *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNordicCrash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

@end
