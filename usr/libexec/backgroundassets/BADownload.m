@implementation BADownload

- (void)promoteToForeground
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("promoteToForeground is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v2, "raise");

}

- (void)demoteToBackground
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("demoteToBackground is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v2, "raise");

}

- (void)pauseDownload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("pauseDownload is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v2, "raise");

}

- (void)cancelDownload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("cancelDownload is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v2, "raise");

}

- (void)cancelDownloadSilently
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("cancelDownloadSilently is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v2, "raise");

}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("startDownloadWithDelegate:error: is not implemented on BADownload as it is abstract."), 0));
  objc_msgSend(v4, "raise");

  return 0;
}

- (void)setApplicationInformationForRestrictedDownload:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  -[BADownload setApplicationInfo:](self, "setApplicationInfo:", v4);

}

- (void)_addActivityWithIdentifier:(id)a3 takePowerAssertion:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  IOReturn v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  IOPMAssertionID AssertionID;

  v4 = a4;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock", a3));
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
  if (v4)
  {
    AssertionID = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
    v7 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, (CFStringRef)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Downloading - %@"), v6), &AssertionID);

    if (v7)
    {
      v8 = sub_1000128F4();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100035550(v9);

    }
    else
    {
      -[BADownload setPowerAssertionID:](self, "setPowerAssertionID:", AssertionID);
    }
  }
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier")));
  v11 = (void *)os_transaction_create(objc_msgSend(v10, "UTF8String"));
  -[BADownload setTransaction:](self, "setTransaction:", v11);

}

- (void)_removeActivityAndPowerAssertion
{
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  if (-[BADownload powerAssertionID](self, "powerAssertionID"))
  {
    IOPMAssertionRelease(-[BADownload powerAssertionID](self, "powerAssertionID"));
    -[BADownload setPowerAssertionID:](self, "setPowerAssertionID:", 0);
  }
  -[BADownload setTransaction:](self, "setTransaction:", 0);
}

+ (id)classesForSerialization
{
  if (qword_100065508 != -1)
    dispatch_once(&qword_100065508, &stru_100058B90);
  return (id)qword_100065500;
}

- (int64_t)compare:(id)a3
{
  id v4;
  BADownload *v5;
  id v6;
  id v7;
  int64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v12;

  v4 = a3;
  v5 = self;
  v6 = v4;
  if ((id)-[BADownload necessity](v5, "necessity") == (id)1 && !objc_msgSend(v6, "necessity"))
    goto LABEL_9;
  if (!-[BADownload necessity](v5, "necessity") && objc_msgSend(v6, "necessity") == (id)1
    || (v7 = -[BADownload priority](v5, "priority"), (uint64_t)v7 < (uint64_t)objc_msgSend(v6, "priority")))
  {
    v8 = -1;
    goto LABEL_10;
  }
  v9 = -[BADownload priority](v5, "priority");
  if ((uint64_t)v9 > (uint64_t)objc_msgSend(v6, "priority") || (v10 = sub_1000301EC(v5), v10 < sub_1000301EC(v6)))
  {
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  v12 = sub_1000301EC(v5);
  if (v12 <= sub_1000301EC(v6))
    v8 = 0;
  else
    v8 = -1;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BADownload)init
{
  BADownload *result;
  int v3;
  const char *v4;

  result = (BADownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BADownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BADownload)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BADownload *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  SEL v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  dispatch_queue_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  BADownload *v46;
  id v48;
  NSObject *v49;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BADownload;
  v6 = -[BADownload init](&v50, "init");
  if (!v6)
    goto LABEL_14;
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[BADownload setIdentifier:](v6, "setIdentifier:", v8);

  sub_10002FBB8(v6, (uint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalState")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("necessity")))
  {
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("necessity"));
    objc_opt_self(BADownload);
    if ((unint64_t)v9 >= 2)
      v10 = 0;
    else
      v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  -[BADownload setNecessity:](v6, "setNecessity:", v10);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v11), CFSTR("priority"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[BADownload setPriority:](v6, "setPriority:", objc_msgSend(v13, "integerValue"));
  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("uniqueIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[BADownload setUniqueIdentifier:](v6, "setUniqueIdentifier:", v16);

  v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v17), CFSTR("applicationGroupIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[BADownload setApplicationGroupIdentifier:](v6, "setApplicationGroupIdentifier:", v19);

  v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v20), CFSTR("stagedDownloadedFileURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_setProperty_atomic(v6, v23, v22, 80);

  sub_10002FC14(v6, (uint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientSpecifiedFileSize")));
  v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v24), CFSTR("applicationIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[BADownload setApplicationIdentifier:](v6, "setApplicationIdentifier:", v26);

  -[BADownload setPowerAssertionID:](v6, "setPowerAssertionID:", 0);
  v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError, v27), CFSTR("downloadFailureError"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  -[BADownload setDownloadError:](v6, "setDownloadError:", v29);

  v30 = dispatch_queue_create("com.apple.BackgroundAssets.BADownload+Agent.ResponseQueue", 0);
  -[BADownload setResponseQueue:](v6, "setResponseQueue:", v30);

  v6->_downloadLockOpaque._os_unfair_lock_opaque = 0;
  v32 = objc_opt_class(BAAgentKeyedUnarchiver, v31);
  if ((objc_opt_isKindOfClass(v4, v32) & 1) == 0)
  {
    -[BADownload setResumeData:](v6, "setResumeData:", 0);
    -[BADownload setDownloadCachePath:](v6, "setDownloadCachePath:", 0);
    -[BADownload setApplicationInfo:](v6, "setApplicationInfo:", 0);
LABEL_13:

LABEL_14:
    v46 = v6;
    goto LABEL_15;
  }
  v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v33), CFSTR("resumeData"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  -[BADownload setResumeData:](v6, "setResumeData:", v35);

  v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v36), CFSTR("downloadCachePath"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[BADownload setDownloadCachePath:](v6, "setDownloadCachePath:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](v6, "applicationIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](v6, "applicationIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_baassets_validUTI"));
  v42 = objc_msgSend(v39, "isEqualToString:", v41);

  if ((v42 & 1) != 0)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestrictedDownload")))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "agentCore"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](v6, "applicationIdentifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "applicationInfoForIdentifier:", v44));
      -[BADownload setApplicationInfo:](v6, "setApplicationInfo:", v45);

    }
    -[BADownload setPermitInitialCellularDownload:](v6, "setPermitInitialCellularDownload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("permitInitialCellularDownload")));
    goto LABEL_13;
  }
  v48 = sub_1000128F4();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    sub_100037BC4(v6, v49);

  v46 = 0;
LABEL_15:

  return v46;
}

- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  BADownload *v6;
  uint64_t v7;
  dispatch_queue_t v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BADownload *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BADownload;
  v6 = -[BADownload init](&v20, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Provided applicationGroupIdentifier must be a valid string."), 0));
      objc_msgSend(v18, "raise");

      v17 = 0;
      goto LABEL_6;
    }
    v8 = dispatch_queue_create("com.apple.BackgroundAssets.BADownload+Agent.ResponseQueue", 0);
    -[BADownload setResponseQueue:](v6, "setResponseQueue:", v8);

    v6->_downloadLockOpaque._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v6, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    sub_10002FBB8(v6, 0);
    -[BADownload setPriority:](v6, "setPriority:", 0);
    -[BADownload setApplicationGroupIdentifier:](v6, "setApplicationGroupIdentifier:", v4);
    -[BADownload setNecessity:](v6, "setNecessity:", 0);
    sub_10002FC14(v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationGroupIdentifier](v6, "applicationGroupIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v12, v13, v15));
    -[BADownload setUniqueIdentifier:](v6, "setUniqueIdentifier:", v16);

  }
  v17 = v6;
LABEL_6:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  BADownload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](v4, "identifier"));
  objc_msgSend(v22, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v22, "encodeInteger:forKey:", sub_1000301A8(v4), CFSTR("internalState"));
  objc_msgSend(v22, "encodeInteger:forKey:", -[BADownload necessity](v4, "necessity"), CFSTR("necessity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BADownload priority](v4, "priority")));
  objc_msgSend(v22, "encodeObject:forKey:", v6, CFSTR("priority"));

  objc_msgSend(v22, "encodeInteger:forKey:", sub_1000301EC(v4), CFSTR("clientSpecifiedFileSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](v4, "uniqueIdentifier"));
  objc_msgSend(v22, "encodeObject:forKey:", v7, CFSTR("uniqueIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationGroupIdentifier](v4, "applicationGroupIdentifier"));
  objc_msgSend(v22, "encodeObject:forKey:", v8, CFSTR("applicationGroupIdentifier"));

  if (v4 && objc_getProperty(v4, v9, 80, 1))
  {
    v11 = objc_getProperty(v4, v10, 80, 1);
    objc_msgSend(v22, "encodeObject:forKey:", v11, CFSTR("stagedDownloadedFileURL"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadError](v4, "downloadError"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadError](v4, "downloadError"));
    objc_msgSend(v22, "encodeObject:forKey:", v13, CFSTR("downloadFailureError"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](v4, "applicationIdentifier"));
  objc_msgSend(v22, "encodeObject:forKey:", v14, CFSTR("applicationIdentifier"));

  v16 = objc_opt_class(BAAgentKeyedArchiver, v15);
  if ((objc_opt_isKindOfClass(v22, v16) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](v4, "resumeData"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](v4, "resumeData"));
      objc_msgSend(v22, "encodeObject:forKey:", v18, CFSTR("resumeData"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](v4, "downloadCachePath"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](v4, "downloadCachePath"));
      objc_msgSend(v22, "encodeObject:forKey:", v20, CFSTR("downloadCachePath"));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](v4, "applicationInfo"));

    if (v21)
      objc_msgSend(v22, "encodeBool:forKey:", 1, CFSTR("isRestrictedDownload"));
    objc_msgSend(v22, "encodeBool:forKey:", -[BADownload permitInitialCellularDownload](v4, "permitInitialCellularDownload"), CFSTR("permitInitialCellularDownload"));
  }
  objc_sync_exit(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  BADownload *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  id Property;
  id v20;
  id v21;
  SEL v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v5 = (void *)objc_opt_class(self, a2);
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_msgSend(v5, "allocWithZone:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationGroupIdentifier](v6, "applicationGroupIdentifier"));
  v9 = objc_msgSend(v7, "initPrivatelyWithApplicationGroupIdentifier:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](v6, "identifier"));
    v11 = objc_msgSend(v10, "copyWithZone:", a3);
    objc_msgSend(v9, "setIdentifier:", v11);

    v12 = sub_1000301A8(v6);
    sub_10002FBB8(v9, v12);
    objc_msgSend(v9, "setPriority:", -[BADownload priority](v6, "priority"));
    objc_msgSend(v9, "setNecessity:", -[BADownload necessity](v6, "necessity"));
    v13 = sub_1000301EC(v6);
    sub_10002FC14(v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](v6, "uniqueIdentifier"));
    v15 = objc_msgSend(v14, "copyWithZone:", a3);
    objc_msgSend(v9, "setUniqueIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationGroupIdentifier](v6, "applicationGroupIdentifier"));
    v17 = objc_msgSend(v16, "copyWithZone:", a3);
    objc_msgSend(v9, "setApplicationGroupIdentifier:", v17);

    if (v6)
      Property = objc_getProperty(v6, v18, 80, 1);
    else
      Property = 0;
    v20 = Property;
    v21 = objc_msgSend(v20, "copyWithZone:", a3);
    objc_setProperty_atomic(v9, v22, v21, 80);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadError](v6, "downloadError"));
    v24 = objc_msgSend(v23, "copyWithZone:", a3);
    objc_msgSend(v9, "setDownloadError:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](v6, "applicationIdentifier"));
    v26 = objc_msgSend(v25, "copyWithZone:", a3);
    objc_msgSend(v9, "setApplicationIdentifier:", v26);

    objc_msgSend(v9, "setPermitInitialCellularDownload:", -[BADownload permitInitialCellularDownload](v6, "permitInitialCellularDownload"));
  }
  objc_sync_exit(v6);

  return v9;
}

- (BADownloaderPriority)priority
{
  BADownload *v2;
  BADownloaderPriority priority;

  v2 = self;
  objc_sync_enter(v2);
  priority = v2->_priority;
  objc_sync_exit(v2);

  return priority;
}

- (void)setPriority:(int64_t)a3
{
  BADownload *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_priority = a3;
  objc_sync_exit(obj);

}

- (BOOL)isEssential
{
  BADownload *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_necessity == 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)necessity
{
  BADownload *v2;
  int64_t necessity;

  v2 = self;
  objc_sync_enter(v2);
  necessity = v2->_necessity;
  objc_sync_exit(v2);

  return necessity;
}

- (void)setNecessity:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BADownload *obj;

  objc_opt_self(BADownload);
  if ((unint64_t)a3 >= 2)
  {
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v5)
      sub_100037CD0(v5, v6, v7, v8, v9, v10, v11, v12);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot provide an unsupported BADownloadNecessity.";
    __break(1u);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_necessity = a3;
    objc_sync_exit(obj);

  }
}

- (BADownloadState)state
{
  BADownload *v2;
  unint64_t v3;
  BADownloadState v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_1000301A8(v2);
  if (v3 > 8)
    v4 = BADownloadStateFailed;
  else
    v4 = qword_100042E30[v3];
  objc_sync_exit(v2);

  return v4;
}

- (BADownload)copyAsNonEssential
{
  BADownload *v2;

  v2 = (BADownload *)-[BADownload copy](self, "copy");
  -[BADownload setNecessity:](v2, "setNecessity:", 0);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  BADownload *v5;
  uint64_t v6;
  BADownload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (BADownload *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](v7, "uniqueIdentifier"));
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](self, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](v7, "identifier"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](self, "identifier"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](self, "applicationIdentifier"));
  v8 = sub_10002A1F4(-[BADownload necessity](self, "necessity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%p): [ID:%@, AppID:%@, Necessity:%@]"), v5, self, v6, v7, v9));

  return v10;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  id Property;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload identifier](self, "identifier"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (%p): %@\n"), v7, self, v8);

  v10 = sub_1000301A8(self);
  if ((unint64_t)(v10 + 2) > 0xA)
    v11 = CFSTR("???");
  else
    v11 = *(&off_100059880 + v10 + 2);
  objc_msgSend(v9, "appendFormat:", CFSTR("State: %@\n"), v11);
  objc_msgSend(v9, "appendFormat:", CFSTR("Priority: %lu\n"), -[BADownload priority](self, "priority"));
  v12 = sub_10002A1F4(-[BADownload necessity](self, "necessity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v9, "appendFormat:", CFSTR("Download Necessity: %@\n"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Unique identifier: %@\n"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationGroupIdentifier](self, "applicationGroupIdentifier"));
  objc_msgSend(v9, "appendFormat:", CFSTR("App Group identifier: %@\n"), v15);

  if (self)
    Property = objc_getProperty(self, v16, 80, 1);
  else
    Property = 0;
  objc_msgSend(v9, "appendFormat:", CFSTR("Staged file url: %@\n"), Property);
  objc_msgSend(v9, "appendFormat:", CFSTR("Client file size: %ld\n"), sub_1000301EC(self));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](self, "applicationIdentifier"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Application identifier: %@\n"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadError](self, "downloadError"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Download error: %@\n"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadStartDate](self, "downloadStartDate"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Download start time: %@\n"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](self, "downloadCachePath"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Download cache path: %@\n"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload session](self, "session"));
  objc_msgSend(v9, "appendFormat:", CFSTR("BAURLSession object: %@\n"), v22);

  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](self, "resumeData")));
  v24 = objc_msgSend(v23, "bytes");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload resumeData](self, "resumeData"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Resume data: %p, %lu\n"), v24, objc_msgSend(v25, "length"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
  if (v26)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v9, "appendFormat:", CFSTR("Is restricted download: %@\n"), v27);

  if (self->_isForegroundDownload)
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v9, "appendFormat:", CFSTR("Is foreground download: %@\n"), v28);
  if (-[BADownload permitInitialCellularDownload](self, "permitInitialCellularDownload"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v9, "appendFormat:", CFSTR("Is initial cellular permitted: %@\n"), v29);
  return v9;
}

- (os_unfair_lock_s)downloadLock
{
  return &self->_downloadLockOpaque;
}

- (void)setIsForegroundDownload:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_downloadLockOpaque);
  self->_isForegroundDownload = a3;
}

- (BOOL)isForegroundDownload
{
  os_unfair_lock_assert_owner(&self->_downloadLockOpaque);
  return self->_isForegroundDownload;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSString)applicationGroupIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setApplicationGroupIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BADownloadAgentDelegate)delegate
{
  return (BADownloadAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)downloadStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDownloadStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)downloadCachePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDownloadCachePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BAURLSession)session
{
  return (BAURLSession *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setResumeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSError)downloadError
{
  return (NSError *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDownloadError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)downloadedFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDownloadedFileSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (BAApplicationInfo)applicationInfo
{
  return (BAApplicationInfo *)objc_getProperty(self, a2, 152, 1);
}

- (void)setApplicationInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)permitInitialCellularDownload
{
  return self->_permitInitialCellularDownload;
}

- (void)setPermitInitialCellularDownload:(BOOL)a3
{
  self->_permitInitialCellularDownload = a3;
}

- (OS_dispatch_queue)responseQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setResponseQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_downloadedFileSize, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloadCachePath, 0);
  objc_storeStrong((id *)&self->_downloadStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_stagedDownloadedFileURL, 0);
  objc_storeStrong((id *)&self->_applicationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
