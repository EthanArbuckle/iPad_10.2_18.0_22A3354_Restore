@implementation CLDurianConnectionAttempt

- (CLDurianConnectionAttempt)init
{
  CLDurianConnectionAttempt *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLDurianConnectionAttempt;
  v2 = -[CLDurianConnectionAttempt init](&v4, "init");
  if (v2)
  {
    v2->_identifier = (NSUUID *)objc_alloc_init((Class)NSUUID);
    v2->_allMaterials = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_pendingMaterials = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_startTime = mach_continuous_time();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianConnectionAttempt;
  -[CLDurianConnectionAttempt dealloc](&v3, "dealloc");
}

- (int64_t)state
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  NSMutableDictionary *v25;
  __int16 v26;
  NSMutableDictionary *v27;

  v3 = (unint64_t)-[NSMutableDictionary count](self->_allMaterials, "count");
  v4 = (unint64_t)-[NSMutableDictionary count](self->_pendingMaterials, "count");
  v5 = 3;
  if (v4)
    v5 = 1;
  if (v3)
    v6 = v5;
  else
    v6 = 0;
  if (v3 | v4)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF60);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSMutableDictionary count](self->_allMaterials, "count");
      v9 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      v13[0] = 68290563;
      v13[1] = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2081;
      v17 = "state";
      v18 = 1026;
      v19 = v6;
      v20 = 1026;
      v21 = v8;
      v22 = 1026;
      v23 = v9;
      v24 = 2113;
      v25 = allMaterials;
      v26 = 2113;
      v27 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"state\":%{public}d, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v13, 0x42u);
    }
  }
  return v6;
}

- (BOOL)addPossiblePeripheral:(id)a3 withConnectionMaterial:(id)a4
{
  NSObject *v7;
  NSUUID *identifier;
  id v9;
  unsigned __int8 v10;
  NSObject *v11;
  NSUUID *v12;
  unsigned int v13;
  unsigned int v14;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  int v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  _BYTE v25[10];
  __int16 v26;
  NSMutableDictionary *v27;
  __int16 v28;
  NSMutableDictionary *v29;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF60);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v18 = 68289538;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2114;
    v23 = identifier;
    v24 = 2114;
    *(_QWORD *)v25 = objc_msgSend(a3, "identifier");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian add possible peripheral\", \"attemptUUID\":%{public, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@}", (uint8_t *)&v18, 0x26u);
  }
  if (!-[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3))
  {
    -[NSMutableDictionary setObject:forKey:](self->_pendingMaterials, "setObject:forKey:", +[NSMutableArray array](NSMutableArray, "array"), a3);
    -[NSMutableDictionary setObject:forKey:](self->_allMaterials, "setObject:forKey:", +[NSMutableArray array](NSMutableArray, "array"), a3);
  }
  v9 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3);
  v10 = objc_msgSend(v9, "containsObject:", a4);
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v9, "addObject:", a4);
    objc_msgSend(-[NSMutableDictionary objectForKey:](self->_allMaterials, "objectForKey:", a3), "addObject:", a4);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF60);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (NSUUID *)objc_msgSend(a3, "identifier");
      v13 = -[NSMutableDictionary count](self->_allMaterials, "count");
      v14 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      v18 = 68290307;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v12;
      v24 = 1026;
      *(_DWORD *)v25 = v13;
      *(_WORD *)&v25[4] = 1026;
      *(_DWORD *)&v25[6] = v14;
      v26 = 2113;
      v27 = allMaterials;
      v28 = 2113;
      v29 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian add material\", \"peripheralUUID\":%{public, location:escape_only}@, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x3Cu);
    }
  }
  return v10 ^ 1;
}

- (void)removePossiblePeripheral:(id)a3
{
  NSObject *v5;
  NSUUID *identifier;
  id v7;
  unsigned int v8;
  NSObject *v9;
  NSUUID *v10;
  unsigned int v11;
  unsigned int v12;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSUUID *v20;
  __int16 v21;
  _BYTE v22[10];
  _BYTE v23[10];
  __int16 v24;
  NSMutableDictionary *v25;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF60);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v7 = objc_msgSend(a3, "identifier");
    v8 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
    v15 = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2114;
    v20 = identifier;
    v21 = 2114;
    *(_QWORD *)v22 = v7;
    *(_WORD *)&v22[8] = 1026;
    *(_DWORD *)v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian removing possible peripheral\", \"attemptUUID\":%{public, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"pending\":%{public}d}", (uint8_t *)&v15, 0x2Cu);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingMaterials, "removeObjectForKey:", a3);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF60);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (NSUUID *)objc_msgSend(a3, "identifier");
    v11 = -[NSMutableDictionary count](self->_allMaterials, "count");
    v12 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    v15 = 68290307;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2114;
    v20 = v10;
    v21 = 1026;
    *(_DWORD *)v22 = v11;
    *(_WORD *)&v22[4] = 1026;
    *(_DWORD *)&v22[6] = v12;
    *(_WORD *)v23 = 2113;
    *(_QWORD *)&v23[2] = allMaterials;
    v24 = 2113;
    v25 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian remove material\", \"peripheralUUID\":%{public, location:escape_only}@, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Cu);
  }
}

- (id)nextConnectionMaterialForPeripheral:(id)a3
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  id result;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  NSMutableDictionary *v20;
  __int16 v21;
  NSMutableDictionary *v22;

  v5 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF60);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    v8 = objc_msgSend(a3, "identifier");
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    v12[0] = 68290051;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 1026;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    v19 = 2113;
    v20 = allMaterials;
    v21 = 2113;
    v22 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection nextConnectionMaterialForPeripheral\", \"count\":%{public}d, \"peripheralUUID\":%{public, location:escape_only}@, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x36u);
  }
  result = objc_msgSend(v5, "count");
  if (result)
    return objc_msgSend(v5, "objectAtIndex:", 0);
  return result;
}

- (id)connectionMaterialsForPeripheral:(id)a3
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3), "copy");
}

- (void)popConnectionMaterialForPeripheral:(id)a3
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  NSMutableDictionary *v21;
  __int16 v22;
  NSMutableDictionary *v23;

  v5 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:");
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    if (!objc_msgSend(v5, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_pendingMaterials, "removeObjectForKey:", a3);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF60);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableDictionary count](self->_allMaterials, "count");
      v8 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
      allMaterials = self->_allMaterials;
      pendingMaterials = self->_pendingMaterials;
      v12 = 2082;
      v11[0] = 68290307;
      v13 = "";
      v14 = 2081;
      v11[1] = 0;
      v15 = "popConnectionMaterialForPeripheral";
      v16 = 1026;
      v17 = v7;
      v18 = 1026;
      v19 = v8;
      v20 = 2113;
      v21 = allMaterials;
      v22 = 2113;
      v23 = pendingMaterials;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"all\":%{public}d, \"pending\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x3Cu);
    }
  }
}

- (BOOL)hasConnectionMaterialForPeripheral:(id)a3
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3), "count") != 0;
}

- (BOOL)doesPeripheral:(id)a3 haveAddress:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = -[NSMutableDictionary objectForKey:](self->_pendingMaterials, "objectForKey:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(a4, "isEqualToData:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "address")) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (NSArray)possiblePeripherals
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_pendingMaterials, "allKeys");
}

- (double)attemptDuration
{
  uint64_t v2;
  double result;

  if (!self->_startTime)
    return 0.0;
  v2 = mach_continuous_time() - self->_startTime;
  TMConvertTicksToSeconds(v2);
  return result;
}

- (id)inertCopy
{
  CLDurianConnectionAttempt *v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSMutableDictionary *allMaterials;
  NSMutableDictionary *pendingMaterials;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  NSMutableDictionary *v23;
  __int16 v24;
  NSMutableDictionary *v25;

  v3 = objc_alloc_init(CLDurianConnectionAttempt);
  -[CLDurianConnectionAttempt setAllMaterials:](v3, "setAllMaterials:", -[NSMutableDictionary mutableCopy](self->_allMaterials, "mutableCopy"));
  -[CLDurianConnectionAttempt setPendingMaterials:](v3, "setPendingMaterials:", -[NSMutableDictionary mutableCopy](self->_pendingMaterials, "mutableCopy"));
  -[CLDurianConnectionAttempt setKrMaterials:](v3, "setKrMaterials:", -[NSMutableArray mutableCopy](self->_krMaterials, "mutableCopy"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF60);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableDictionary count](self->_allMaterials, "count");
    v6 = -[NSMutableDictionary count](self->_pendingMaterials, "count");
    v7 = -[NSMutableArray count](self->_krMaterials, "count");
    allMaterials = self->_allMaterials;
    pendingMaterials = self->_pendingMaterials;
    v11[0] = 68290563;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2081;
    v15 = "inertCopy";
    v16 = 1026;
    v17 = v5;
    v18 = 1026;
    v19 = v6;
    v20 = 1026;
    v21 = v7;
    v22 = 2113;
    v23 = allMaterials;
    v24 = 2113;
    v25 = pendingMaterials;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection materials\", \"caller\":%{private, location:escape_only}s, \"all\":%{public}d, \"pending\":%{public}d, \"krMaterials\":%{public}d, \"allMaterials\":%{private, location:escape_only}@, \"pendingMaterials\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x42u);
  }
  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)connectionAttemptCount
{
  return self->_connectionAttemptCount;
}

- (void)setConnectionAttemptCount:(unint64_t)a3
{
  self->_connectionAttemptCount = a3;
}

- (NSMutableArray)krMaterials
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKrMaterials:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)allMaterials
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllMaterials:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)pendingMaterials
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingMaterials:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
