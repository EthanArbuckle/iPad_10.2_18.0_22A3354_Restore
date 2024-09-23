@implementation SUCoreEvent

- (SUCoreEvent)initWithEventDictionary:(id)a3 extendingWith:(id)a4 reportingToServer:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUCoreEvent *v11;
  uint64_t v12;
  NSMutableDictionary *allFields;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  const char *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  NSMutableDictionary *v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  NSMutableDictionary *v52;
  void *v53;
  NSMutableDictionary *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  NSMutableDictionary *v58;
  void *v59;
  __CFString *v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  NSMutableDictionary *v64;
  void *v65;
  NSMutableDictionary *v66;
  void *v67;
  NSMutableDictionary *v68;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  NSMutableDictionary *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  void *v82;
  NSMutableDictionary *v83;
  void *v84;
  void *v86;
  __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  objc_super v105;
  uint8_t v106[128];
  uint8_t buf[4];
  const __CFString *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v105.receiver = self;
  v105.super_class = (Class)SUCoreEvent;
  v11 = -[SUCoreEvent init](&v105, sel_init);
  if (!v11)
    goto LABEL_30;
  v12 = objc_opt_new();
  allFields = v11->_allFields;
  v11->_allFields = (NSMutableDictionary *)v12;

  objc_msgSend(v8, "safeStringForKey:", CFSTR("event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:", CFSTR("SUCoreEvent"), CFSTR("event"));
  v93 = v10;
  objc_msgSend(v8, "safeStringForKey:", CFSTR("UUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:", v15, CFSTR("UUID"));
  }
  v92 = v15;
  objc_storeStrong((id *)&v11->_reportedUUID, v15);
  objc_storeStrong((id *)&v11->_serverURL, a5);
  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "buildVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "splatCryptex1BuildVersion");
  v20 = objc_claimAutoreleasedReturnValue();

  v90 = (void *)v20;
  if (v20)
    v21 = (void *)v20;
  else
    v21 = v18;
  v22 = v21;
  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "splatCryptex1ProductVersionExtra");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB37E8];
  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "hasSplatOnlyUpdateInstalled"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB37E8];
  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "hasSemiSplatActive"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "releaseType");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "deviceClass");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hwModelString");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MGCopyAnswer();
  v95 = (void *)MGCopyAnswer();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "oslog");
  v34 = objc_claimAutoreleasedReturnValue();

  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = v30;
      v36 = "non-nil currentOSType found with value of: %{public}@";
LABEL_14:
      _os_log_impl(&dword_1B05B8000, v34, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    }
  }
  else
  {
    v30 = CFSTR("user");
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = CFSTR("user");
      v36 = "nil currentOSType found, setting the currentOSType to: %{public}@";
      goto LABEL_14;
    }
  }

  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SUCore-%@"), CFSTR("2.1.0"));
  -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:");
  -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:", CFSTR("1.2"), CFSTR("reportVersion"));
  v37 = v11->_allFields;
  _currentTimeInMilliseconds();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _ensureNSString(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v37, "setSafeObject:forKey:", v39, CFSTR("eventTime"));

  v40 = v11->_allFields;
  v87 = v30;
  _ensureNSString(v30);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v40, "setSafeObject:forKey:", v41, CFSTR("currentOSType"));

  v42 = v11->_allFields;
  v89 = v22;
  _ensureNSString(v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v42, "setSafeObject:forKey:", v43, CFSTR("currentOSVersion"));

  v44 = v11->_allFields;
  v91 = v18;
  _ensureNSString(v18);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v44, "setSafeObject:forKey:", v45, CFSTR("currentBaseOSVersion"));

  v46 = v11->_allFields;
  _ensureNSString(v100);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v46, "setSafeObject:forKey:", v47, CFSTR("currentProductVersionExtra"));

  v48 = v11->_allFields;
  _ensureNSNumber(v99);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v48, "setSafeObject:forKey:", v49, CFSTR("rapidSecurityResponseInstalled"));

  v50 = v11->_allFields;
  v88 = v28;
  _ensureNSNumber(v28);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v50, "setSafeObject:forKey:", v51, CFSTR("rapidSecurityResponseSemiSplat"));

  v52 = v11->_allFields;
  _ensureNSString(v98);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v52, "setSafeObject:forKey:", v53, CFSTR("deviceClass"));

  v54 = v11->_allFields;
  _ensureNSString(v97);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v54, "setSafeObject:forKey:", v55, CFSTR("deviceModel"));

  v56 = v11->_allFields;
  _ensureNSNumber(v96);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v56, "setSafeObject:forKey:", v57, CFSTR("batteryLevel"));

  v58 = v11->_allFields;
  _ensureNSNumber(v95);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v58, "setSafeObject:forKey:", v59, CFSTR("batteryIsCharging"));

  if (objc_msgSend((id)objc_opt_class(), "isSharediPad"))
    v60 = CFSTR("true");
  else
    v60 = CFSTR("false");
  v61 = v11->_allFields;
  _ensureNSString(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v61, "setSafeObject:forKey:", v62, CFSTR("sharediPad"));

  v63 = (void *)MGCopyAnswer();
  v64 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x1E0DE2CC0], v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v64, "setSafeObject:forKey:", v65, CFSTR("storageCapacity"));

  v66 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x1E0DE2CD0], v63);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v66, "setSafeObject:forKey:", v67, CFSTR("systemFsCapacity"));

  v68 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x1E0DE2CC8], v63);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v68, "setSafeObject:forKey:", v69, CFSTR("systemFsFree"));

  v70 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x1E0DE2CB8], v63);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v70, "setSafeObject:forKey:", v71, CFSTR("dataFsCapacity"));

  v72 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x1E0DE2CB0], v63);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v72, "setSafeObject:forKey:", v73, CFSTR("dataFsFree"));

  objc_msgSend(v8, "safeStringForKey:", CFSTR("result"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v74)
    -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:", CFSTR("success"), CFSTR("result"));
  v94 = v8;
  -[NSMutableDictionary addEntriesFromDictionary:](v11->_allFields, "addEntriesFromDictionary:", v8);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v75 = v9;
  v76 = v9;
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v102 != v79)
          objc_enumerationMutation(v76);
        v81 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v11->_allFields, "objectForKey:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v82)
        {
          v83 = v11->_allFields;
          objc_msgSend(v76, "objectForKey:", v81);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setSafeObject:forKey:](v83, "setSafeObject:forKey:", v84, v81);

        }
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    }
    while (v78);
  }

  v11->_changedSinceReported = 0;
  v9 = v75;
  v10 = v93;
  v8 = v94;
LABEL_30:

  return v11;
}

- (BOOL)isSuccess
{
  void *v2;
  void *v3;
  char v4;

  -[SUCoreEvent allFields](self, "allFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("success"));
  else
    v4 = 1;

  return v4;
}

- (BOOL)isEqualErrorEvent:(id)a3
{
  SUCoreEvent *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (SUCoreEvent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[SUCoreEvent isSuccess](self, "isSuccess") || -[SUCoreEvent isSuccess](v4, "isSuccess"))
  {
    v5 = 0;
  }
  else
  {
    -[SUCoreEvent serverURL](self, "serverURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEvent serverURL](v4, "serverURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v7, v9))
    {
      -[SUCoreEvent allFields](self, "allFields");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "safeStringForKey:", CFSTR("event"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreEvent allFields](v4, "allFields");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "safeStringForKey:", CFSTR("event"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v10, v11))
      {
        v23 = v10;
        -[SUCoreEvent reportedUUID](self, "reportedUUID");
        v12 = objc_claimAutoreleasedReturnValue();
        -[SUCoreEvent reportedUUID](v4, "reportedUUID");
        v13 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v12;
        v14 = v12;
        v15 = (void *)v13;
        if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v14, v13))
        {
          -[SUCoreEvent allFields](self, "allFields");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "safeStringForKey:", CFSTR("result"));
          v16 = objc_claimAutoreleasedReturnValue();
          -[SUCoreEvent allFields](v4, "allFields");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "safeStringForKey:", CFSTR("result"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)v16;
          v5 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v16, v17);

        }
        else
        {
          v5 = 0;
        }

        v10 = v23;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)incrementErrorCount
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B05B8000, log, OS_LOG_TYPE_ERROR, "incrementErrorCount when event does not represent an error (no result)", v1, 2u);
}

- (id)getAugmentedEvent
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[SUCoreEvent allFields](self, "allFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  return v5;
}

+ (BOOL)isSharediPad
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int16 v14;
  uint8_t v15[2];
  uint8_t v16[16];
  uint8_t buf[16];

  if (!objc_opt_class())
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v9 = "[EVENT_REPORTER] UMUserManager class does not exist.";
      v10 = (uint8_t *)&v14;
LABEL_12:
      _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_13:

    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v9 = "[EVENT_REPORTER] UMUserManager class does not respond to selector 'sharedManager'";
      v10 = v15;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = (void *)MEMORY[0x1B5E09230]();
  objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UMUserManager instance does not respond to selector 'isSharedIPad'", v16, 2u);
    }

    goto LABEL_17;
  }
  if (!objc_msgSend(v3, "isSharedIPad"))
  {
LABEL_17:

    objc_autoreleasePoolPop(v2);
    return 0;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B05B8000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] Detected shared iPad", buf, 2u);
  }

  objc_autoreleasePoolPop(v2);
  return 1;
}

- (NSMutableDictionary)allFields
{
  return self->_allFields;
}

- (void)setAllFields:(id)a3
{
  objc_storeStrong((id *)&self->_allFields, a3);
}

- (BOOL)changedSinceReported
{
  return self->_changedSinceReported;
}

- (void)setChangedSinceReported:(BOOL)a3
{
  self->_changedSinceReported = a3;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverURL, a3);
}

- (NSString)reportedUUID
{
  return self->_reportedUUID;
}

- (void)setReportedUUID:(id)a3
{
  objc_storeStrong((id *)&self->_reportedUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedUUID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_allFields, 0);
}

@end
