@implementation CLDurianScanCache

- (CLDurianScanCache)init
{
  CLDurianScanCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLDurianScanCache;
  v2 = -[CLDurianScanCache init](&v4, "init");
  if (v2)
    v2->_scanCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianScanCache;
  -[CLDurianScanCache dealloc](&v3, "dealloc");
}

- (void)clearData
{
  -[NSMutableDictionary removeAllObjects](self->_scanCache, "removeAllObjects");
}

- (void)addScanResultAtDate:(id)a3 address:(id)a4 maintenanceReason:(int64_t)a5 reconciledUUID:(id)a6
{
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  id v15;
  id v16;
  __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  _QWORD v23[3];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  __CFString *v35;

  v11 = -[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:", a4);
  v12 = &qword_1022A0000;
  v13 = &qword_1022A0000;
  if (v11)
  {
    v14 = v11;
    v15 = objc_msgSend(v11, "objectForKey:", CFSTR("kCLScanResultDataKey"));
    v16 = objc_msgSend(v14, "objectForKey:", CFSTR("kCLScanResultNeedsMaintenanceKey"));
    if (objc_msgSend(a3, "compare:", v15) == (id)-1)
      v17 = CFSTR("dropolder");
    else
      v17 = CFSTR("overwrite");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCBD0);
    v18 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290307;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = objc_msgSend(objc_msgSend(a6, "description"), "substringToIndex:", 8);
      v13 = &qword_1022A0000;
      v30 = 2113;
      v31 = sub_10024882C(a4);
      v32 = 2114;
      *(_QWORD *)v33 = v15;
      *(_WORD *)&v33[8] = 1026;
      *(_DWORD *)&v33[10] = objc_msgSend(v16, "integerValue");
      v34 = 2114;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache existing\", \"item\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"reason\":%{public}d, \"action\":%{public, location:escape_only}@}", buf, 0x40u);
    }
    v12 = &qword_1022A0000;
  }
  else
  {
    v17 = CFSTR("addnew");
  }
  if ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("dropolder")) & 1) == 0)
  {
    v23[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5, CFSTR("kCLScanResultDataKey"), CFSTR("kCLScanResultAddressKey"), CFSTR("kCLScanResultNeedsMaintenanceKey"), a3, a4);
    -[NSMutableDictionary setObject:forKey:](self->_scanCache, "setObject:forKey:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, &v22, 3)), a6);
  }
  if (v12[6] != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCBD0);
  v19 = v13[7];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(objc_msgSend(a6, "description"), "substringToIndex:", 8);
    v21 = (__CFString *)-[NSMutableDictionary count](self->_scanCache, "count");
    *(_DWORD *)buf = 68290307;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2113;
    v29 = v20;
    v30 = 2114;
    v31 = a3;
    v32 = 1026;
    *(_DWORD *)v33 = a5;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v17;
    v34 = 2050;
    v35 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache entry\", \"item\":%{private, location:escape_only}@, \"date\":%{public, location:escape_only}@, \"reason\":%{public}d, \"action\":%{public, location:escape_only}@, \"size\":%{public}lu}", buf, 0x40u);
  }
}

- (int64_t)getMaintenanceReasonForUuid:(id)a3
{
  id v5;
  id v6;
  int64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;

  v5 = -[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:");
  v6 = v5;
  if (v5)
    v7 = (int64_t)objc_msgSend(objc_msgSend(v5, "objectForKey:", CFSTR("kCLScanResultNeedsMaintenanceKey")), "integerValue");
  else
    v7 = -1;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCBD0);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v10 = -[NSMutableDictionary count](self->_scanCache, "count");
    v12[0] = 68290051;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v9;
    v17 = 1026;
    v18 = v7;
    v19 = 1026;
    v20 = v6 != 0;
    v21 = 2050;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache maintreason\", \"item\":%{private, location:escape_only}@, \"reason\":%{public}d, \"entry\":%{public}hhd, \"size\":%{public}lu}", (uint8_t *)v12, 0x32u);
  }
  return v7;
}

- (id)getAddressForUuid:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;

  v5 = -[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:");
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "objectForKey:", CFSTR("kCLScanResultAddressKey"));
  else
    v7 = 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCBD0);
  v8 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(objc_msgSend(a3, "description"), "substringToIndex:", 8);
    v10 = -[NSMutableDictionary count](self->_scanCache, "count");
    v12[0] = 68290051;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v9;
    v17 = 2114;
    v18 = v7;
    v19 = 1026;
    v20 = v6 != 0;
    v21 = 2050;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache address\", \"item\":%{private, location:escape_only}@, \"addr\":%{public, location:escape_only}@, \"entry\":%{public}hhd, \"size\":%{public}lu}", (uint8_t *)v12, 0x36u);
  }
  return v7;
}

- (int)secondsFromLastQuarterHour
{
  NSDateComponents *v2;
  int v3;

  v2 = -[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 192, +[NSDate date](NSDate, "date"));
  v3 = (int)-[NSDateComponents minute](v2, "minute") % 15;
  return -[NSDateComponents second](v2, "second") + 60 * v3;
}

- (void)pruneAggregatedResults
{
  id v3;
  int v4;
  int v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  double v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];

  v15 = -[NSMutableDictionary count](self->_scanCache, "count");
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[CLDurianScanCache secondsFromLastQuarterHour](self, "secondsFromLastQuarterHour");
  v5 = v4 - 5;
  if (v4 <= 5)
    v5 = v4;
  v16 = v5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = -[NSMutableDictionary allKeys](self->_scanCache, "allKeys");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        -[NSDate timeIntervalSinceDate:](+[NSDate now](NSDate, "now"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_scanCache, "objectForKey:", v11), "objectForKey:", CFSTR("kCLScanResultDataKey")));
        if (fabs(v12) > (double)v16)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v8);
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_scanCache, "removeObjectsForKeys:", v3);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCBD0);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[NSMutableDictionary count](self->_scanCache, "count");
    *(_DWORD *)buf = 68289794;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 1026;
    v26 = v16;
    v27 = 2050;
    v28 = v15;
    v29 = 2050;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint scancache prune\", \"delta\":%{public}d, \"pre\":%{public}lu, \"post\":%{public}lu}", buf, 0x2Cu);
  }
}

- (NSMutableDictionary)scanCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScanCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
