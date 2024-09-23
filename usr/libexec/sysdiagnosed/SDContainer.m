@implementation SDContainer

- (SDContainer)init
{
  return -[SDContainer initWithName:andDestination:withDelegate:](self, "initWithName:andDestination:withDelegate:", CFSTR("none"), CFSTR("none"), 0);
}

- (SDContainer)initWithName:(id)a3 andDestination:(id)a4 withDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SDContainer *v11;
  SDContainer *v12;
  uint64_t v13;
  NSMutableArray *units;
  os_activity_t v15;
  OS_os_activity *executionActivity;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SDContainer;
  v11 = -[SDContainer init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    -[SDContainer setName:](v11, "setName:", v8);
    objc_storeStrong((id *)&v12->_destination, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    units = v12->_units;
    v12->_units = (NSMutableArray *)v13;

    objc_storeWeak((id *)&v12->_runtimeFlagDelegate, v10);
    v15 = _os_activity_create((void *)&_mh_execute_header, "Container activity", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    executionActivity = v12->_executionActivity;
    v12->_executionActivity = (OS_os_activity *)v15;

  }
  return v12;
}

- (BOOL)addSDUnits:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return 1;
}

- (BOOL)execute
{
  __assert_rtn("-[SDContainer execute]", "SDContainer.m", 38, "0 && \"Must use a concrete subclass.\");
}

- (BOOL)executeFromCallback
{
  __assert_rtn("-[SDContainer executeFromCallback]", "SDContainer.m", 43, "0 && \"Must use a concrete subclass.\");
}

- (BOOL)evaluateCollectionFlags
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;

  v3 = -[SDContainer evaluateCollectionFlagsWithOverlay:withName:](self, "evaluateCollectionFlagsWithOverlay:withName:", -[SDContainer runtimeChecks](self, "runtimeChecks"), 0);
  if (v3)
  {
    v4 = sub_100026C34();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing container: %@...", buf, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "), "com.apple.sysdiagnose", "containers");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    objc_msgSend(v8, "stdoutWrite:", CFSTR("Executing container: %@..."), v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    objc_msgSend(v10, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Executing container: %@..."), v11);

  }
  return v3;
}

- (BOOL)evaluateCollectionFlagsWithOverlay:(unint64_t)a3 withName:(id)a4
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;

  v58 = a4;
  v57 = -[SDContainer runtimeChecks](self, "runtimeChecks") | a3;
  v6 = sub_100045E60();
  v7 = sub_1000235A8();
  v8 = 2;
  if (!v7)
    v8 = 0;
  v9 = v8 | v6;
  if (sub_10002360C())
    v10 = 4;
  else
    v10 = 0;
  v11 = sub_1000236A8();
  v12 = 4096;
  if (!v11)
    v12 = 0;
  v13 = v9 | v10 | v12;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  if (objc_msgSend(v56, "shouldRunLogCopyTasks"))
    v14 = 8;
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v16 = objc_msgSend(v15, "shouldRunLogGenerationTasks");
  v17 = 16;
  if (!v16)
    v17 = 0;
  v18 = v13 | v14 | v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  if (objc_msgSend(v19, "shouldRunTimeSensitiveTasks"))
    v20 = 32;
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v22 = objc_msgSend(v21, "shouldRunOSLogArchive");
  v23 = 64;
  if (!v22)
    v23 = 0;
  v24 = v20 | v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v26 = objc_msgSend(v25, "shouldRunIDSDump");
  v27 = 128;
  if (!v26)
    v27 = 0;
  v28 = v18 | v24 | v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  if (objc_msgSend(v29, "shouldPostProcess"))
    v30 = 256;
  else
    v30 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v32 = objc_msgSend(v31, "shouldGetFeedbackData");
  v33 = 1024;
  if (!v32)
    v33 = 0;
  v34 = v30 | v33;
  v35 = sub_10002349C();
  v36 = 0x2000;
  if (!v35)
    v36 = 0;
  v37 = v34 | v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v39 = objc_msgSend(v38, "isTestingMode");
  v40 = 0x4000;
  if (!v39)
    v40 = 0;
  v41 = v28 | v37 | v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "providedPIDorProcess"));
  v44 = v41 | ((unint64_t)(v43 != 0) << 9);

  v45 = v44;
  v46 = v57 & ~v44;
  if (v46)
  {
    v47 = sub_100026C34();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v58)
    {
      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
        *(_DWORD *)buf = 138413058;
        v60 = v50;
        v61 = 2112;
        v62 = (unint64_t)v58;
        v63 = 2048;
        v64 = v57;
        v65 = 2048;
        v66 = v45;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ (%@): Req - %04llX State - %04llX. Conditions did not pass.", buf, 0x2Au);

      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      objc_msgSend(v51, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ (%@): Req - %04llX State - %04llX. Conditions did not pass."), v52, v58, v57, v45);
    }
    else
    {
      if (v49)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
        *(_DWORD *)buf = 138412802;
        v60 = v53;
        v61 = 2048;
        v62 = v57;
        v63 = 2048;
        v64 = v45;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ : Req - %04llX State - %04llX. Conditions did not pass.", buf, 0x20u);

      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      objc_msgSend(v51, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ : Req - %04llX State - %04llX. Conditions did not pass."), v52, v57, v45, v55);
    }

  }
  return v46 == 0;
}

- (void)applyContainerOverride:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[SDContainer applyContainerOverride:]", "SDContainer.m", 92, "0 && \"Must use a concrete subclass\");
}

- (void)updateContainerWithOverride
{
  uint64_t v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;

  v3 = objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "capOverride"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "capOverride"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

      if (v10)
        goto LABEL_6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "capOverride"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" task"), &stru_10009DC10));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v14));

      if (v10)
        goto LABEL_6;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "capOverride"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" collection"), &stru_10009DC10));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v18));

      if (v10)
      {
LABEL_6:
        if ((-[SDContainer runtimeChecks](self, "runtimeChecks") & 0x800) != 0)
        {
          v20 = sub_100026C34();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412290;
            v40 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ : ENABLED", buf, 0xCu);

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v23, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
            "com.apple.sysdiagnose",
            "containers");

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          objc_msgSend(v24, "stdoutWrite:", CFSTR("%@ : ENABLED"), v25);

          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          objc_msgSend(v26, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ : ENABLED"), v27);

          -[SDContainer setRuntimeChecks:](self, "setRuntimeChecks:", -[SDContainer runtimeChecks](self, "runtimeChecks") ^ 0x800);
        }
        v28 = objc_opt_class(NSString, v19);
        if ((objc_opt_isKindOfClass(v10, v28) & 1) != 0
          && !objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("disable")))
        {
          -[SDContainer setRuntimeChecks:](self, "setRuntimeChecks:", 2048);
          v31 = sub_100026C34();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412290;
            v40 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@ : DISABLED", buf, 0xCu);

          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v34, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
            "com.apple.sysdiagnose",
            "containers");

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          objc_msgSend(v35, "stdoutWrite:", CFSTR("%@ : DISABLED"), v36);

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          objc_msgSend(v37, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ : DISABLED"), v38);

        }
        else
        {
          v30 = objc_opt_class(NSDictionary, v29);
          if ((objc_opt_isKindOfClass(v10, v30) & 1) != 0)
            -[SDContainer applyContainerOverride:](self, "applyContainerOverride:", v10);
        }
      }

    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSMutableArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (unint64_t)runtimeChecks
{
  return self->_runtimeChecks;
}

- (void)setRuntimeChecks:(unint64_t)a3
{
  self->_runtimeChecks = a3;
}

- (SDRuntimeFlagDelegate)runtimeFlagDelegate
{
  return (SDRuntimeFlagDelegate *)objc_loadWeakRetained((id *)&self->_runtimeFlagDelegate);
}

- (void)setRuntimeFlagDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_runtimeFlagDelegate, a3);
}

- (OS_os_activity)executionActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExecutionActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionActivity, 0);
  objc_destroyWeak((id *)&self->_runtimeFlagDelegate);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
