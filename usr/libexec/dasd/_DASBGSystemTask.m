@implementation _DASBGSystemTask

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BGST")));
  v4 = (void *)qword_1001AB980;
  qword_1001AB980 = v3;

  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.bg.system.task"));
  v6 = (void *)qword_1001AB988;
  qword_1001AB988 = (uint64_t)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "dictionaryForKey:", CFSTR("ActivityBaseDates")));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
    v10 = (void *)qword_1001AB990;
    qword_1001AB990 = (uint64_t)v9;

    +[_DASBGSystemTask garbageCollectActivityDates](_DASBGSystemTask, "garbageCollectActivityDates");
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)qword_1001AB990;
    qword_1001AB990 = v11;

  }
  v13 = objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper activityQueue](_DASBGSystemTaskHelper, "activityQueue"));
  v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
  v15 = (void *)qword_1001AB998;
  qword_1001AB998 = (uint64_t)v14;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100066300;
  handler[3] = &unk_10015D3A8;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001AB998, handler);
  v16 = qword_1001AB998;
  v17 = dispatch_time(0, 86400000000000);
  dispatch_source_set_timer(v16, v17, 0x4E94914F0000uLL, 0x13A52453C000uLL);
  dispatch_activate((dispatch_object_t)qword_1001AB998);

}

+ (void)garbageCollectActivityDates
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (objc_msgSend((id)qword_1001AB990, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", -4838400.0));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB990, "allKeys", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB990, "objectForKeyedSubscript:", v9));
          if (objc_msgSend(v10, "compare:", v3) == (id)-1)
          {
            objc_msgSend((id)qword_1001AB990, "removeObjectForKey:", v9);
          }
          else if (objc_msgSend(v10, "compare:", v2) == (id)1)
          {
            objc_msgSend((id)qword_1001AB990, "setObject:forKeyedSubscript:", v2, v9);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7
{
  return -[_DASBGSystemTask initWithDescriptor:withToken:withUID:withService:staticSubmission:task:](self, "initWithDescriptor:withToken:withUID:withService:staticSubmission:task:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7 task:(id)a8
{
  _BOOL4 v9;
  id v14;
  _DASBGSystemTask *v15;
  uint64_t v16;
  NSString *identifier;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _DASBGSystemTask *v22;
  xpc_object_t dictionary;
  void *v25;
  void *v26;
  xpc_object_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double interval;
  double minDurationBetweenInstances;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  NSObject *v45;
  id v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double startAfter;
  xpc_object_t array;
  void *v55;
  NSArray *featureCodes;
  const char *string;
  const char *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  xpc_object_t value;
  void *v63;
  xpc_object_t v64;
  void *v65;
  uint64_t v66;
  NSArray *related_applications;
  xpc_object_t v68;
  void *v69;
  uint64_t v70;
  NSArray *involved_processes;
  xpc_object_t v72;
  _BOOL4 v73;
  BOOL v74;
  xpc_object_t v75;
  void *v76;
  _BOOL4 v77;
  BOOL v78;
  xpc_object_t v79;
  _BOOL4 v80;
  BOOL v81;
  xpc_object_t v82;
  void *v83;
  xpc_object_t v84;
  void *v85;
  uint64_t v86;
  OS_nw_endpoint *network_endpoint;
  xpc_object_t v88;
  void *v89;
  uint64_t v90;
  OS_nw_parameters *network_parameters;
  const char *v92;
  uint64_t v93;
  NSString *group_name;
  xpc_object_t v95;
  uint64_t v96;
  int64_t int64;
  const char *v98;
  uint64_t v99;
  NSString *rateLimitConfigurationName;
  unint64_t v101;
  uint64_t v102;
  BOOL v103;
  xpc_object_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  NSSet *produced_result_identifiers;
  xpc_object_t v109;
  void *v110;
  id *v111;
  const char *v112;
  uint64_t v113;
  NSString *diskVolume;
  const char *v115;
  const char *v116;
  uint64_t v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  NSString *remoteDevice;
  const char *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  NSString *dataBudgetName;
  const char *v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  NSDate *baseTime;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v142;
  id v143;
  _QWORD applier[4];
  id *v145;
  _BYTE *v146;
  unsigned int v147;
  objc_super v148;
  _BYTE buf[24];
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _OWORD v153[8];

  v9 = a7;
  v14 = a3;
  v142 = a6;
  v143 = a8;
  v148.receiver = self;
  v148.super_class = (Class)_DASBGSystemTask;
  v15 = -[_DASBGSystemTask init](&v148, "init");

  if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary)
    sub_1000E35C4();
  memset(v153, 0, sizeof(v153));
  if ((xpc_get_event_name("com.apple.bg.system.task", a4, v153) & 1) == 0)
  {
    v21 = qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
      sub_1000E3584(v21);
    goto LABEL_9;
  }
  v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v153));
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v16;

  v15->_token = a4;
  v15->_uid = a5;
  objc_storeStrong((id *)&v15->_serviceName, a6);
  v15->_suspensionReason = -1;
  if (xpc_dictionary_get_BOOL(v14, "PostInstall"))
  {
    if (-[_DASBGSystemTask hasInstallActivityRun](v15, "hasInstallActivityRun"))
    {
      v18 = (void *)qword_1001AB980;
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: postinstall activity has already run on this build", buf, 0xCu);

      }
      goto LABEL_9;
    }
    v15->_post_install = 1;
  }
  dictionary = xpc_dictionary_get_dictionary(v14, "RepeatingTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  v26 = v25;
  if (!v25 || xpc_get_type(v25) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v15->_type = 1;
    v15->_startAfter = 0.0;
    v15->_trySchedulingBefore = 0.0;
    v27 = xpc_dictionary_get_dictionary(v14, "NonRepeatingTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (!v28 || xpc_get_type(v28) != (xpc_type_t)&_xpc_type_dictionary)
      goto LABEL_46;
    v139 = (void *)_CFXPCCreateCFObjectFromXPCObject(v28);
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKey:", CFSTR("FastPassTask")));
    if (!v140)
    {
LABEL_45:
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("ScheduleAfter")));
      v15->_startAfter = (double)(int)objc_msgSend(v51, "intValue");

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("TrySchedulingBefore")));
      v15->_trySchedulingBefore = (double)(int)objc_msgSend(v52, "intValue");

LABEL_46:
      startAfter = v15->_startAfter;
      if (v15->_trySchedulingBefore < startAfter)
        v15->_trySchedulingBefore = startAfter;
      v26 = v28;
      goto LABEL_49;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", CFSTR("SemanticVersion")));
    v15->_semanticVersion = (int)objc_msgSend(v29, "intValue");

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", CFSTR("ReRun")));
    v15->_reRun = objc_msgSend(v30, "BOOLValue");

    if (v9)
    {
      if (v15->_reRun)
      {
        v31 = (void *)qword_1001AB980;
        if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
          sub_1000E33D4(v31, v15);
LABEL_34:

LABEL_9:
        v22 = 0;
        goto LABEL_10;
      }
    }
    else if (v15->_reRun)
    {
LABEL_39:
      v45 = (id)qword_1001AB980;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (id)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        v47 = -[_DASBGSystemTask semanticVersion](v15, "semanticVersion");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ v%d: Allowing FastPass resubmission", buf, 0x12u);

      }
      v48 = (void *)objc_opt_class(v15);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
      objc_msgSend(v48, "resetFastPass:resetAll:", v49, 0);

LABEL_42:
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", CFSTR("ProcessingTaskIdentifiers")));
      if (objc_msgSend(v50, "count"))
        objc_storeStrong((id *)&v15->_processingTaskIdentifiers, v50);
      v15->_type = 3;

      goto LABEL_45;
    }
    v38 = (void *)objc_opt_class(v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
    LODWORD(v38) = objc_msgSend(v38, "hasFastPassRun:semanticVersion:", v39, -[_DASBGSystemTask semanticVersion](v15, "semanticVersion"));

    if ((_DWORD)v38)
    {
      v40 = (void *)qword_1001AB980;
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v15, "name"));
        v43 = -[_DASBGSystemTask semanticVersion](v15, "semanticVersion");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ v%d: FastPass activity has already run on this release", buf, 0x12u);

      }
      goto LABEL_34;
    }
    if (!v15->_reRun)
      goto LABEL_42;
    goto LABEL_39;
  }
  if (v15->_post_install)
  {
    v32 = (void *)qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
      sub_1000E34F4(v32, v15);

    goto LABEL_9;
  }
  v33 = (void *)_CFXPCCreateCFObjectFromXPCObject(v26);
  v15->_type = 2;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Interval")));
  v15->_interval = (double)(int)objc_msgSend(v34, "intValue");

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("MinDurationBetweenInstances")));
  v15->_minDurationBetweenInstances = (double)(int)objc_msgSend(v35, "intValue");

  interval = v15->_interval;
  if (interval < 300.0)
  {
    v44 = (void *)qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
      sub_1000E3464(v44, v15);

    goto LABEL_9;
  }
  minDurationBetweenInstances = v15->_minDurationBetweenInstances;
  if (minDurationBetweenInstances == 0.0 || minDurationBetweenInstances > interval)
    v15->_minDurationBetweenInstances = interval * 0.8;

LABEL_49:
  array = xpc_dictionary_get_array(v14, "FeatureCodes");
  v55 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v55 && xpc_get_type(v55) == (xpc_type_t)&_xpc_type_array)
  {
    v60 = (void *)_CFXPCCreateCFObjectFromXPCObject(v55);
    if (objc_msgSend(v60, "count"))
    {
      if (-[_DASBGSystemTask validateFeatureCodes:forToken:](v15, "validateFeatureCodes:forToken:", v60, a4))
      {
        objc_storeStrong((id *)&v15->_featureCodes, v60);

        goto LABEL_51;
      }
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
        sub_1000E3370();
    }
    else if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
    {
      sub_1000E330C();
    }

    goto LABEL_9;
  }
LABEL_51:
  if (v15->_type == 3)
  {
    featureCodes = v15->_featureCodes;
    if (!featureCodes)
    {
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
        sub_1000E2F18();
      goto LABEL_170;
    }
    if (!-[_DASBGSystemTask validateFastPassSubmissionForActivity:featureCodes:service:](v15, "validateFastPassSubmissionForActivity:featureCodes:service:", v15->_identifier, featureCodes, v142))
    {
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
        sub_1000E32A8();
      goto LABEL_170;
    }
    -[_DASBGSystemTask updateFeatureCodesForActivity:](v15, "updateFeatureCodesForActivity:", v15->_identifier);
  }
  v15->_priority = 1;
  v15->_requiresExternalPower = 1;
  string = xpc_dictionary_get_string(v14, "Priority");
  v58 = string;
  if (!string)
  {
    if (v15->_type != 3)
      goto LABEL_80;
    goto LABEL_66;
  }
  if (!strcmp(string, "Maintenance"))
    goto LABEL_80;
  if (!strcmp(v58, "Utility"))
  {
LABEL_66:
    v61 = 2;
LABEL_79:
    v15->_priority = v61;
    v15->_requiresExternalPower = 0;
    goto LABEL_80;
  }
  if (!strcmp(v58, "UserInitiated"))
  {
    v61 = 3;
    goto LABEL_79;
  }
  v59 = (id)qword_1001AB980;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    sub_1000E31B8(v15, (uint64_t)v58, v59);

LABEL_80:
  value = xpc_dictionary_get_value(v14, "RequiresExternalPower");
  v63 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (v63)
    v15->_requiresExternalPower = xpc_BOOL_get_value(v63);
  v15->_random_initial_delay = (double)xpc_dictionary_get_int64(v14, "RandomInitialDelay");
  v15->_expected_duration = (double)xpc_dictionary_get_int64(v14, "ExpectedDuration");
  v64 = xpc_dictionary_get_array(v14, "RelatedApplications");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

  if (v65 && xpc_get_type(v65) == (xpc_type_t)&_xpc_type_array)
  {
    v66 = _CFXPCCreateCFObjectFromXPCObject(v65);
    related_applications = v15->_related_applications;
    v15->_related_applications = (NSArray *)v66;

  }
  v68 = xpc_dictionary_get_array(v14, "InvolvedProcesses");
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

  if (v69 && xpc_get_type(v69) == (xpc_type_t)&_xpc_type_array)
  {
    v70 = _CFXPCCreateCFObjectFromXPCObject(v69);
    involved_processes = v15->_involved_processes;
    v15->_involved_processes = (NSArray *)v70;

  }
  v72 = xpc_dictionary_get_value(v14, "RunOnAppForeground");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v72);

  if (v55)
  {
    if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v73 = xpc_BOOL_get_value(v55);
      v74 = v73;
      if (v73)
      {
        if (!-[NSArray count](v15->_related_applications, "count"))
        {
          v125 = (void *)qword_1001AB980;
          if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
            sub_1000E3128(v125, v15);
          goto LABEL_170;
        }
        v15->_runOnAppForeground = v74;
      }
    }
  }
  v75 = xpc_dictionary_get_value(v14, "RequestsApplicationLaunch");
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);

  if (v76)
  {
    if (xpc_get_type(v76) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v77 = xpc_BOOL_get_value(v76);
      v78 = v77;
      if (v77)
      {
        if (!-[NSArray count](v15->_related_applications, "count"))
        {
          v126 = (void *)qword_1001AB980;
          if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
            sub_1000E3098(v126, v15);

          goto LABEL_9;
        }
        v15->_requestsApplicationLaunch = v78;
      }
    }
  }
  v79 = xpc_dictionary_get_value(v14, "BeforeApplicationLaunch");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v79);

  if (v55)
  {
    if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v80 = xpc_BOOL_get_value(v55);
      v81 = v80;
      if (v80)
      {
        if (-[NSArray count](v15->_related_applications, "count"))
        {
          v15->_beforeApplicationLaunch = v81;
          goto LABEL_103;
        }
        v127 = (void *)qword_1001AB980;
        if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
          sub_1000E3008(v127, v15);
LABEL_170:

        goto LABEL_9;
      }
    }
  }
LABEL_103:
  v82 = xpc_dictionary_get_value(v14, "UserRequestedBackupTask");
  v83 = (void *)objc_claimAutoreleasedReturnValue(v82);

  if (v83)
    v15->_user_requested_backup_task = xpc_BOOL_get_value(v83);
  v84 = xpc_dictionary_get_dictionary(v14, "NetworkEndpoint");
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);

  if (v85 && xpc_get_type(v85) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v86 = nw_endpoint_create_from_dictionary(v85);
    network_endpoint = v15->_network_endpoint;
    v15->_network_endpoint = (OS_nw_endpoint *)v86;

  }
  v88 = xpc_dictionary_get_dictionary(v14, "NetworkParameters");
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);

  if (v89 && xpc_get_type(v89) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v90 = nw_parameters_create_from_dictionary(v89);
    network_parameters = v15->_network_parameters;
    v15->_network_parameters = (OS_nw_parameters *)v90;

  }
  v15->_requires_buddy_complete = xpc_dictionary_get_BOOL(v14, "RequiresBuddyComplete");
  v92 = xpc_dictionary_get_string(v14, "GroupName");
  if (v92)
  {
    v93 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v92));
    group_name = v15->_group_name;
    v15->_group_name = (NSString *)v93;

  }
  if (v15->_group_name)
  {
    v95 = xpc_dictionary_get_value(v14, "GroupConcurrencyLimit");
    v96 = objc_claimAutoreleasedReturnValue(v95);

    if (v96)
      int64 = xpc_dictionary_get_int64(v14, "GroupConcurrencyLimit");
    else
      int64 = 1;
    v15->_group_concurrency_limit = int64;
    v89 = (void *)v96;
  }
  v98 = xpc_dictionary_get_string(v14, "RateLimitConfigurationName");
  if (v98)
  {
    v99 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v98));
    rateLimitConfigurationName = v15->_rateLimitConfigurationName;
    v15->_rateLimitConfigurationName = (NSString *)v99;

  }
  v15->_requires_significant_user_inactivity = xpc_dictionary_get_BOOL(v14, "RequiresSignificantUserInactivity");
  v15->_requiresUserInactivity = xpc_dictionary_get_BOOL(v14, "RequiresUserInactivity");
  v15->_power_nap = xpc_dictionary_get_BOOL(v14, "PowerNap");
  v15->_app_refresh = xpc_dictionary_get_BOOL(v14, "AppRefresh");
  v15->_prevents_device_sleep = xpc_dictionary_get_BOOL(v14, "PreventsDeviceSleep");
  v15->_resource_intensive = xpc_dictionary_get_BOOL(v14, "ResourceIntensive");
  v101 = xpc_dictionary_get_int64(v14, "Resources");
  if (v101 <= 1)
    v102 = 1;
  else
    v102 = v101;
  v15->_resources = v102;
  v15->_requires_inexpensive_network = xpc_dictionary_get_BOOL(v14, "RequiresInexpensiveNetworkConnectivity");
  v15->_requires_unconstrained_network = xpc_dictionary_get_BOOL(v14, "RequiresUnconstrainedNetworkConnectivity");
  v103 = xpc_dictionary_get_BOOL(v14, "RequiresNetworkConnectivity")
      || v15->_requires_inexpensive_network
      || v15->_requires_unconstrained_network;
  v15->_requires_network_connectivity = v103;
  v15->_expected_network_download_size_bytes = xpc_dictionary_get_int64(v14, "NetworkDownloadSize");
  v15->_expected_network_upload_size_bytes = xpc_dictionary_get_int64(v14, "NetworkUploadSize");
  v15->_may_reboot_device = xpc_dictionary_get_BOOL(v14, "MayRebootDevice");
  v104 = xpc_dictionary_get_array(v14, "ProducedResultIdentifiers");
  v105 = (void *)objc_claimAutoreleasedReturnValue(v104);

  if (v105 && xpc_get_type(v105) == (xpc_type_t)&_xpc_type_array)
  {
    v106 = (void *)_CFXPCCreateCFObjectFromXPCObject(v105);
    if (v106)
    {
      v107 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v106));
      produced_result_identifiers = v15->_produced_result_identifiers;
      v15->_produced_result_identifiers = (NSSet *)v107;

    }
  }
  v109 = xpc_dictionary_get_array(v14, "Dependencies");
  v110 = (void *)objc_claimAutoreleasedReturnValue(v109);

  if (v110 && xpc_get_type(v110) == (xpc_type_t)&_xpc_type_array)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v150 = sub_100067878;
    v151 = sub_100067888;
    v152 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100067890;
    applier[3] = &unk_10015E840;
    v111 = v15;
    v147 = a5;
    v145 = v111;
    v146 = buf;
    if (!xpc_array_apply(v110, applier))
    {

      _Block_object_dispose(buf, 8);
      goto LABEL_9;
    }
    objc_storeStrong(v111 + 41, *(id *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }
  v112 = xpc_dictionary_get_string(v14, "DiskVolume");
  if (v112)
  {
    if (!v15->_expected_network_download_size_bytes)
    {
      v118 = (id)qword_1001AB980;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        sub_1000E2F7C(v15, v118);

      goto LABEL_9;
    }
    v113 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v112));
    diskVolume = v15->_diskVolume;
    v15->_diskVolume = (NSString *)v113;

  }
  v15->_communicates_with_paired_device = xpc_dictionary_get_BOOL(v14, "CommunicatesWithPairedDevice");
  v15->_targetDevice = 0;
  v115 = xpc_dictionary_get_string(v14, "TargetDevice");
  v116 = v115;
  if (v115)
  {
    if (!strncmp(v115, "TargetDeviceDefaultPaired", 0x19uLL))
    {
      v117 = 1;
    }
    else if (!strncmp(v116, "TargetDeviceAllPaired", 0x15uLL))
    {
      v117 = 2;
    }
    else
    {
      if (strncmp(v116, "TargetDeviceRemote", 0x12uLL))
        goto LABEL_151;
      v117 = 3;
    }
    v15->_targetDevice = v117;
  }
LABEL_151:
  v119 = xpc_dictionary_get_string(v14, "RemoteDeviceIdentifier");
  if (v119)
  {
    v120 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v119));
    remoteDevice = v15->_remoteDevice;
    v15->_remoteDevice = (NSString *)v120;

  }
  v15->_requiresRemoteDeviceWake = xpc_dictionary_get_BOOL(v14, "RequiresRemoteDeviceWake");
  v122 = xpc_dictionary_get_string(v14, "RunOnMotionState");
  if (!v122)
    goto LABEL_179;
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v122));
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Stationary")) & 1) != 0)
  {
    v124 = 1;
LABEL_177:
    v15->_run_on_motion_state = v124;
    goto LABEL_178;
  }
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v124 = 2;
    goto LABEL_177;
  }
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Running")) & 1) != 0)
  {
    v124 = 3;
    goto LABEL_177;
  }
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Cycling")) & 1) != 0)
  {
    v124 = 4;
    goto LABEL_177;
  }
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("Automotive")) & 1) != 0)
  {
    v124 = 5;
    goto LABEL_177;
  }
  if ((objc_msgSend(v123, "isEqualToString:", CFSTR("AutomotiveMoving")) & 1) != 0)
  {
    v124 = 6;
    goto LABEL_177;
  }
  if (objc_msgSend(v123, "isEqualToString:", CFSTR("AutomotiveStationary")))
  {
    v124 = 7;
    goto LABEL_177;
  }
LABEL_178:

LABEL_179:
  v15->_duet_power_budgeted = xpc_dictionary_get_BOOL(v14, "PowerBudgeted");
  v15->_data_budgeted = xpc_dictionary_get_BOOL(v14, "DataBudgeted");
  v128 = xpc_dictionary_get_string(v14, "DataBudgetName");
  if (v128 && v15->_data_budgeted)
  {
    v129 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v128));
    dataBudgetName = v15->_dataBudgetName;
    v15->_dataBudgetName = (NSString *)v129;

  }
  v15->_shouldWakeDevice = xpc_dictionary_get_BOOL(v14, "ShouldWakeDevice");
  v15->_requires_protection_class = 3;
  v131 = xpc_dictionary_get_string(v14, "RequiresProtectionClass");
  if (v131 && (*v131 - 65) <= 3u)
    v15->_requires_protection_class = (*v131 - 65) + 1;
  v15->_overrideRateLimiting = xpc_dictionary_get_BOOL(v14, "OverrideRateLimiting");
  v15->_magneticInterferenceSensitivity = xpc_dictionary_get_BOOL(v14, "MagneticInterferenceSensitivity");
  v15->_mailFetch = xpc_dictionary_get_BOOL(v14, "MailFetch");
  v15->_bypassPeakPower = xpc_dictionary_get_BOOL(v14, "BypassPeakPower");
  v15->_bypassBatteryAging = xpc_dictionary_get_BOOL(v14, "BypassBatteryAging");
  v15->_backlogged = xpc_dictionary_get_BOOL(v14, "Backlogged");
  v15->_requiresMinimumBatteryLevel = xpc_dictionary_get_int64(v14, "RequiresMinimumBatteryLevel");
  v15->_blockRebootActivitiesForSU = xpc_dictionary_get_BOOL(v14, "BlockRebootActivitiesForSU");
  if (v15->_requiresMinimumBatteryLevel >= 0x65)
    v15->_requiresMinimumBatteryLevel = 0;
  v132 = xpc_dictionary_get_int64(v14, "RequiresMinimumDataBudgetPercentage");
  if (v132 <= 0x64)
    v133 = v132;
  else
    v133 = 0;
  v15->_requiresMinimumDataBudgetPercentage = v133;
  v15->_state = 0;
  if (v143)
  {
    v134 = objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "baseTime"));
    baseTime = v15->_baseTime;
    v15->_baseTime = (NSDate *)v134;

    objc_msgSend(v143, "tempDelay");
    v15->_tempDelay = v136;
    if (v15->_type == 2)
    {
      v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "dateByAddingTimeInterval:", -v15->_interval));
      if (-[NSDate compare:](v15->_baseTime, "compare:", v138) == NSOrderedAscending)
        objc_storeStrong((id *)&v15->_baseTime, v138);

    }
    v15->_state = (int64_t)objc_msgSend(v143, "state");
  }
  else
  {
    -[_DASBGSystemTask loadBaseTime](v15, "loadBaseTime");
  }
  objc_storeStrong((id *)&v15->_descriptor, a3);
  v22 = v15;

LABEL_10:
  return v22;
}

- (BOOL)validateFeatureCodes:(id)a3 forToken:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForPlist:", 2));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "stringValue", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));

        if (!v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (void)updateFeatureCodesForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *featureCodes;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  if (self->_featureCodes)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForPlist:", 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
    v8 = v7;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
        sub_1000E376C();
      goto LABEL_20;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FeatureCodes")));
    v10 = -[NSArray mutableCopy](self->_featureCodes, "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v13 = v11;
    if (v12)
    {
      v14 = v12;
      v22 = v6;
      v15 = 0;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v11);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v10, "containsObject:", v18) & 1) == 0)
          {
            objc_msgSend(v10, "addObject:", v18);
            v15 = 1;
          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);

      v6 = v22;
      if ((v15 & 1) == 0)
        goto LABEL_15;
      v19 = self->_featureCodes;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v19));
      objc_msgSend(v13, "addObjectsFromArray:", v10);
      v20 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      featureCodes = self->_featureCodes;
      self->_featureCodes = v20;

    }
LABEL_15:

LABEL_20:
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
    sub_1000E3708();
LABEL_21:

}

- (BOOL)validateFastPassSubmissionForActivity:(id)a3 featureCodes:(id)a4 service:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  BOOL v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryForPlist:", 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
  v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
      sub_1000E376C();
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Service")));
  v15 = objc_msgSend(v9, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
      sub_1000E3870();
LABEL_16:
    v23 = 0;
    goto LABEL_23;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FeatureCodes")));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v26 = v8;
    v20 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v16, "containsObject:", v22) & 1) == 0)
        {
          v24 = (void *)qword_1001AB980;
          if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_ERROR))
            sub_1000E37D0(v24, v22, (uint64_t)v7);
          v23 = 0;
          goto LABEL_20;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
        continue;
      break;
    }
    v23 = 1;
LABEL_20:
    v8 = v26;
  }
  else
  {
    v23 = 1;
  }

LABEL_23:
  return v23;
}

+ (id)taskNameWithIdentifier:(id)a3 UID:(unsigned int)a4
{
  return a3;
}

- (NSString)name
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "taskNameWithIdentifier:UID:", self->_identifier, self->_uid);
}

+ (BOOL)hasFastPassRun:(id)a3 semanticVersion:(int64_t)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  _BYTE v21[10];
  __CFString *v22;

  v19 = 0;
  v5 = a3;
  if (qword_1001AB9A0)
    goto LABEL_2;
  if (!sysctlbyname_get_data_np("kern.osrelease", &v19, &qword_1001AB9A0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
    free(v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(".")));
    if (objc_msgSend(v8, "count"))
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    else
      v6 = &stru_1001617C8;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "stringForKey:", CFSTR("ProductRelease")));
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_1001617C8;
    v15 = v14;

    v16 = qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v21 = v6;
      *(_WORD *)&v21[8] = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Product release: Current %@, Previous %@", buf, 0x16u);
    }
    v17 = objc_msgSend((id)qword_1001AB988, "integerForKey:", CFSTR("DASFastPassSemanticVersion"));
    v18 = qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (_DWORD)v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DAS FastPass Semantic Version: Current %d, Previous %d", buf, 0xEu);
    }
    if (!-[__CFString isEqualToString:](v15, "isEqualToString:", v6) || v17 != (id)1)
    {
      objc_msgSend((id)qword_1001AB988, "removeObjectForKey:", CFSTR("FastPassActivitiesRun"));
      objc_msgSend((id)qword_1001AB988, "setObject:forKey:", v6, CFSTR("ProductRelease"));
      objc_msgSend((id)qword_1001AB988, "setInteger:forKey:", 1, CFSTR("DASFastPassSemanticVersion"));
      objc_msgSend((id)qword_1001AB988, "synchronize");

      v9 = 0;
      goto LABEL_4;
    }

LABEL_2:
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "dictionaryForKey:", CFSTR("FastPassActivitiesRun")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v6, "objectForKey:", v5));

    if (!v7)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v6, "objectForKey:", v5));
    v9 = (int)objc_msgSend(v8, "intValue") == a4;
LABEL_4:

LABEL_8:
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

+ (void)markFastPassActivityDone:(id)a3 semanticVersion:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)qword_1001AB988;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForKey:", CFSTR("FastPassActivitiesRun")));
  v11 = v7;
  if (v7)
    v8 = objc_msgSend(v7, "mutableCopy");
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v9, "setValue:forKey:", v10, v6);

  objc_msgSend((id)qword_1001AB988, "setObject:forKey:", v9, CFSTR("FastPassActivitiesRun"));
  objc_msgSend((id)qword_1001AB988, "synchronize");

}

+ (BOOL)resetFastPass:(id)a3 resetAll:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "dictionaryForKey:", CFSTR("FastPassActivitiesRun")));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "mutableCopy");
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v8;
  if (v4)
  {
    objc_msgSend(v8, "removeAllObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
    objc_msgSend(v11, "resetFeatureDurations");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    objc_msgSend(v10, "resetFastPassDependencies");
    LOBYTE(v11) = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5));
    LODWORD(v11) = v12 != 0;

    if (v12)
      objc_msgSend(v9, "removeObjectForKey:", v5);
    objc_msgSend(v9, "removeObjectForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    objc_msgSend(v10, "resetFastPassDependenciesForActivity:", v5);
  }

  objc_msgSend((id)qword_1001AB988, "setObject:forKey:", v9, CFSTR("FastPassActivitiesRun"));
  objc_msgSend((id)qword_1001AB988, "synchronize");

  return (char)v11;
}

+ (id)allFastPassIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForPlist:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v8 = v7;

  return v8;
}

- (id)stateString
{
  unint64_t state;

  state = self->_state;
  if (state > 8)
    return &stru_1001617C8;
  else
    return *(&off_10015E860 + state);
}

- (id)aboutMe
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)_CFXPCCreateCFObjectFromXPCObject(self->_descriptor);
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v4)
  {
    v6 = _DASResourcesKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _DASResourcesKey));

    if (v7)
    {
      v8 = (void *)objc_opt_class(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourcesDescriptionFromBitmap:", objc_msgSend(v9, "integerValue")));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v6);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("Criteria"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("ActivityName"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZZ"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    objc_msgSend(v14, "setLocale:", v15);

    if (self->_type == 2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", self->_baseTime));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("BaseTime"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask scheduler_activity](self, "scheduler_activity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startAfter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v18));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("ScheduleAfter"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask scheduler_activity](self, "scheduler_activity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startBefore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v21));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("ScheduleBefore"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Timings"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask stateString](self, "stateString"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("State"));

  }
  return v5;
}

- (id)resourcesDescription
{
  return objc_msgSend((id)objc_opt_class(self), "resourcesDescriptionFromBitmap:", -[_DASBGSystemTask resources](self, "resources"));
}

+ (id)resourcesDescriptionFromBitmap:(int64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("CPU"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Memory"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v5, "addObject:", CFSTR("ANE"));
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v5, "addObject:", CFSTR("Disk"));
  if ((v3 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v3 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v5, "addObject:", CFSTR("GPU"));
LABEL_7:
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));

  return v6;
}

- (BOOL)hasInstallActivityRun
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v6;
  void *v7;
  void *v8;

  v8 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  if (!qword_1001AB9A8)
  {
    if (sysctlbyname_get_data_np("kern.osversion", &v8, &qword_1001AB9A8))
    {
      v4 = 1;
      goto LABEL_5;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
    free(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "stringForKey:", CFSTR("ProductBuildVersion")));
    if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
    {
      objc_msgSend((id)qword_1001AB988, "removeObjectForKey:", CFSTR("VersionSpecificActivitiesRun"));
      objc_msgSend((id)qword_1001AB988, "setObject:forKey:", v6, CFSTR("ProductBuildVersion"));
    }

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "arrayForKey:", CFSTR("VersionSpecificActivitiesRun")));
  v4 = objc_msgSend(v3, "containsObject:", v2);

LABEL_5:
  return v4;
}

- (void)markInstallActivityDone
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001AB988, "arrayForKey:", CFSTR("VersionSpecificActivitiesRun")));
  v7 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "mutableCopy");
  else
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend((id)qword_1001AB988, "setObject:forKey:", v5, CFSTR("VersionSpecificActivitiesRun"));
}

- (double)initialDelay
{
  double random_initial_delay;

  random_initial_delay = self->_random_initial_delay;
  if (random_initial_delay == 0.0)
    return 0.0;
  else
    return (double)arc4random_uniform(random_initial_delay);
}

- (void)saveActivityBaseTime:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)qword_1001AB990;
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
    objc_msgSend(v4, "setValue:forKey:", v5, v6);

  }
  objc_msgSend((id)qword_1001AB988, "setObject:forKey:", qword_1001AB990, CFSTR("ActivityBaseDates"));
}

- (id)getActivityBaseTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)qword_1001AB990;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -4838400.0));
  if (!v5 || objc_msgSend(v5, "compare:", v7) == (id)-1 || objc_msgSend(v5, "compare:", v6) == (id)1)
  {
    -[_DASBGSystemTask initialDelay](self, "initialDelay");
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:"));
    -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v8);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)loadBaseTime
{
  uint64_t v3;
  id *p_baseTime;
  NSDate *baseTime;
  NSDate *v6;
  NSDate *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self->_type == 2)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask getActivityBaseTime](self, "getActivityBaseTime"));
    baseTime = self->_baseTime;
    p_baseTime = (id *)&self->_baseTime;
    *p_baseTime = (id)v3;

    v6 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -*((double *)p_baseTime - 7)));
    if (objc_msgSend(*p_baseTime, "compare:", v6) == (id)-1)
      objc_storeStrong(p_baseTime, v6);
  }
  else
  {
    -[_DASBGSystemTask initialDelay](self, "initialDelay");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
    v6 = self->_baseTime;
    self->_baseTime = v7;
  }

}

- (void)advanceBaseTime
{
  NSDate *v3;
  NSDate *v4;
  void *v5;
  void *v6;
  NSDate *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  NSDate *startTime;
  NSDate *v14;
  NSDate *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSDate *baseTime;
  NSDate *v23;
  _BYTE v24[22];

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self->_type != 2)
  {
    objc_storeStrong((id *)&self->_baseTime, v3);
    self->_tempDelay = 0.0;
    goto LABEL_19;
  }
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_baseTime, "dateByAddingTimeInterval:", self->_interval));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", -(self->_interval + self->_interval - self->_minDurationBetweenInstances)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:", self->_interval + self->_interval));
  if (-[NSDate compare:](v4, "compare:", v5) == NSOrderedAscending)
  {
    v7 = v5;

    v12 = (void *)qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_INFO))
    {
      v9 = v12;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)v24 = 138543362;
      *(_QWORD *)&v24[4] = v10;
      v11 = "currentBaseTime is less than interval+gracePeriod ago, moving forward for %{public}@";
      goto LABEL_9;
    }
  }
  else
  {
    if ((id)-[NSDate compare:](v4, "compare:", v6) != (id)1)
    {
      v7 = v4;
      goto LABEL_11;
    }
    v7 = v6;

    v8 = (void *)qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)v24 = 138543362;
      *(_QWORD *)&v24[4] = v10;
      v11 = "currentBaseTime is greater than 2*interval from now, moving back for %{public}@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, v24, 0xCu);

    }
  }
LABEL_11:
  startTime = self->_startTime;
  if (!startTime)
    startTime = v3;
  v14 = startTime;
  v15 = v14;
  v16 = 0.0;
  if (self->_minDurationBetweenInstances != 0.0 && (id)-[NSDate compare:](v14, "compare:", v7) == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v15, "dateByAddingTimeInterval:", self->_minDurationBetweenInstances));
    objc_msgSend(v17, "timeIntervalSinceDate:", v7);
    v16 = v18;
    v19 = (void *)qword_1001AB980;
    if (os_log_type_enabled((os_log_t)qword_1001AB980, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)v24 = 134218242;
      *(_QWORD *)&v24[4] = (uint64_t)v16;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Using temporary delay of %lld seconds to account for late fire of %{public}@", v24, 0x16u);

    }
  }
  -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v7, *(_OWORD *)v24);
  baseTime = self->_baseTime;
  self->_baseTime = v7;
  v23 = v7;

  self->_tempDelay = v16;
LABEL_19:

}

- (void)resetBaseTime
{
  NSDate *v3;
  NSDate *baseTime;
  NSDate *startTime;
  NSDate *v6;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v3);
  baseTime = self->_baseTime;
  self->_baseTime = v3;
  v6 = v3;

  startTime = self->_startTime;
  self->_startTime = 0;

}

- (id)eligibleTime
{
  double tempDelay;
  NSDate *baseTime;

  if (self->_type == 2)
  {
    tempDelay = self->_tempDelay;
    if (tempDelay == 0.0)
      tempDelay = self->_minDurationBetweenInstances;
    baseTime = self->_baseTime;
  }
  else
  {
    tempDelay = self->_startAfter;
    baseTime = self->_baseTime;
  }
  return (id)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](baseTime, "dateByAddingTimeInterval:", tempDelay));
}

- (void)adjustBaseTimeByOffset:(double)a3
{
  NSDate *v4;
  NSDate *baseTime;

  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_baseTime, "dateByAddingTimeInterval:", a3));
  baseTime = self->_baseTime;
  self->_baseTime = v4;

}

- (id)deadlineTime
{
  void *v3;
  double trySchedulingBefore;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask eligibleTime](self, "eligibleTime"));
  if (self->_type == 2)
    trySchedulingBefore = self->_interval + self->_interval - self->_minDurationBetweenInstances;
  else
    trySchedulingBefore = self->_trySchedulingBefore;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_baseTime, "dateByAddingTimeInterval:", trySchedulingBefore));
  if (objc_msgSend(v5, "compare:", v3) == (id)1)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (void)markStarted:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void)markStopped:(id)a3
{
  NSDate *startTime;

  startTime = self->_startTime;
  self->_startTime = 0;

}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%p)"), v3, self));

  return v4;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (int64_t)type
{
  return self->_type;
}

- (double)interval
{
  return self->_interval;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (double)startAfter
{
  return self->_startAfter;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (double)expected_duration
{
  return self->_expected_duration;
}

- (double)random_initial_delay
{
  return self->_random_initial_delay;
}

- (double)tempDelay
{
  return self->_tempDelay;
}

- (NSDate)baseTime
{
  return self->_baseTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (_DASActivity)scheduler_activity
{
  return self->_scheduler_activity;
}

- (void)setScheduler_activity:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler_activity, a3);
}

- (unint64_t)suspensionReason
{
  return self->_suspensionReason;
}

- (void)setSuspensionReason:(unint64_t)a3
{
  self->_suspensionReason = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (NSArray)related_applications
{
  return self->_related_applications;
}

- (NSArray)involved_processes
{
  return self->_involved_processes;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (BOOL)beforeApplicationLaunch
{
  return self->_beforeApplicationLaunch;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)requires_protection_class
{
  return self->_requires_protection_class;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (BOOL)requires_significant_user_inactivity
{
  return self->_requires_significant_user_inactivity;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

- (BOOL)power_nap
{
  return self->_power_nap;
}

- (BOOL)app_refresh
{
  return self->_app_refresh;
}

- (BOOL)resource_intensive
{
  return self->_resource_intensive;
}

- (int64_t)resources
{
  return self->_resources;
}

- (BOOL)may_reboot_device
{
  return self->_may_reboot_device;
}

- (BOOL)post_install
{
  return self->_post_install;
}

- (BOOL)user_requested_backup_task
{
  return self->_user_requested_backup_task;
}

- (BOOL)requires_buddy_complete
{
  return self->_requires_buddy_complete;
}

- (BOOL)prevents_device_sleep
{
  return self->_prevents_device_sleep;
}

- (BOOL)requires_network_connectivity
{
  return self->_requires_network_connectivity;
}

- (BOOL)requires_inexpensive_network
{
  return self->_requires_inexpensive_network;
}

- (BOOL)requires_unconstrained_network
{
  return self->_requires_unconstrained_network;
}

- (int64_t)expected_network_download_size_bytes
{
  return self->_expected_network_download_size_bytes;
}

- (int64_t)expected_network_upload_size_bytes
{
  return self->_expected_network_upload_size_bytes;
}

- (OS_nw_endpoint)network_endpoint
{
  return self->_network_endpoint;
}

- (OS_nw_parameters)network_parameters
{
  return self->_network_parameters;
}

- (BOOL)communicates_with_paired_device
{
  return self->_communicates_with_paired_device;
}

- (int64_t)run_on_motion_state
{
  return self->_run_on_motion_state;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (BOOL)duet_power_budgeted
{
  return self->_duet_power_budgeted;
}

- (BOOL)data_budgeted
{
  return self->_data_budgeted;
}

- (NSString)dataBudgetName
{
  return self->_dataBudgetName;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (NSString)group_name
{
  return self->_group_name;
}

- (unint64_t)group_concurrency_limit
{
  return self->_group_concurrency_limit;
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (BOOL)magneticInterferenceSensitivity
{
  return self->_magneticInterferenceSensitivity;
}

- (void)setMagneticInterferenceSensitivity:(BOOL)a3
{
  self->_magneticInterferenceSensitivity = a3;
}

- (BOOL)mailFetch
{
  return self->_mailFetch;
}

- (void)setMailFetch:(BOOL)a3
{
  self->_mailFetch = a3;
}

- (BOOL)bypassBatteryAging
{
  return self->_bypassBatteryAging;
}

- (void)setBypassBatteryAging:(BOOL)a3
{
  self->_bypassBatteryAging = a3;
}

- (BOOL)bypassPeakPower
{
  return self->_bypassPeakPower;
}

- (void)setBypassPeakPower:(BOOL)a3
{
  self->_bypassPeakPower = a3;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (BOOL)blockRebootActivitiesForSU
{
  return self->_blockRebootActivitiesForSU;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  self->_blockRebootActivitiesForSU = a3;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  return self->_useStatisticalModelForTriggersRestart;
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  self->_useStatisticalModelForTriggersRestart = a3;
}

- (unint64_t)requiresMinimumBatteryLevel
{
  return self->_requiresMinimumBatteryLevel;
}

- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3
{
  self->_requiresMinimumBatteryLevel = a3;
}

- (unint64_t)requiresMinimumDataBudgetPercentage
{
  return self->_requiresMinimumDataBudgetPercentage;
}

- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3
{
  self->_requiresMinimumDataBudgetPercentage = a3;
}

- (OS_dispatch_source)dispatchSourceProcessExit
{
  return self->_dispatchSourceProcessExit;
}

- (void)setDispatchSourceProcessExit:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceProcessExit, a3);
}

- (NSSet)produced_result_identifiers
{
  return self->_produced_result_identifiers;
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (BOOL)reRun
{
  return self->_reRun;
}

- (void)setReRun:(BOOL)a3
{
  self->_reRun = a3;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (void)setFeatureCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_processingTaskIdentifiers, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_produced_result_identifiers, 0);
  objc_storeStrong((id *)&self->_dispatchSourceProcessExit, 0);
  objc_storeStrong((id *)&self->_group_name, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_dataBudgetName, 0);
  objc_storeStrong((id *)&self->_network_parameters, 0);
  objc_storeStrong((id *)&self->_network_endpoint, 0);
  objc_storeStrong((id *)&self->_involved_processes, 0);
  objc_storeStrong((id *)&self->_related_applications, 0);
  objc_storeStrong((id *)&self->_scheduler_activity, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_baseTime, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
