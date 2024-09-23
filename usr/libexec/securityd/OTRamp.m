@implementation OTRamp

- (OTRamp)initWithRecordName:(id)a3 localSettingName:(id)a4 container:(id)a5 database:(id)a6 zoneID:(id)a7 accountTracker:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 fetchRecordRecordsOperationClass:(Class)a11
{
  id v17;
  id v18;
  id v19;
  OTRamp *v20;
  OTRamp *v21;
  NSString *v22;
  NSString *recordName;
  NSString *v24;
  NSString *localSettingName;
  uint64_t v26;
  NSDate *lastFetch;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v17 = a5;
  v18 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)OTRamp;
  v20 = -[OTRamp init](&v34, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_container, a5);
    v22 = (NSString *)objc_msgSend(v33, "copy");
    recordName = v21->_recordName;
    v21->_recordName = v22;

    v24 = (NSString *)objc_msgSend(v32, "copy");
    localSettingName = v21->_localSettingName;
    v21->_localSettingName = v24;

    objc_storeStrong((id *)&v21->_database, a6);
    objc_storeStrong((id *)&v21->_zoneID, a7);
    objc_storeStrong((id *)&v21->_accountTracker, a8);
    objc_storeStrong((id *)&v21->_lockStateTracker, a9);
    objc_storeStrong((id *)&v21->_reachabilityTracker, a10);
    objc_storeStrong((id *)&v21->_fetchRecordRecordsOperationClass, a11);
    v26 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastFetch = v21->_lastFetch;
    v21->_lastFetch = (NSDate *)v26;

    v21->_retryAfter = 86400.0;
    v21->_cachedFeatureAllowed = 0;
  }

  return v21;
}

- (void)fetchRampRecordWithReply:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v5 = objc_alloc_init((Class)CKOperationConfiguration);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setIsCloudKitSupportOperation:", 1);
  v6 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", self->_recordName, self->_zoneID);
  v7 = objc_alloc((Class)objc_opt_class(-[OTRamp fetchRecordRecordsOperationClass](self, "fetchRecordRecordsOperationClass")));
  v21 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v9 = objc_msgSend(v7, "initWithRecordIDs:", v8);

  v20[0] = CFSTR("FeatureAllowed");
  v20[1] = CFSTR("FeaturePromoted");
  v20[2] = CFSTR("FeatureVisible");
  v20[3] = CFSTR("RetryAfter");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  objc_msgSend(v9, "setDesiredKeys:", v10);

  objc_msgSend(v9, "setConfiguration:", v5);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100124F98;
  v17[3] = &unk_1002DEF10;
  v18 = v6;
  v19 = v4;
  v11 = v4;
  v12 = v6;
  objc_msgSend(v9, "setFetchRecordsCompletionBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp database](self, "database"));
  objc_msgSend(v13, "addOperation:", v9);

  v14 = sub_10000EF14("octagon");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to fetch ramp state from CloudKit", v16, 2u);
  }

}

- (BOOL)checkRampStateWithError:(id *)a3
{
  __CFString *v5;
  CFBooleanRef v6;
  const void *v7;
  NSObject *v8;
  __CFString *v9;
  const char *v10;
  CFTypeID v11;
  CFTypeID TypeID;
  const char *v13;
  CFTypeID v14;
  unsigned __int8 v15;
  const void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  unsigned int v28;
  const void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  dispatch_semaphore_t v43;
  NSObject *v44;
  dispatch_time_t v45;
  const void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  const void *v53;
  NSObject *v54;
  const __CFString *v55;
  const void *v56;
  NSObject *v57;
  const __CFString *v58;
  uint64_t v59;
  void *v60;
  const void *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void **v72;
  uint64_t v73;
  void (*v74)(uint64_t, int, int, int, uint64_t, void *);
  void *v75;
  NSObject *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  NSErrorUserInfoKey v98;
  const __CFString *v99;
  NSErrorUserInfoKey v100;
  const __CFString *v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  NSErrorUserInfoKey v104;
  const __CFString *v105;
  uint8_t buf[4];
  const __CFString *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  const char *v113;

  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = sub_100124E54;
  v88 = sub_100124E64;
  v89 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTRamp localSettingName](self, "localSettingName"));
  v6 = (CFBooleanRef)CFPreferencesCopyValue(v5, CFSTR("com.apple.security"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  v7 = sub_10000EF14("octagon");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTRamp localSettingName](self, "localSettingName"));
    if (v6)
      v10 = "True";
    else
      v10 = "False";
    if (v6)
    {
      v11 = CFGetTypeID(v6);
      TypeID = CFBooleanGetTypeID();
      v13 = "False";
      if (v11 == TypeID && v6 == kCFBooleanTrue)
        v13 = "True";
    }
    else
    {
      v13 = "False";
    }
    *(_DWORD *)buf = 138413058;
    v107 = v9;
    v108 = 2080;
    v109 = "False";
    v110 = 2080;
    v111 = v10;
    v112 = 2080;
    v113 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Defaults availability: SecCKKSTestsEnabled[%s] DefaultsPointer[%s] DefaultsValue[%s]", buf, 0x2Au);

  }
  if (!v6)
  {
LABEL_20:
    v21 = objc_alloc_init((Class)NSDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp lastFetch](self, "lastFetch"));
    objc_msgSend(v21, "timeIntervalSinceDate:", v22);
    v24 = v23;
    -[OTRamp retryAfter](self, "retryAfter");
    v26 = v24 < v25;

    if (v26)
    {
      v15 = -[OTRamp cachedFeatureAllowed](self, "cachedFeatureAllowed");
LABEL_54:

      goto LABEL_55;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp lockStateTracker](self, "lockStateTracker"));
    v28 = objc_msgSend(v27, "isLocked");

    if (v28)
    {
      v29 = sub_10000EF14("octagon");
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "device is locked! can't check ramp state", buf, 2u);
      }

      v104 = NSLocalizedDescriptionKey;
      v105 = CFSTR("device is locked");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
      v32 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainOSStatus, -25308, v31));
      v33 = (void *)v85[5];
      v85[5] = v32;

      if (a3)
      {
LABEL_52:
        v15 = 0;
        *a3 = objc_retainAutorelease((id)v85[5]);
        goto LABEL_54;
      }
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp accountTracker](self, "accountTracker"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ckAccountInfoInitialized"));
      objc_msgSend(v35, "wait:", 5000000000);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp accountTracker](self, "accountTracker"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentCKAccountInfo"));
      v38 = objc_msgSend(v37, "accountStatus") == (id)1;

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp reachabilityTracker](self, "reachabilityTracker"));
        v40 = objc_msgSend(v39, "currentReachability");

        if ((v40 & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "logSystemMetricsForActivityNamed:withAction:", CFSTR("CKKSActivityOTFetchRampState"), 0));
          v43 = dispatch_semaphore_create(0);
          objc_msgSend(v42, "start");
          v72 = _NSConcreteStackBlock;
          v73 = 3221225472;
          v74 = sub_100124E6C;
          v75 = &unk_1002DEF38;
          v77 = &v90;
          v78 = &v80;
          v79 = &v84;
          v44 = v43;
          v76 = v44;
          -[OTRamp fetchRampRecordWithReply:](self, "fetchRampRecordWithReply:", &v72);
          v45 = dispatch_time(0, 65000000000);
          if (dispatch_semaphore_wait(v44, v45))
          {
            v46 = sub_10000EF14("octagon");
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "timed out waiting for response from CloudKit\n", buf, 2u);
            }

            v98 = NSLocalizedDescriptionKey;
            v99 = CFSTR("timed out waiting for response from CloudKit");
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1, v72, v73, v74, v75));
            v49 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 23, v48));
            v50 = (void *)v85[5];
            v85[5] = v49;

            v51 = v85[5];
            v96 = CFSTR("OTFailureReason");
            v97 = CFSTR("cloud kit timed out");
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
            objc_msgSend(v41, "logUnrecoverableError:forEvent:withAttributes:", v51, CFSTR("OctagonEventRamp"), v52);

          }
          objc_msgSend(v42, "stop", v72, v73, v74, v75);
          if (v81[3] >= 1)
          {
            v53 = sub_10000EF14("octagon");
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v55 = (const __CFString *)v81[3];
              *(_DWORD *)buf = 134217984;
              v107 = v55;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "cloud kit asked security to retry: %lu", buf, 0xCu);
            }

            -[OTRamp setRetryAfter:](self, "setRetryAfter:", (double)v81[3]);
          }
          if (v85[5])
          {
            v56 = sub_10000EF14("SecError");
            v57 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = (const __CFString *)v85[5];
              *(_DWORD *)buf = 138412290;
              v107 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "octagon: had an error fetching ramp state: %@", buf, 0xCu);
            }

            v59 = v85[5];
            v94 = CFSTR("OTFailureReason");
            v95 = CFSTR("fetching ramp state");
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
            objc_msgSend(v41, "logUnrecoverableError:forEvent:withAttributes:", v59, CFSTR("OctagonEventRamp"), v60);

            if (a3)
              *a3 = objc_retainAutorelease((id)v85[5]);
          }
          if (*((_BYTE *)v91 + 24))
            objc_msgSend(v41, "logSuccessForEventNamed:", CFSTR("OctagonEventRamp"));
          -[OTRamp setLastFetch:](self, "setLastFetch:", v21);
          -[OTRamp setCachedFeatureAllowed:](self, "setCachedFeatureAllowed:", *((unsigned __int8 *)v91 + 24));
          v15 = *((_BYTE *)v91 + 24) != 0;

          goto LABEL_54;
        }
        v66 = sub_10000EF14("octagon");
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "no network! can't check ramp state", buf, 2u);
        }

        v100 = NSLocalizedDescriptionKey;
        v101 = CFSTR("no network");
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
        v69 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 24, v68));
        v70 = (void *)v85[5];
        v85[5] = v69;

        if (a3)
          goto LABEL_52;
      }
      else
      {
        v61 = sub_10000EF14("octagon");
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "not signed in! can't check ramp state", buf, 2u);
        }

        v102 = NSLocalizedDescriptionKey;
        v103 = CFSTR("not signed in");
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
        v64 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.octagon"), 25, v63));
        v65 = (void *)v85[5];
        v85[5] = v64;

        if (a3)
          goto LABEL_52;
      }
    }
    v15 = 0;
    goto LABEL_54;
  }
  v14 = CFGetTypeID(v6);
  if (v14 != CFBooleanGetTypeID())
  {
    CFRelease(v6);
    goto LABEL_20;
  }
  v15 = v6 == kCFBooleanTrue;
  v16 = sub_10000EF14("octagon");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_claimAutoreleasedReturnValue(-[OTRamp recordName](self, "recordName"));
    v19 = (void *)v18;
    v20 = CFSTR("disabled");
    if (v6 == kCFBooleanTrue)
      v20 = CFSTR("enabled");
    *(_DWORD *)buf = 138412546;
    v107 = v20;
    v108 = 2112;
    v109 = (const char *)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "feature is %@: %@ (local config)", buf, 0x16u);

  }
  CFRelease(v6);
LABEL_55:
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  return v15;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_storeStrong((id *)&self->_recordName, a3);
}

- (NSString)localSettingName
{
  return self->_localSettingName;
}

- (void)setLocalSettingName:(id)a3
{
  objc_storeStrong((id *)&self->_localSettingName, a3);
}

- (CKKSAccountStateTracker)accountTracker
{
  return self->_accountTracker;
}

- (void)setAccountTracker:(id)a3
{
  objc_storeStrong((id *)&self->_accountTracker, a3);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setLockStateTracker:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateTracker, a3);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return self->_reachabilityTracker;
}

- (void)setReachabilityTracker:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityTracker, a3);
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (Class)fetchRecordRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)lastFetch
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (double)retryAfter
{
  return self->_retryAfter;
}

- (void)setRetryAfter:(double)a3
{
  self->_retryAfter = a3;
}

- (BOOL)cachedFeatureAllowed
{
  return self->_cachedFeatureAllowed;
}

- (void)setCachedFeatureAllowed:(BOOL)a3
{
  self->_cachedFeatureAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetch, 0);
  objc_storeStrong((id *)&self->_fetchRecordRecordsOperationClass, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);
  objc_storeStrong((id *)&self->_localSettingName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
