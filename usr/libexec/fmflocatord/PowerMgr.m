@implementation PowerMgr

+ (id)sharedInstance
{
  if (qword_1000695C8 != -1)
    dispatch_once(&qword_1000695C8, &stru_100055670);
  return (id)qword_1000695C0;
}

- (void)powerAssertionEnableWithReason:(id)a3
{
  -[PowerMgr powerAssertionEnableWithReason:timeout:](self, "powerAssertionEnableWithReason:timeout:", a3, 90);
}

- (void)powerAssertionEnableWithReason:(id)a3 timeout:(int64_t)a4
{
  -[PowerMgr powerAssertionEnableWithReason:type:timeout:](self, "powerAssertionEnableWithReason:type:timeout:", a3, CFSTR("PreventUserIdleSystemSleep"), a4);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4
{
  -[PowerMgr powerAssertionEnableWithReason:type:timeout:](self, "powerAssertionEnableWithReason:type:timeout:", a3, a4, 90);
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5
{
  id v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  IOReturn v25;
  id v26;
  NSObject *v27;
  const char *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *context;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int64_t v41;

  v8 = a3;
  v9 = (char *)a4;
  context = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
  if (!objc_msgSend(v13, "count"))
  {

    v15 = 0;
    goto LABEL_7;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));

  if (!v15)
  {
LABEL_7:
    v19 = 0;
    v16 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  v16 = (uint64_t)objc_msgSend(v15, "intValue");
  v17 = sub_10001C4E8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_100033FE4();

  v19 = 1;
LABEL_8:
  v20 = sub_10001C4E8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v37 = v12;
    v38 = 2112;
    v39 = v9;
    v40 = 2048;
    v41 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Enable power assertion %@ with type %@ & timeout %ld", buf, 0x20u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ApplePushServiceTask")) & 1) != 0)
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("AssertName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("TimeoutSeconds"));

    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("TimeoutActionTurnOff"), CFSTR("TimeoutAction"));
    if (v9)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, CFSTR("AssertType"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10005AEF0, CFSTR("AssertLevel"));
  }
  else
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("AssertName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("TimeoutSeconds"));

    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("TimeoutActionTurnOff"), CFSTR("TimeoutAction"));
    if (v9)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, CFSTR("AssertType"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10005AEF0, CFSTR("AssertLevel"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", kCFBooleanTrue, CFSTR("AppliesToLimitedPower"));
  }
  AssertionID = 0;
  v25 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v22, &AssertionID);
  if (v25)
  {
    v26 = sub_10001C4E8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = SCErrorString(v25);
      *(_DWORD *)buf = 138412802;
      v37 = v22;
      v38 = 2080;
      v39 = v28;
      v40 = 1024;
      LODWORD(v41) = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithProperties %@ failed with error: %s (%d)", buf, 0x1Cu);
    }
  }
  else
  {
    v29 = sub_10001C4E8();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      sub_100033F70((uint64_t)v12, &AssertionID, v30);

    if (v19)
    {
      v31 = sub_10001C4E8();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        sub_100033F10();

      -[PowerMgr _disableAssertion:withName:](self, "_disableAssertion:withName:", v16, v12);
    }
    v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", AssertionID));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, v12);

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
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

    if (v10)
    {
      -[PowerMgr _disableAssertion:withName:](self, "_disableAssertion:withName:", objc_msgSend(v10, "intValue"), v7);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v11 = sub_10001C4E8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Did not find any existing assertion with name %@ when trying to disable it", buf, 0xCu);
  }

  v10 = 0;
LABEL_8:

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PowerMgr assertionsDict](self, "assertionsDict"));
  objc_msgSend(v7, "removeObjectForKey:", v6);

  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000340A4();

    v11 = IOPMAssertionRelease(a3);
    v12 = sub_10001C4E8();
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
      sub_100034044();
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

- (FMConcurrentMutableDictionary)assertionsDict
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
