@implementation CDD

+ (CDD)sharedInstance
{
  if (qword_100040F28 != -1)
    dispatch_once(&qword_100040F28, &stru_100039330);
  return (CDD *)(id)qword_100040F20;
}

- (CDD)init
{
  NSObject *v3;
  CDD *v4;
  void *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *logQueue;
  CDDConfig *v10;
  CDDConfig *config;
  CDDCommunicator *v12;
  NSObject *p_super;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CDDPrivacyMonitor *v21;
  CDDPrivacyMonitor *privacyMonitor;
  CDDWatchUpdateController *v23;
  CDDWatchUpdateController *watchUpdate;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  objc_super v38;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CDDinit", " enableTelemetry=YES ", buf, 2u);
  }

  v38.receiver = self;
  v38.super_class = (Class)CDD;
  v4 = -[CDD init](&v38, "init");
  if (v4)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.coreduetdLogQueue", v7);
    logQueue = v4->logQueue;
    v4->logQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(CDDConfig);
    config = v4->config;
    v4->config = v10;

    if (!-[CDD readConfigParamsFromPlist](v4, "readConfigParamsFromPlist"))
      -[CDD setDefaultConfigParams](v4, "setDefaultConfigParams");
    if (objc_opt_class(IDSService))
    {
      v12 = -[CDDCommunicator initWithCDDinstance:]([CDDCommunicator alloc], "initWithCDDinstance:", v4);
      p_super = &v4->communicator->super;
      v4->communicator = v12;
    }
    else
    {
      p_super = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_10002352C(p_super, v14, v15, v16, v17, v18, v19, v20);
    }

    -[CDD classCAndPasscodeCheck](v4, "classCAndPasscodeCheck");
    v21 = -[CDDPrivacyMonitor initWithCDDinstance:]([CDDPrivacyMonitor alloc], "initWithCDDinstance:", v4);
    privacyMonitor = v4->privacyMonitor;
    v4->privacyMonitor = v21;

    v23 = -[CDDWatchUpdateController initWithCDDinstance:]([CDDWatchUpdateController alloc], "initWithCDDinstance:", v4);
    watchUpdate = v4->watchUpdate;
    v4->watchUpdate = v23;

    if (!v4->privacyMonitor)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1000234F8(v25, v26, v27, v28, v29, v30, v31, v32);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](v4, "config"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CDD computeDatabaseAge](v4, "computeDatabaseAge"));
    objc_msgSend(v33, "setAgeOfDatabase:", v34);

    -[CDD setupCommunicator](v4, "setupCommunicator");
    -[CDD dumpAll](v4, "dumpAll");
    objc_autoreleasePoolPop(v5);
  }
  v35 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Done with CDD init.", buf, 2u);
  }

  v36 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CDDinit", ", buf, 2u);
  }

  return v4;
}

- (void)classCAndPasscodeCheck
{
  NSObject *v3;
  NSObject *logQueue;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD handler[5];
  int v11;
  uint8_t buf[16];
  int out_token[4];

  if (!MKBDeviceFormattedForContentProtection(self, a2))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(out_token[0]) = 0;
      v6 = "Device is not formatted for content protection. Not checking for Class C lock state.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)out_token, 2u);
    }
LABEL_11:

    self->classCLocked = 0;
    goto LABEL_12;
  }
  if (!-[CDD isClassCLocked](self, "isClassCLocked"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(out_token[0]) = 0;
      v6 = "Device is already Class-C-unlocked...";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  out_token[0] = 0;
  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Device is Class-C-locked. Setting handler for first unlock...", buf, 2u);
  }

  logQueue = self->logQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001F8F0;
  handler[3] = &unk_100039358;
  handler[4] = self;
  v11 = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", out_token, logQueue, handler);
  self->classCLocked = -[CDD isClassCLocked](self, "isClassCLocked");
LABEL_12:
  out_token[0] = 0;
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting handler for lock status changes...", buf, 2u);
  }

  v8 = self->logQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F97C;
  v9[3] = &unk_100038C38;
  v9[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", out_token, v8, v9);
  self->passcodeLocked = -[CDD isLocked](self, "isLocked");
}

- (id)knowledgeStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDKnowledgeDaemon defaultDaemon](CDKnowledgeDaemon, "defaultDaemon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));

  return v3;
}

- (void)setupCommunicator
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FA54;
  block[3] = &unk_100038A70;
  block[4] = self;
  if (qword_100040F30 != -1)
    dispatch_once(&qword_100040F30, block);
}

- (BOOL)isClassCLocked
{
  BOOL v2;
  CFBooleanRef v3;
  NSObject *v4;
  uint8_t v6[16];

  if (MKBDeviceUnlockedSinceBoot(self, a2))
    return 0;
  v3 = (CFBooleanRef)MGCopyAnswer(CFSTR("PasswordConfigured"), 0);
  v2 = v3 == kCFBooleanTrue;
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }

  }
  return v2;
}

- (BOOL)isLocked
{
  const __CFBoolean *v2;
  CFBooleanRef v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("PasswordProtected"), 0);
  v3 = v2;
  if (v2)
  {
    CFRelease(v2);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }

  }
  return v3 == kCFBooleanTrue;
}

- (unint64_t)calculateActualStartEpoch:(unint64_t)a3 endepoch:(unint64_t)a4 recurrenceInterval:(unint64_t)a5
{
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  unint64_t v15;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ageOfDatabase"));
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = (unint64_t)v10;

  if (v11 - a3 > 0x15180 && a4 > v11 && a4 > a3 && v11 >= a3)
  {
    if (a5)
      v15 = a5;
    else
      v15 = 86400;
    if ((a4 - v11) >> 7 > 0xD2E || (v11 = a4 - 432000, a4 - 432000 >= a3))
      a3 += (v11 - a3) / v15 * v15;
  }
  return a3;
}

- (id)pmfOverHourOfDayWithParams:(id *)a3
{
  unint64_t var3;
  unint64_t var5;
  unint64_t v7;
  void *v8;
  void *v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  unint64_t var4;
  unint64_t var7;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  uint64_t i;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t var6;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  int v71;
  unint64_t v72;
  unint64_t v73;
  BOOL v74;
  unint64_t v75;
  int v76;
  uint64_t v77;
  int64x2_t v78;
  uint64_t k;
  xpc_object_t v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  void *m;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  unint64_t v90;
  const char *v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  uint64_t v96;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id value;
  void *v106;
  void *v107;
  void *v108;
  CDD *v109;
  $9EF61393A4055C34F72B03AB51E5A959 *v110;
  xpc_object_t xdict;
  id obj;
  unint64_t v113;
  unint64_t v114;
  void *v115;
  unint64_t v116;
  void *v117;
  void *v118;
  _QWORD v119[5];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  void *v130;
  void *v131;
  _QWORD v132[2];
  _QWORD __b[96];

  var3 = a3->var3;
  var5 = a3->var5;
  if (!var5)
  {
    a3->var5 = 86400;
    var5 = 86400;
  }
  if (!a3->var6)
    a3->var6 = 86400;
  v7 = -[CDD calculateActualStartEpoch:endepoch:recurrenceInterval:](self, "calculateActualStartEpoch:endepoch:recurrenceInterval:", var3, a3->var4, var5);
  v8 = (void *)os_transaction_create("com.apple.coreduetd.pmf-over-hour-of-day-with-params");
  v9 = objc_autoreleasePoolPush();
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  v12 = 0;
  if (!a3->var13)
  {
    v116 = v7;
    v108 = v8;
    v109 = self;
    v110 = a3;
    xdict = v10;
    v107 = v9;
    var4 = a3->var4;
    var7 = a3->var7;
    v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = objc_alloc_init((Class)NSMutableArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var3));
    objc_msgSend(v18, "doubleValue");
    v19 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

    v115 = v17;
    v106 = (void *)v19;
    v20 = (char *)objc_msgSend(v17, "secondsFromGMTForDate:", v19) + var3;
    bzero(__b, 0x300uLL);
    for (i = 0; i != 96; ++i)
    {
      v22 = objc_alloc_init((Class)NSMutableSet);
      objc_msgSend(v15, "insertObject:atIndex:", v22, i);

      v23 = objc_alloc_init((Class)NSMutableSet);
      objc_msgSend(v16, "insertObject:atIndex:", v23, i);

    }
    v117 = v15;
    v118 = v16;
    if (v110->var8 == 20499)
    {
      v113 = (unint64_t)v20;
      v24 = v116;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v116));
      objc_msgSend(v25, "doubleValue");
      v26 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var4));
      objc_msgSend(v27, "doubleValue");
      v28 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

      v103 = (void *)v28;
      v104 = (void *)v26;
      v29 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithStartInDateRangeFrom:to:", v26, v28));
      if (v110->var14 && v110->var2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        v31 = objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", v30));
      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DKApplicationMetadataKey extensionHostIdentifier](_DKApplicationMetadataKey, "extensionHostIdentifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForObjectsWithMetadataKey:](_DKQuery, "predicateForObjectsWithMetadataKey:", v30));
        v31 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v32));

      }
      v101 = (void *)v31;
      v102 = (void *)v29;
      v132[0] = v29;
      v132[1] = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 2));
      v34 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v33));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"));
      v131 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
      v130 = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
      v100 = (void *)v34;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v34, v36, 0, var7, v38));

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CDD.m"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByAppendingFormat:", CFSTR(":%d"), 498));
      objc_msgSend(v39, "setClientName:", v41);

      objc_msgSend(v39, "setTracker:", &stru_100039398);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CDD knowledgeStore](v109, "knowledgeStore"));
      v99 = v39;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "executeQuery:error:", v39, 0));

      value = objc_msgSend(v43, "count");
      if (v43)
      {
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v98 = v43;
        obj = v43;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
        if (v44)
        {
          v45 = v44;
          v114 = v113 % 0x15180;
          v46 = *(_QWORD *)v125;
          do
          {
            for (j = 0; j != v45; j = (char *)j + 1)
            {
              if (*(_QWORD *)v125 != v46)
                objc_enumerationMutation(obj);
              v48 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)j);
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));

              if (v49)
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
                v51 = objc_msgSend(v115, "secondsFromGMTForDate:", v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
                objc_msgSend(v52, "timeIntervalSinceReferenceDate");
                v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v54 = ((unint64_t)v51 + (unint64_t)objc_msgSend(v53, "integerValue")) % 0x15180;

                v55 = v54 - v114;
                if (v54 < v114)
                  v55 = v54 - v114 + 86400;
                v56 = v55;
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
                objc_msgSend(v57, "timeIntervalSinceReferenceDate");
                v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v59 = ((unint64_t)objc_msgSend(v58, "unsignedIntegerValue") - v116) / 0x15180;

                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectAtIndex:", v56 / 0x384));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectAtIndex:", v56 / 0x384));
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));
                objc_msgSend(v60, "addObject:", v62);

                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%03llu"), "XQW90", v59));
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "stringByAppendingString:", v64));
                objc_msgSend(v61, "addObject:", v65);

              }
            }
            v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
          }
          while (v45);
        }

        v24 = v116;
        v43 = v98;
      }

    }
    else
    {
      value = 0;
      v24 = v116;
    }
    v67 = v110->var5;
    var6 = v110->var6;
    v68 = v110->var4;
    v69 = v117;
    if (v67 == 86400 && var6 == 86400)
    {
      v70 = (v68 - v24) / 0x15180;
      if (!((v68 - v24) % 0x15180))
      {
        v77 = 0;
        v78 = vdupq_n_s64(v70);
        do
        {
          *(int64x2_t *)&__b[v77] = v78;
          v77 += 2;
        }
        while (v77 != 96);
LABEL_50:
        for (k = 0; k != 96; ++k)
        {
          v80 = xpc_dictionary_create(0, 0, 0);
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectAtIndex:", k));
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
          if (v82)
          {
            v83 = v82;
            v84 = *(_QWORD *)v121;
            do
            {
              for (m = 0; m != v83; m = (char *)m + 1)
              {
                if (*(_QWORD *)v121 != v84)
                  objc_enumerationMutation(v81);
                v86 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)m);
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectAtIndex:", k));
                v119[0] = _NSConcreteStackBlock;
                v119[1] = 3221225472;
                v119[2] = sub_10002075C;
                v119[3] = &unk_1000393C0;
                v119[4] = v86;
                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectsPassingTest:", v119));
                v89 = objc_msgSend(v88, "count");

                v90 = __b[k];
                v91 = (const char *)objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
                if (v90)
                  v92 = (double)(unint64_t)v89 / (double)v90;
                else
                  v92 = 0.0;
                xpc_dictionary_set_double(v80, v91, v92);
              }
              v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
            }
            while (v83);
          }

          v11 = xdict;
          xpc_dictionary_set_value(xdict, off_1000393E0[k], v80);

          v69 = v117;
        }
        xpc_dictionary_set_uint64(xdict, "itemsInForecast", (uint64_t)value);
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](v109, "config"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "ageOfDatabase"));
        objc_msgSend(v94, "timeIntervalSinceReferenceDate");
        v96 = (unint64_t)v95;

        xpc_dictionary_set_uint64(xdict, "databaseEpochSeconds", v96);
        v12 = xdict;

        v9 = v107;
        v8 = v108;
        goto LABEL_63;
      }
      if (v68 == -1025)
      {
        memset_pattern16(__b, &unk_100031E50, 0x300uLL);
        goto LABEL_50;
      }
    }
    if (v68 > v24)
    {
      v71 = 0;
      v72 = var6 + v24;
      if (v67 > var6)
        var6 = v110->var5;
      v73 = v24;
      do
      {
        ++__b[v71];
        v74 = v24 + 900 >= v72;
        v75 = v73 + var6;
        if (v24 + 900 < v72)
        {
          v24 += 900;
        }
        else
        {
          v73 += var6;
          v24 = v75;
        }
        if (v74)
          v72 += var6;
        if (v74)
          v76 = var6 / 0x384;
        else
          v76 = 1;
        v71 = (v76 + v71) % 96;
      }
      while (v24 < v68);
    }
    goto LABEL_50;
  }
LABEL_63:

  objc_autoreleasePoolPop(v9);
  return v12;
}

- (void)saveRemoteInBedTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  id v17;
  NSObject *v18;

  v4 = a3;
  if (objc_msgSend(v4, "count") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams remoteDeviceInBedTimesStream](_DKSystemEventStreams, "remoteDeviceInBedTimesStream"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v8 = objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", v5, v6, v7, 1, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDD knowledgeStore](self, "knowledgeStore"));
    v18 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v13 = 0;
    LODWORD(v7) = objc_msgSend(v9, "saveObjects:error:", v10, &v13);
    v11 = v13;

    if (!(_DWORD)v7 || v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to save event: %@, Error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not enough dates for expected in bed times", buf, 2u);
    }
  }

}

- (id)histogramOfCountsFromForecast:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020AFC;
  v8[3] = &unk_100039710;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Counts are: %@", buf, 0xCu);
  }

  v6 = objc_msgSend(v4, "copy");
  return v6;
}

- (id)retrieveHistogram
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;

  v3 = objc_alloc((Class)NSDateInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v6 = objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams pairedDeviceForecastStream](_DKSystemEventStreams, "pairedDeviceForecastStream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:](_DKHistogramQuery, "histogramQueryForStream:interval:withPredicate:", v7, v6, v8));

  objc_msgSend(v9, "setIncludeLocalResults:", 0);
  objc_msgSend(v9, "setIncludeRemoteResults:", 1);
  objc_msgSend(v9, "setRemoteHistogramLimit:", 1);
  v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Query is: %@", (uint8_t *)&v14, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDD knowledgeStore](self, "knowledgeStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeQuery:error:", v9, 0));

  return v12;
}

- (BOOL)saveForecast:(id)a3 queryParameters:(id *)a4 deviceIdentifier:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v7 = a3;
  v8 = (void *)os_transaction_create("com.apple.cdd.communicator.forecastSave");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDD histogramOfCountsFromForecast:](self, "histogramOfCountsFromForecast:", v7));

  v10 = objc_msgSend(objc_alloc((Class)_DKHistogram), "initWithHistogram:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams pairedDeviceForecastStream](_DKSystemEventStreams, "pairedDeviceForecastStream"));
  objc_msgSend(v10, "setStream:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = objc_alloc((Class)NSDateInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0));
  v15 = objc_msgSend(v13, "initWithStartDate:endDate:", v14, v12);
  objc_msgSend(v10, "setInterval:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDD retrieveHistogram](self, "retrieveHistogram"));
  v17 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Retrieved histogram: %@", buf, 0xCu);
  }

  v18 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Replacing with: %@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CDKnowledgeDaemon defaultDaemon](CDKnowledgeDaemon, "defaultDaemon"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storage"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100021008;
  v25[3] = &unk_100039738;
  v26 = v8;
  v27 = v10;
  v28 = v16;
  v21 = v16;
  v22 = v10;
  v23 = v8;
  objc_msgSend(v20, "saveHistogram:responseQueue:withCompletion:", v22, 0, v25);

  return 1;
}

- (id)computeDatabaseAge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  void *v23;
  void *v24;

  v3 = (void *)os_transaction_create("com.apple.coreduetd.computeDBAge");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceBatteryPercentageStream](_DKSystemEventStreams, "deviceBatteryPercentageStream"));
  v24 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v23 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v7, 0, 1, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CDD.m"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%d"), 710));
  objc_msgSend(v9, "setClientName:", v11);

  objc_msgSend(v9, "setTracker:", &stru_100039758);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDD knowledgeStore](self, "knowledgeStore"));
  v22 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeQuery:error:", v9, &v22));
  v14 = v22;

  if (v14
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject")),
        v16 = objc_opt_class(_DKEvent),
        isKindOfClass = objc_opt_isKindOfClass(v15, v16),
        v15,
        (isKindOfClass & 1) == 0))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000235D4((uint64_t)v14, v13, v20);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));

  }
  objc_autoreleasePoolPop(v4);

  return v19;
}

- (void)setDatabaseAge:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v5, "setAgeOfDatabase:", v4);

  }
}

- (void)dumpAll
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  int v22;
  unsigned int v23;

  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "--------------", (uint8_t *)&v22, 2u);
  }

  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "coreduetd: Dump.", (uint8_t *)&v22, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "", (uint8_t *)&v22, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "\tCurrent config parameters:", (uint8_t *)&v22, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    v9 = objc_msgSend(v8, "verbose");
    v22 = 67109120;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "\t\tverbose: %d", (uint8_t *)&v22, 8u);

  }
  v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", (uint8_t *)&v22, 2u);
  }

  v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "\tCurrent CDDCommunicator parameters:", (uint8_t *)&v22, 2u);
  }

  v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    v14 = objc_msgSend(v13, "commEnabled");
    v22 = 67109120;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "\t\tcommEnabled: %d\n", (uint8_t *)&v22, 8u);

  }
  v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    v17 = objc_msgSend(v16, "commMinClientGranularity");
    v22 = 67109120;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "\t\tcommMinClientGranularity: %d\n", (uint8_t *)&v22, 8u);

  }
  v18 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    v20 = objc_msgSend(v19, "commSyncBoundarySeconds");
    v22 = 67109120;
    v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "\t\tcommSyncBoundarySeconds: %d\n", (uint8_t *)&v22, 8u);

  }
  v21 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "--------------", (uint8_t *)&v22, 2u);
  }

}

- (BOOL)readConfigParamsFromPlist
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePath](CDDPaths, "CDDConfigurationBundlePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v3));

  if ((v4
     || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDConfigurationBundlePathDefault](CDDPaths, "CDDConfigurationBundlePathDefault")), v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v5)), v5, v4))&& (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CoreDuetDaemonConfigKeyString")))) != 0)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
    -[CDD loadParamsFromDict:userDefaults:](self, "loadParamsFromDict:userDefaults:", v7, v8);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setDefaultConfigParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v3, "setVerbose:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v4, "setBatteryMonitorExchangeTimerDelta:", 900);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v5, "setBatteryMonitorExchangeBattDelta:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v6, "setCommEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v7, "setCommMinClientGranularity:", 900);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  objc_msgSend(v8, "setCommSyncBoundarySeconds:", 86400);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setAgeOfDatabase:", v9);

}

- (void)loadParamsFromDict:(id)a3 userDefaults:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("CDDVerboseKeyString"))),
        v8,
        v8))
  {
    v9 = objc_msgSend(v7, "BOOLForKey:", CFSTR("CDDVerboseKeyString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v10, "setVerbose:", v9);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDVerboseKeyString")));
    if (!v11)
      goto LABEL_7;
    v10 = (void *)v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v12, "setVerbose:", objc_msgSend(v10, "BOOLValue"));

  }
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDBatteryMonitorExchangeTimerDeltaString")));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v14, "setBatteryMonitorExchangeTimerDelta:", objc_msgSend(v13, "intValue"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDBatteryMonitorExchangeBattDeltaString")));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v16, "setBatteryMonitorExchangeBattDelta:", objc_msgSend(v15, "intValue"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDCEnabledString")));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v18, "setCommEnabled:", objc_msgSend(v17, "BOOLValue"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDCMinClientGranularityString")));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v20, "setCommMinClientGranularity:", objc_msgSend(v19, "intValue"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CFSTR("CDDCSyncBoundarySecondsString")));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDD config](self, "config"));
    objc_msgSend(v22, "setCommSyncBoundarySeconds:", objc_msgSend(v21, "intValue"));

  }
}

- (CDDConfig)config
{
  return self->config;
}

- (CDDCommunicator)communicator
{
  return self->communicator;
}

- (CDDPrivacyMonitor)privacyMonitor
{
  return self->privacyMonitor;
}

- (CDDWatchUpdateController)watchUpdate
{
  return self->watchUpdate;
}

- (BOOL)classCLocked
{
  return self->classCLocked;
}

- (BOOL)passcodeLocked
{
  return self->passcodeLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->watchUpdate, 0);
  objc_storeStrong((id *)&self->config, 0);
  objc_storeStrong((id *)&self->logQueue, 0);
  objc_storeStrong((id *)&self->cullingTimer, 0);
  objc_storeStrong((id *)&self->cullingTimerQueue, 0);
  objc_storeStrong((id *)&self->privacyMonitor, 0);
  objc_storeStrong((id *)&self->communicator, 0);
}

@end
