@implementation ASPCarryLogStateMachine

- (ASPCarryLogStateMachine)initWithStateManager:(id)a3 TaskingManager:(id)a4 NANDDriver:(id)a5 UploadDriver:(id)a6 WorkDirectory:(id)a7
{
  id v13;
  id v14;
  id v15;
  ASPCarryLogStateMachine *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *currentTaskingInfo;
  NSMutableArray *v21;
  NSMutableArray *taskingIdHistory;
  NSString *DATaskingID;
  uint64_t v24;
  NSObject *v25;
  ASPCarryLogStateMachine *v26;
  id v28;
  id v29;
  id v30;
  uint8_t buf[16];
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v30 = a6;
  v29 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ASPCarryLogStateMachine;
  v16 = -[ASPCarryLogStateMachine init](&v32, "init");
  if (!v16)
    goto LABEL_20;
  v28 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getValueForKey:expectedType:", CFSTR("tasking_id_history"), 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getValueForKey:expectedType:", CFSTR("current_tasking_info"), 2));
  v16->_isInternal = checkInternalBuild(v13);
  objc_storeStrong((id *)&v16->_stateMgr, a3);
  if ((validateCurTaskingInfo(v18) & 1) == 0)
  {

    objc_msgSend(v13, "deleteKey:", CFSTR("current_tasking_info"));
    v18 = 0;
  }
  *(_WORD *)&v16->_isLegacyUI_IOLogEnabled = 0;
  -[ASPCarryLogStateMachine _checkLegacyUI](v16, "_checkLegacyUI");
  if (v18)
    v19 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:copyItems:", v18, 1);
  else
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentTaskingInfo = v16->_currentTaskingInfo;
  v16->_currentTaskingInfo = v19;

  if (v17)
    v21 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v17, 1);
  else
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  taskingIdHistory = v16->_taskingIdHistory;
  v16->_taskingIdHistory = v21;

  objc_storeStrong((id *)&v16->_DATaskingMgr, a4);
  if (v16->_isLegacyUI_TaskingDisabled)
  {
    v16->_taskingDuration = -1;
    v16->_taskingSizeLimit = -1;
  }
  else
  {
    if (-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](v16, "isLegacyUI_IOLogEnabled"))
    {
      *(_OWORD *)&v16->_taskingDuration = xmmword_100084FC0;
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)CFSTR("TASKING_LEGACY_INT_IOS");
      goto LABEL_17;
    }
    v16->_taskingDuration = (int64_t)objc_msgSend(v14, "getTaskingDurationInSeconds");
    v16->_taskingSizeLimit = (int64_t)objc_msgSend(v14, "getTaskingSizeLimitInBytes");
    if ((v16->_taskingDuration & 0x8000000000000000) == 0)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getTaskingID"));
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)v24;
      goto LABEL_17;
    }
  }
  DATaskingID = v16->_DATaskingID;
  v16->_DATaskingID = 0;
LABEL_17:

  objc_storeStrong((id *)&v16->_nandDriver, a5);
  objc_storeStrong((id *)&v16->_uploadDriver, a6);
  objc_storeStrong((id *)&v16->_workDir, a7);
  v25 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ASPCarryLog state machine initialized", buf, 2u);
  }
  v26 = v16;

  v15 = v28;
LABEL_20:

  return v16;
}

- (BOOL)isInternalBuild
{
  return -[ASPCarryLogStateMachine isInternal](self, "isInternal");
}

- (void)_checkLegacyUI
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;

  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:inDomain:expectedType:", CFSTR("enable_iolog_collection"), CFSTR("/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"), 1));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getValueForKey:inDomain:expectedType:", CFSTR("enable_iolog_tasking"), CFSTR("/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"), 1));

    if (v8)
      v6 = objc_msgSend(v8, "intValue") == 1;
    else
      v6 = 0;
    -[ASPCarryLogStateMachine setIsLegacyUI_IOLogEnabled:](self, "setIsLegacyUI_IOLogEnabled:", v6);
    if (v5)
      v7 = objc_msgSend(v5, "intValue") != 1;
    else
      v7 = 0;
    -[ASPCarryLogStateMachine setIsLegacyUI_TaskingDisabled:](self, "setIsLegacyUI_TaskingDisabled:", v7);

  }
  else
  {
    -[ASPCarryLogStateMachine setIsLegacyUI_IOLogEnabled:](self, "setIsLegacyUI_IOLogEnabled:", 0);
    -[ASPCarryLogStateMachine setIsLegacyUI_TaskingDisabled:](self, "setIsLegacyUI_TaskingDisabled:", 0);
  }
}

- (id)_genUniqueDeviceId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  unsigned __int8 md[20];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@"), v4, v5, v6, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 40));
  v11 = objc_retainAutorelease(v9);
  CC_SHA1(objc_msgSend(v11, "UTF8String"), (CC_LONG)objc_msgSend(v11, "length"), md);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v10, "appendFormat:", CFSTR("%02x"), md[i]);
  v13 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID")));
    *(_DWORD *)buf = 136315394;
    v18 = objc_msgSend(v15, "UTF8String");
    v19 = 2080;
    v20 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TaskingId: %s, Generated unique deviceId: %s", buf, 0x16u);

  }
  return v10;
}

- (id)_getDeviceId
{
  id DeviceSerialNumber;
  void *v4;

  if (!-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild")
    || (DeviceSerialNumber = getDeviceSerialNumber(),
        (v4 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber)) == 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine _genUniqueDeviceId](self, "_genUniqueDeviceId"));
  }
  return v4;
}

- (BOOL)_hasActiveTasking
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dsreply_pending")));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("no"));

  return v4;
}

- (BOOL)_hasPendingDSReplyTasking
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dsreply_pending")));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("yes"));

  return v4;
}

- (void)_markDATaskingDSReply_Pending
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("id"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[ASPCarryLogStateMachine taskingSizeLimit](self, "taskingSizeLimit")));
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("upload_size_limit_bytes"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("yes"), CFSTR("dsreply_pending"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine _getDeviceId](self, "_getDeviceId"));
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("device_id"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("current_tasking_info"));

}

- (void)_markTaskingActive
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-[ASPCarryLogStateMachine taskingDuration](self, "taskingDuration")));
  v4 = DateTimeToStr(v3);
  v20 = (id)objc_claimAutoreleasedReturnValue(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id")));

  v7 = uploadInfoKeyFromTaskingId((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v9, "setValue:forKey:", v20, CFSTR("endtime"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v10, "setValue:forKey:", CFSTR("no"), CFSTR("dsreply_pending"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[ASPCarryLogStateMachine taskingSizeLimit](self, "taskingSizeLimit")));
  objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("upload_size_limit_bytes"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  objc_msgSend(v13, "setValue:forKey:", &off_1000BCD68, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("current_tasking_info"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v17 = currentDateTimeStr();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("last_extract_time"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  setTaskingInfoToLegacyUIDomain(v19, v6, v20, 0, CFSTR("None"), -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));

}

- (void)_unmarkCurrentTasking
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));
  v5 = uploadInfoKeyFromTaskingId((uint64_t)v4);
  v10 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  objc_msgSend(v6, "deleteKey:", v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  objc_msgSend(v7, "deleteKey:", CFSTR("current_tasking_info"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  objc_msgSend(v8, "deleteKey:", CFSTR("last_extract_time"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  objc_msgSend(v9, "removeAllObjects");

}

- (BOOL)_activeTaskingExpired
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  uint64_t v22;

  if (!-[ASPCarryLogStateMachine isLegacyUI_TaskingDisabled](self, "isLegacyUI_TaskingDisabled")
    && !-[ASPCarryLogStateMachine _activeLegacyTaskingDisabled](self, "_activeLegacyTaskingDisabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endtime")));
    v7 = StringToDateTime(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("upload_size_limit_bytes")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("id")));
    v13 = uploadInfoKeyFromTaskingId((uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getValueForKey:expectedType:", v14, 2));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("total_upload_size")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("enough_disk_space")));
    if (!v8 || objc_msgSend(v4, "compare:", v8) != (id)-1)
      goto LABEL_6;
    v20 = objc_opt_class(NSNumber);
    LOBYTE(v3) = 1;
    if ((objc_opt_isKindOfClass(v17, v20) & 1) == 0 || !v10)
      goto LABEL_7;
    v21 = objc_msgSend(v17, "longLongValue");
    if ((uint64_t)v21 < (uint64_t)objc_msgSend(v10, "longLongValue")
      && (v22 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v18, v22) & 1) != 0)
      && objc_msgSend(v18, "BOOLValue"))
    {
      v3 = !-[ASPCarryLogStateMachine _curTaskingisActiveOnServer](self, "_curTaskingisActiveOnServer");
    }
    else
    {
LABEL_6:
      LOBYTE(v3) = 1;
    }
LABEL_7:

    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_curTaskingisActiveOnServer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device_id")));

  v8 = 0;
  if (v4 && v6)
  {
    if (os_variant_has_internal_content("com.apple.ASPCarryLog", v7))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getValueForKey:expectedType:", CFSTR("test_force_ds_reply_tasking_continue"), 0));

      if (v10
        && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BCD90, "objectForKey:", v10)),
            v11,
            v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BCD90, "objectForKeyedSubscript:", v10));
        v13 = objc_msgSend(v12, "unsignedIntValue");

        if (v13 != 3)
          goto LABEL_10;
      }
      else
      {

      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine uploadDriver](self, "uploadDriver"));
    v13 = objc_msgSend(v14, "allowToContinueTaskingId:DeviceId:", v4, v6);

LABEL_10:
    v8 = v13 != 0;
  }

  return v8;
}

- (BOOL)_activeLegacyTaskingDisabled
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id")));

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("TASKING_LEGACY_INT_IOS")))
      v5 = !-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](self, "isLegacyUI_IOLogEnabled");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_DATaskingNotInHist
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  v7 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG))
    sub_10004216C(v3 == 0, v6, v7);
  return v6;
}

- (BOOL)_isAfterTaskingInspectionCoolDown
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getValueForKey:expectedType:", CFSTR("next_tasking_inspection_time"), 0));

  if (v3)
  {
    v4 = StringToDateTime(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = objc_msgSend(v5, "compare:", v6) == (id)-1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_setNextTaskingInspectionMinTime
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v4 = DateTimeToStr(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("next_tasking_inspection_time"));

}

- (BOOL)_canInspectNewDATasking
{
  _BOOL4 v3;

  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
    goto LABEL_4;
  v3 = -[ASPCarryLogStateMachine _isAfterTaskingInspectionCoolDown](self, "_isAfterTaskingInspectionCoolDown");
  if (v3)
  {
    -[ASPCarryLogStateMachine _setNextTaskingInspectionMinTime](self, "_setNextTaskingInspectionMinTime");
LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_passDATaskingCriteria:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  if (-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](self, "isLegacyUI_IOLogEnabled"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
      v5 = objc_msgSend(v7, "evaluateTaskingCriteria:doWhiteListCheck:", v4, -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild") ^ 1);

    }
    else
    {
      v5 = 0;
    }

  }
  v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v9 = "PASS";
    else
      v9 = "FAIL";
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getTaskingID")));
    v14 = 136315394;
    v15 = v9;
    v16 = 2080;
    v17 = objc_msgSend(v12, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s criteria for tasking id %s", (uint8_t *)&v14, 0x16u);

  }
  return v5;
}

- (void)_addDATaskingToHist
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (!-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](self, "isLegacyUI_IOLogEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    objc_msgSend(v3, "addObject:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    v6 = objc_msgSend(v5, "count");

    if ((unint64_t)v6 >= 0xD)
    {
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
        objc_msgSend(v7, "removeObjectAtIndex:", 0);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
        v9 = objc_msgSend(v8, "count");

      }
      while ((unint64_t)v9 > 0xC);
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("tasking_id_history"));

  }
}

- (BOOL)_canJoinTaskingPerStatsDriver:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v12;
  id v13;

  v4 = a3;
  v5 = -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild") || !diskFreeSpaceBelowLimit(0x80000000uLL);
  if (!-[ASPCarryLogStateMachine _DATaskingNotInHist](self, "_DATaskingNotInHist"))
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  if (-[ASPCarryLogStateMachine _canInspectNewDATasking](self, "_canInspectNewDATasking"))
  {
    if (!v5)
      goto LABEL_13;
    if (-[ASPCarryLogStateMachine _passDATaskingCriteria:](self, "_passDATaskingCriteria:", v4))
    {
      -[ASPCarryLogStateMachine _markDATaskingDSReply_Pending](self, "_markDATaskingDSReply_Pending");
      LOBYTE(v5) = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = oslog;
    LOBYTE(v5) = 0;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DA tasking inspection at cool down", (uint8_t *)&v12, 2u);
  }
  LOBYTE(v5) = 0;
LABEL_13:
  -[ASPCarryLogStateMachine _addDATaskingToHist](self, "_addDATaskingToHist");
  v7 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID")));
    v10 = objc_msgSend(v9, "UTF8String");
    v12 = 136315138;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TaskingId %s added to history.\n", (uint8_t *)&v12, 0xCu);

  }
LABEL_15:

  return v5;
}

- (void)_tryActivateTasking
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"))));
  v5 = objc_msgSend(v4, "UTF8String");

  if (!os_variant_has_internal_content("com.apple.ASPCarryLog", v6))
    goto LABEL_7;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getValueForKey:expectedType:", CFSTR("test_force_ds_reply"), 0));

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BCDB8, "objectForKey:", v8)),
        v9,
        !v9))
  {

    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BCDB8, "objectForKeyedSubscript:", v8));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 == 3)
  {
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine uploadDriver](self, "uploadDriver"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("device_id")));
    v11 = objc_msgSend(v12, "allowToParticipateTaskingId:DeviceId:", v14, v16);

  }
  if (v11)
  {
    if (v11 == 2)
    {
      v19 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315138;
        v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DA taskingId %s pending decision server reply", (uint8_t *)&v21, 0xCu);
      }
    }
    else if (v11 == 1)
    {
      v17 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315138;
        v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DA taskingId %s permitted by decision server", (uint8_t *)&v21, 0xCu);
      }
      -[ASPCarryLogStateMachine registerIOLoggingXPCforInternalBuild:](self, "registerIOLoggingXPCforInternalBuild:", -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));
      -[ASPCarryLogStateMachine _markTaskingActive](self, "_markTaskingActive");
    }
    else
    {
      v20 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_100042210((uint64_t)v5, v11, v20);
    }
  }
  else
  {
    v18 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DA taskingId %s denied by decision server", (uint8_t *)&v21, 0xCu);
    }
    -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
  }
}

- (void)_cleanUpAfterTasking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("iolog.iolog")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
  objc_msgSend(v4, "iolog_disable");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
  objc_msgSend(v5, "iolog_export:max_export_size:", v7, 0);

  -[ASPCarryLogStateMachine _cleanUpWorkDir](self, "_cleanUpWorkDir");
  -[ASPCarryLogStateMachine _deleteUploadInfo](self, "_deleteUploadInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  objc_msgSend(v6, "deleteKey:", CFSTR("extractupload_pendingfile"));

}

- (void)_cleanUpWorkDir
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  ASPCarryLogStateMachine *v19;
  void *v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("tar_in_process")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v5, "fileExistsAtPath:", v4))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v34;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v11)));

          objc_msgSend(v5, "removeItemAtPath:error:", v9, 0);
          v11 = (char *)v11 + 1;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  v14 = objc_msgSend(v5, "fileExistsAtPath:", v13);

  if (v14)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v15, 0));

    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = self;
      v27 = v4;
      v20 = 0;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          v23 = v9;
          v24 = v20;
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](v19, "workDir", v27));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", v25));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("tar_in_process")) & 1) == 0
            && (objc_msgSend(v20, "isEqualToString:", CFSTR("dp_tasking_payload.plist")) & 1) == 0)
          {
            objc_msgSend(v5, "removeItemAtPath:error:", v9, 0);
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v18);

      v4 = v27;
    }

  }
}

- (void)_deleteUploadInfo
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAllKeys"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0
          && objc_msgSend(v10, "hasPrefix:", CFSTR("aspcarry_uploadinfo"), (_QWORD)v13))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
          objc_msgSend(v12, "deleteKey:", v10);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_resetDaemonUserDefaults
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[ASPCarryLogStateMachine _deleteUploadInfo](self, "_deleteUploadInfo");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&off_1000BCED0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(&off_1000BCED0);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getValueForKey:expectedType:", v7, 4));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
          objc_msgSend(v10, "deleteKey:", v7);

        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&off_1000BCED0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
}

- (BOOL)_checkSnBuildVariantMatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id DeviceSerialNumber;
  void *v9;
  uint64_t v10;
  int has_internal_content;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v23[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:expectedType:", CFSTR("device_serialnumber"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getValueForKey:expectedType:", CFSTR("device_is_internal_build"), 0));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("yes"));

  DeviceSerialNumber = getDeviceSerialNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber);
  has_internal_content = os_variant_has_internal_content("com.apple.ASPCarryLog", v10);
  if (v4 && (!objc_msgSend(v9, "isEqualToString:", v4) || v7 != has_internal_content))
  {
    v13 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SN and/or build variant mismatch. Reseting defaults", v23, 2u);
    }
    -[ASPCarryLogStateMachine _resetDaemonUserDefaults](self, "_resetDaemonUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v15 = v14;
    if (has_internal_content)
      objc_msgSend(v14, "setValue:forKey:inDomain:", CFSTR("No active tasking and no iolog collection ongoing"), CFSTR("aspcarrylog_tasking_info"), CFSTR("/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"));

    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getValueForKey:expectedType:", CFSTR("device_serialnumber"), 0));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    objc_msgSend(v18, "setValue:forKey:", v9, CFSTR("device_serialnumber"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getValueForKey:expectedType:", CFSTR("device_is_internal_build"), 0));
  if (v20)
    has_internal_content = 0;

  if (has_internal_content == 1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    objc_msgSend(v21, "setValue:forKey:", CFSTR("yes"), CFSTR("device_is_internal_build"));

  }
  return v12;
}

- (void)dailyCheckWithStatsProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  unsigned int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getValueForKey:expectedType:", CFSTR("daily_check_tasking_status"), 0));

  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("inactive");
  if (!-[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
  {
    if (-[ASPCarryLogStateMachine _hasPendingDSReplyTasking](self, "_hasPendingDSReplyTasking"))
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = -[ASPCarryLogStateMachine _activeTaskingExpired](self, "_activeTaskingExpired");
  v9 = (void *)oslog;
  v10 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id"))));
      v20 = 136315138;
      v21 = objc_msgSend(v13, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TaskingId %s Ending.\n", (uint8_t *)&v20, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
    objc_msgSend(v14, "iolog_disable");

    -[ASPCarryLogStateMachine unregisterIOLoggingXPC](self, "unregisterIOLoggingXPC");
    -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
LABEL_10:
    if (!-[ASPCarryLogStateMachine _canJoinTaskingPerStatsDriver:](self, "_canJoinTaskingPerStatsDriver:", v4))
    {
LABEL_12:
      if (-[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
      {
        v15 = CFSTR("active");
      }
      else
      {
        -[ASPCarryLogStateMachine unregisterIOLoggingXPC](self, "unregisterIOLoggingXPC");
        if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("active")) & 1) != 0)
        {
          v15 = CFSTR("just_ended");
        }
        else
        {
          if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("just_ended")))
            -[ASPCarryLogStateMachine _cleanUpAfterTasking](self, "_cleanUpAfterTasking");
          v15 = CFSTR("inactive");
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
        if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
          objc_msgSend(v19, "setValue:forKey:inDomain:", CFSTR("No active tasking and no iolog collection ongoing"), CFSTR("aspcarrylog_tasking_info"), CFSTR("/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"));

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      objc_msgSend(v17, "setValue:forKey:", v15, CFSTR("daily_check_tasking_status"));
      goto LABEL_25;
    }
LABEL_11:
    -[ASPCarryLogStateMachine _tryActivateTasking](self, "_tryActivateTasking");
    goto LABEL_12;
  }
  if (v10)
  {
    v16 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("id"))));
    v20 = 136315138;
    v21 = objc_msgSend(v18, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "TaskingId %s continue.\n", (uint8_t *)&v20, 0xCu);

LABEL_25:
  }

}

- (void)bootCheck
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  id v22;

  if (-[ASPCarryLogStateMachine _checkSnBuildVariantMatch](self, "_checkSnBuildVariantMatch")
    && -[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
  {
    if (-[ASPCarryLogStateMachine _activeTaskingExpired](self, "_activeTaskingExpired"))
    {
      v3 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"))));
        v21 = 136315138;
        v22 = objc_msgSend(v6, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TaskingId %s Ending.\n", (uint8_t *)&v21, 0xCu);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
      objc_msgSend(v7, "iolog_disable");

      -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
        objc_msgSend(v8, "setValue:forKey:inDomain:", CFSTR("No active tasking and no iolog collection ongoing"), CFSTR("aspcarrylog_tasking_info"), CFSTR("/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      v12 = uploadInfoKeyFromTaskingId((uint64_t)v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getValueForKey:expectedType:", v13, 2));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("spd_state")));

        if (!v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
          objc_msgSend(v16, "iolog_enable");

        }
      }
      -[ASPCarryLogStateMachine registerIOLoggingXPCforInternalBuild:](self, "registerIOLoggingXPCforInternalBuild:", -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));
      v17 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("id"))));
        v21 = 136315138;
        v22 = objc_msgSend(v20, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "TaskingId %s running.\n", (uint8_t *)&v21, 0xCu);

      }
    }

  }
  else
  {
    v9 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No active tasking at boot", (uint8_t *)&v21, 2u);
    }
  }
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
  objc_storeStrong((id *)&self->_workDir, a3);
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
  objc_storeStrong((id *)&self->_stateMgr, a3);
}

- (NSMutableDictionary)currentTaskingInfo
{
  return self->_currentTaskingInfo;
}

- (void)setCurrentTaskingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentTaskingInfo, a3);
}

- (NSMutableArray)taskingIdHistory
{
  return self->_taskingIdHistory;
}

- (void)setTaskingIdHistory:(id)a3
{
  objc_storeStrong((id *)&self->_taskingIdHistory, a3);
}

- (TaskingManager)DATaskingMgr
{
  return self->_DATaskingMgr;
}

- (void)setDATaskingMgr:(id)a3
{
  objc_storeStrong((id *)&self->_DATaskingMgr, a3);
}

- (NSString)DATaskingID
{
  return self->_DATaskingID;
}

- (void)setDATaskingID:(id)a3
{
  objc_storeStrong((id *)&self->_DATaskingID, a3);
}

- (int64_t)taskingDuration
{
  return self->_taskingDuration;
}

- (void)setTaskingDuration:(int64_t)a3
{
  self->_taskingDuration = a3;
}

- (int64_t)taskingSizeLimit
{
  return self->_taskingSizeLimit;
}

- (void)setTaskingSizeLimit:(int64_t)a3
{
  self->_taskingSizeLimit = a3;
}

- (BOOL)isLegacyUI_IOLogEnabled
{
  return self->_isLegacyUI_IOLogEnabled;
}

- (void)setIsLegacyUI_IOLogEnabled:(BOOL)a3
{
  self->_isLegacyUI_IOLogEnabled = a3;
}

- (BOOL)isLegacyUI_TaskingDisabled
{
  return self->_isLegacyUI_TaskingDisabled;
}

- (void)setIsLegacyUI_TaskingDisabled:(BOOL)a3
{
  self->_isLegacyUI_TaskingDisabled = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
  objc_storeStrong((id *)&self->_nandDriver, a3);
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
  objc_storeStrong((id *)&self->_uploadDriver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadDriver, 0);
  objc_storeStrong((id *)&self->_nandDriver, 0);
  objc_storeStrong((id *)&self->_DATaskingID, 0);
  objc_storeStrong((id *)&self->_DATaskingMgr, 0);
  objc_storeStrong((id *)&self->_taskingIdHistory, 0);
  objc_storeStrong((id *)&self->_currentTaskingInfo, 0);
  objc_storeStrong((id *)&self->_stateMgr, 0);
  objc_storeStrong((id *)&self->_workDir, 0);
}

@end
