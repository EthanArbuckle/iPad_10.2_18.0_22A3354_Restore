@implementation FMDPowerMgr

+ (id)sharedInstance
{
  if (qword_100306888 != -1)
    dispatch_once(&qword_100306888, &stru_1002C4978);
  return (id)qword_100306880;
}

- (FMDPowerMgr)init
{
  FMDPowerMgr *v2;
  FMDConcurrentMutableDictionary *v3;
  FMDConcurrentMutableDictionary *assertionsDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDPowerMgr;
  v2 = -[FMDPowerMgr init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(FMDConcurrentMutableDictionary);
    assertionsDict = v2->_assertionsDict;
    v2->_assertionsDict = v3;

  }
  return v2;
}

- (void)powerAssertionEnableWithReason:(id)a3
{
  -[FMDPowerMgr powerAssertionEnableWithReason:timeout:](self, "powerAssertionEnableWithReason:timeout:", a3, 90);
}

- (void)powerAssertionEnableWithReason:(id)a3 timeout:(int64_t)a4
{
  -[FMDPowerMgr powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:](self, "powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:", a3, CFSTR("PreventUserIdleSystemSleep"), a4, 0);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4
{
  -[FMDPowerMgr powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:](self, "powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:", a3, a4, 90, 0);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 appliesOnLidClose:(BOOL)a5
{
  -[FMDPowerMgr powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:](self, "powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:", a3, a4, 90, a5);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5
{
  -[FMDPowerMgr powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:](self, "powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:", a3, a4, a5, 0);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5 appliesOnLidClose:(BOOL)a6
{
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  IOReturn v22;
  id v23;
  NSObject *v24;
  const char *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *context;
  id v32;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int64_t v39;

  v32 = a3;
  v9 = (char *)a4;
  context = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, v32));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPowerMgr assertionsDict](self, "assertionsDict"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

  if (v14)
  {
    v15 = (uint64_t)objc_msgSend(v14, "intValue");
    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10022C054();

  }
  else
  {
    v15 = 0xFFFFFFFFLL;
  }
  v18 = sub_1000031B8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v12;
    v36 = 2112;
    v37 = v9;
    v38 = 2048;
    v39 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Enable power assertion %@ with type %@ & timeout %ld", buf, 0x20u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, CFSTR("AssertName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("TimeoutSeconds"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("TimeoutActionTurnOff"), CFSTR("TimeoutAction"));
  if (v9)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("AssertType"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_1002D81B8, CFSTR("AssertLevel"));
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ApplePushServiceTask")) & 1) == 0)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", kCFBooleanTrue, CFSTR("AppliesToLimitedPower"));
  AssertionID = 0;
  v22 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v20, &AssertionID);
  if (v22)
  {
    v23 = sub_1000031B8();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = SCErrorString(v22);
      *(_DWORD *)buf = 138412802;
      v35 = v20;
      v36 = 2080;
      v37 = v25;
      v38 = 1024;
      LODWORD(v39) = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithProperties %@ failed with error: %s (%d)", buf, 0x1Cu);
    }
  }
  else
  {
    v26 = sub_1000031B8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      sub_10022BFE0((uint64_t)v12, &AssertionID, v27);

    if (v14)
    {
      v28 = sub_1000031B8();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        sub_10022BF80();

      -[FMDPowerMgr _disableAssertion:withName:](self, "_disableAssertion:withName:", v15, v12);
    }
    v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", AssertionID));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPowerMgr assertionsDict](self, "assertionsDict"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v12);

  }
  objc_autoreleasePoolPop(context);

}

- (void)powerAssertionDisableWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPowerMgr assertionsDict](self, "assertionsDict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    -[FMDPowerMgr _disableAssertion:withName:](self, "_disableAssertion:withName:", objc_msgSend(v9, "intValue"), v7);
  }
  else
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Did not find any existing assertion with name %@ when trying to disable it", buf, 0xCu);
    }

  }
}

- (void)_disableAssertion:(unsigned int)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  IOReturn v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  IOReturn v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPowerMgr assertionsDict](self, "assertionsDict"));
  objc_msgSend(v7, "removeObjectForKey:", v6);

  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10022C114();

    v11 = IOPMAssertionRelease(a3);
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v10 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138413058;
        v18 = v6;
        v19 = 1024;
        v20 = a3;
        v21 = 2080;
        v22 = SCErrorString(v11);
        v23 = 1024;
        v24 = v11;
        v14 = "IOPMAssertionRelease failed for assertion %@ with ID 0x%x: %s (%d)";
        v15 = v10;
        v16 = 34;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      sub_10022C0B4();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    v14 = "Found Null assertionID for assertion with name %@ when trying to disable it";
    v15 = v10;
    v16 = 12;
    goto LABEL_9;
  }

}

- (FMDConcurrentMutableDictionary)assertionsDict
{
  return self->_assertionsDict;
}

- (void)setAssertionsDict:(id)a3
{
  objc_storeStrong((id *)&self->_assertionsDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionsDict, 0);
}

@end
