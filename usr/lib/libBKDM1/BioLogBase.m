@implementation BioLogBase

+ (void)updateLogger:(id *)a3 withServerObject:(id)a4 identities:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  const char *v37;
  id v38;

  v38 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberForKey:", CFSTR("debugLogOSLogDisabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
  else
    v11 = isInternalBuild();
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "BOOLForKey:", CFSTR("debugLogCompactDisabled")) & 1) != 0)
  {

  }
  else
  {
    v13 = isInternalBuild();

    if (v13)
      v11 |= 2u;
  }
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("debugLogEnabled"));

  if (v15)
    v16 = v11 | 4;
  else
    v16 = v11;
  if ((_DWORD)v16)
  {
    objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerDefaults:", &unk_251CB3CD0);

    objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringForKey:", CFSTR("debugLogPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "enableSensorStatusMessages:withServerObject:", 1, v38);
    v20 = *a3;
    if (*a3)
    {
      v21 = *((unsigned __int8 *)v20 + 137);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v20[2], 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v19, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (v21 != (_DWORD)v16 || (v24 & 1) == 0)
      {
        objc_msgSend(*a3, "uninitializeEventSystem");
        if (v21 == (_DWORD)v16)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@"), "Relocated", ": ", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = "Off";
          if ((v16 & 4) == 0)
            v31 = "On";
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%s%s"), "Mode changed", ": ", "COMPACT", ": ", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v32;
          if ((v24 & 1) == 0)
          {
            objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("%s%@"), ": ", v19);
            v33 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v33;
          }
        }
        v34 = (id)objc_msgSend(*a3, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), v25, 0, 0, 0, 0);
        objc_msgSend(*a3, "closeLogFile");
        v35 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initToPath:withServerObject:identities:mode:", v19, v38, v8, v16);
        v36 = *a3;
        *a3 = v35;

        if (v21 != (_DWORD)v16)
        {
          if (*((_BYTE *)*a3 + 170))
            v37 = "COMPACT";
          else
            v37 = "FULL";
          NSLog(CFSTR("BioLog: Notice: Logging changed: %s"), v37);
        }

      }
    }
    else
    {
      v28 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initToPath:withServerObject:identities:mode:", v19, v38, v8, v16);
      v29 = *a3;
      *a3 = v28;

      if (*a3)
      {
        if (*((_BYTE *)*a3 + 170))
          v30 = "COMPACT";
        else
          v30 = "FULL";
        NSLog(CFSTR("BioLog: Notice: Logging enabled: %s"), v30);
      }
    }

  }
  else if (*a3)
  {
    objc_msgSend(*a3, "uninitializeEventSystem");
    v26 = (id)objc_msgSend(*a3, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), CFSTR("Logging OFF"), 0, 0, 0, 0);
    objc_msgSend(*a3, "closeLogFile");
    v27 = *a3;
    *a3 = 0;

    objc_msgSend(a1, "enableSensorStatusMessages:withServerObject:", 0, v38);
    NSLog(CFSTR("BioLog: Notice: Logging disabled."));
  }

}

+ (void)enableSensorStatusMessages:(BOOL)a3 withServerObject:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  objc_msgSend(v5, "numberWithInt:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIORegistryProperty:toValue:onService:", CFSTR("reportStatusMessages"), v7, CFSTR("AppleBiometricSensor"));

}

- (id)logNameFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = logNameFromDate__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&logNameFromDate__onceToken, &__block_literal_global_0);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "timeIntervalSince1970");
  v7 = (uint64_t)v6;
  objc_msgSend((id)logNameFromDate__logNameFormatter, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%s%ld_%@%s"), "BL_", v7, v8, ");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __30__BioLogBase_logNameFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)logNameFromDate__logNameFormatter;
  logNameFromDate__logNameFormatter = (uint64_t)v0;

  return objc_msgSend((id)logNameFromDate__logNameFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd_HH_mm_ss"));
}

- (void)compactLog
{
  DIR *v3;
  DIR *v4;
  dirent *i;
  const char *d_name;
  NSString *rootPath;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  char v16;

  v3 = opendir(-[NSString cStringUsingEncoding:](self->_rootPath, "cStringUsingEncoding:", 1));
  if (v3)
  {
    v4 = v3;
    for (i = readdir(v3); i; i = readdir(v4))
    {
      if (i->d_type == 4)
      {
        d_name = i->d_name;
        if (strcmp(i->d_name, "."))
        {
          if (strcmp(d_name, ".."))
          {
            rootPath = self->_rootPath;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", d_name);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString stringByAppendingPathComponent:](rootPath, "stringByAppendingPathComponent:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "fileModificationDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeIntervalSinceNow");
            v14 = v13;

            if (v14 < -604800.0)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "removeItemAtPath:error:", v9, 0);

              if ((v16 & 1) == 0)
                NSLog(CFSTR("BioLog: Warning: Could not remove old log records!"));
            }

          }
        }
      }
    }
    closedir(v4);
  }
}

- (BOOL)createNewLog
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *logDetails;
  void *v9;
  char v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  NSFileHandle *v24;
  NSFileHandle *v25;
  NSFileHandle *logFile;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSFileHandle *v32;
  void *v33;
  _QWORD block[5];

  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x24BD27898]();
  if (self->_compact && !self->_compactOSLogOnly)
  {
    -[BioLogBase logQueue](self, "logQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__BioLogBase_createNewLog__block_invoke;
    block[3] = &unk_251CA06E0;
    block[4] = self;
    dispatch_async(v5, block);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_compactOSLogOnly)
  {
    v33 = v4;
    v12 = self->_rootPath;
    -[BioLogBase logNameFromDate:](self, "logNameFromDate:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("/%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@%s"), v14, v13, ".log");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v14);

    if ((v17 & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, self->_fileAttributes, 0), v18, (v19 & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "fileExistsAtPath:", v15);

      if ((v21 & 1) != 0)
      {
        v10 = v17 ^ 1;
LABEL_15:
        v24 = self->_logFile;
        objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v15);
        v25 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
        logFile = self->_logFile;
        self->_logFile = v25;

        if (self->_logFile)
        {
          -[NSFileHandle closeFile](v24, "closeFile");
          objc_storeStrong((id *)&self->_logPath, v14);
          objc_storeStrong((id *)&self->_logFilePath, v15);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%s"), self->_rootPath, "Current");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeItemAtPath:error:", v27, 0);

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "createSymbolicLinkAtPath:withDestinationPath:error:", v27, v13, 0);

          v30 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_logFile", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 385, 0);
          v32 = v24;
          v10 = 0;
          v27 = self->_logFile;
          self->_logFile = v32;
          v30 = 4;
        }

LABEL_18:
        v4 = v33;
        if (v30)
          goto LABEL_19;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "createFileAtPath:contents:attributes:", v15, 0, self->_fileAttributes);

      if ((v23 & 1) != 0)
      {
        v10 = 1;
        goto LABEL_15;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 378, 0);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 371, 0);
    }
    v10 = 0;
    v30 = 4;
    goto LABEL_18;
  }
LABEL_5:
  objc_storeStrong((id *)&self->_logStartDate, v6);
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  logDetails = self->_logDetails;
  self->_logDetails = v7;

  if (-[BioLogBase logLogStartSync](self, "logLogStartSync")
    && -[BiometricKitXPCServer isClassCFileAccessible](self->_server, "isClassCFileAccessible"))
  {
    -[BLTemplateList allIdentities](self->_templateList, "allIdentities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BioLogBase logUnlockedStateSyncWithIdentities:](self, "logUnlockedStateSyncWithIdentities:", v9);

    v10 = 1;
  }
  else
  {
    v10 = 1;
    v11 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), CFSTR("DeviceNotUnlockedSinceBoot"), 0, 0, 0, 1);
  }
LABEL_19:

  objc_autoreleasePoolPop(v4);
  return v10;
}

uint64_t __26__BioLogBase_createNewLog__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "compactLog");
}

- (void)logUnlockedStateSyncWithIdentities:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "userID");
        objc_msgSend(v23, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if ((v13 & 1) == 0)
        {
          if (self->_compact
            || (-[BiometricKitXPCServerMesa getSerialisedTemplatesForUser:](self->_server, "getSerialisedTemplatesForUser:", v10), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v14 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v14;
            v15 = 0;
            v16 = 1;
          }
          else
          {
            v15 = (void *)v14;
            v16 = 0;
          }
          v17 = v14;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v17, v18);

          if (v16)
          -[BiometricKitXPCServerMesa getProtectedConfigurationForUser:withClient:](self->_server, "getProtectedConfigurationForUser:withClient:", v10, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[BioLogBase logProtectedConfigurationSync:forUser:fromClient:](self, "logProtectedConfigurationSync:forUser:fromClient:", v19, v10, 0);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  -[BiometricKitXPCServerMesa getSystemProtectedConfigurationWithClient:](self->_server, "getSystemProtectedConfigurationWithClient:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BioLogBase logProtectedConfigurationSync:forUser:fromClient:](self, "logProtectedConfigurationSync:forUser:fromClient:", v20, 0xFFFFFFFFLL, 0);

  if (-[BiometricKitXPCServerMesa sensorReady](self->_server, "sensorReady")
    && -[BiometricKitXPCServerMesa getCalBlobVersion](self->_server, "getCalBlobVersion") != -1)
  {
    if (self->_compact)
    {
      -[BioLogBase logCalibrationData:withSource:](self, "logCalibrationData:withSource:", 0, 0);
    }
    else
    {
      -[BiometricKitXPCServerMesa pullCalibrationDataWithClient:](self->_server, "pullCalibrationDataWithClient:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BioLogBase logCalibrationData:withSource:](self, "logCalibrationData:withSource:", v21, 0);

    }
  }
  -[BioLogBase logTemplateLists:fromIdentities:](self, "logTemplateLists:fromIdentities:", v23, obj);

}

- (id)initToPath:(id)a3 withServerObject:(id)a4 identities:(id)a5 mode:(unsigned __int8)a6
{
  id v11;
  id v12;
  id v13;
  BioLogBase *v14;
  BioLogBase *v15;
  BLTimeBox *v16;
  BLTimeBox *timeBox;
  NSDateFormatter *v18;
  NSDateFormatter *timestampFormatter;
  NSDateFormatter *v20;
  void *v21;
  NSDateFormatter *v22;
  NSDateFormatter *fileNameFormatter;
  NSDateFormatter *v24;
  NSDateFormatter *timeZoneFormatter;
  NSDateFormatter *v26;
  NSDateFormatter *milisecondsFormatter;
  NSMutableString *imageCommentString;
  BLTemplateList *v29;
  BLTemplateList *templateList;
  BiometricKitIdentity *lastMatchedIdentity;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSDictionary *fileAttributes;
  uint64_t v37;
  uint64_t v38;
  NSDictionary *fileAttributesProtected;
  os_log_t v40;
  OS_os_log *osLog;
  NSException *lastLogWriteException;
  NSString *lastLogMessage;
  NSDate *lastStatusESDRecovery;
  NSMutableDictionary *logDetails;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[BioLogBase init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_server, a4);
    v16 = objc_alloc_init(BLTimeBox);
    timeBox = v15->_timeBox;
    v15->_timeBox = v16;

    v18 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    timestampFormatter = v15->_timestampFormatter;
    v15->_timestampFormatter = v18;

    -[NSDateFormatter setDateFormat:](v15->_timestampFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
    v20 = v15->_timestampFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v20, "setTimeZone:", v21);

    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    fileNameFormatter = v15->_fileNameFormatter;
    v15->_fileNameFormatter = v22;

    -[NSDateFormatter setDateFormat:](v15->_fileNameFormatter, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ss_SSS"));
    v24 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    timeZoneFormatter = v15->_timeZoneFormatter;
    v15->_timeZoneFormatter = v24;

    -[NSDateFormatter setDateFormat:](v15->_timeZoneFormatter, "setDateFormat:", CFSTR("z(Z)"));
    v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    milisecondsFormatter = v15->_milisecondsFormatter;
    v15->_milisecondsFormatter = v26;

    -[NSDateFormatter setDateFormat:](v15->_milisecondsFormatter, "setDateFormat:", CFSTR("SSS"));
    v15->_fingerStateCaptureCounter = 0;
    imageCommentString = v15->_imageCommentString;
    v15->_imageCommentString = 0;

    v29 = -[BLTemplateList initWithIdentities:]([BLTemplateList alloc], "initWithIdentities:", v13);
    templateList = v15->_templateList;
    v15->_templateList = v29;

    lastMatchedIdentity = v15->_lastMatchedIdentity;
    v15->_lastMatchedIdentity = 0;

    v33 = *MEMORY[0x24BDD0CF0];
    v49[0] = *MEMORY[0x24BDD0CB0];
    v32 = v49[0];
    v49[1] = v33;
    v34 = *MEMORY[0x24BDD0CF8];
    v50[0] = CFSTR("mobile");
    v50[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v35 = objc_claimAutoreleasedReturnValue();
    fileAttributes = v15->_fileAttributes;
    v15->_fileAttributes = (NSDictionary *)v35;

    v47[0] = v32;
    v47[1] = v33;
    v37 = *MEMORY[0x24BDD0CE0];
    v48[0] = CFSTR("mobile");
    v48[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v38 = objc_claimAutoreleasedReturnValue();
    fileAttributesProtected = v15->_fileAttributesProtected;
    v15->_fileAttributesProtected = (NSDictionary *)v38;

    v15->_absoluteTimeOverride = 0;
    v15->_mode = a6;
    v15->_compactOSLogOnly = (a6 & 7) == 1;
    v15->_compact = (a6 & 4) == 0;
    if ((a6 & 1) != 0)
    {
      v40 = os_log_create("com.apple.BiometricKit", "Daemon-BioLog");
      osLog = v15->_osLog;
      v15->_osLog = (OS_os_log *)v40;

      if (!v15->_osLog && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BioLogBase initToPath:withServerObject:identities:mode:].cold.1();
    }
    lastLogWriteException = v15->_lastLogWriteException;
    v15->_lastLogWriteException = 0;

    lastLogMessage = v15->_lastLogMessage;
    v15->_lastLogMessage = 0;

    v15->_lastLogMessageRepeated = 0;
    lastStatusESDRecovery = v15->_lastStatusESDRecovery;
    v15->_lastStatusESDRecovery = 0;

    objc_storeStrong((id *)&v15->_rootPath, a3);
    v15->_notificationPort = 0;
    *(_QWORD *)&v15->_mesaScanningStateNotification = 0;
    logDetails = v15->_logDetails;
    v15->_logDetails = 0;

    if (-[BioLogBase createNewLog](v15, "createNewLog"))
    {
      -[BioLogBase initializeEventSystem](v15, "initializeEventSystem");
    }
    else
    {
      NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Logging disabled!"));

      v15 = 0;
    }
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[BioLogBase uninitializeEventSystem](self, "uninitializeEventSystem");
  -[NSFileHandle closeFile](self->_logFile, "closeFile");
  v3.receiver = self;
  v3.super_class = (Class)BioLogBase;
  -[BioLogBase dealloc](&v3, sel_dealloc);
}

- (id)logQueue
{
  return 0;
}

- (void)updateIdentity:(id)a3
{
  -[BLTemplateList setIdentity:](self->_templateList, "setIdentity:", a3);
}

- (id)getLogPath
{
  return self->_logPath;
}

- (void)synchronizeLogFile
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__BioLogBase_synchronizeLogFile__block_invoke;
  block[3] = &unk_251CA06E0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[BioLogBase logQueue](self, "logQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __32__BioLogBase_synchronizeLogFile__block_invoke_2;
  v5[3] = &unk_251CA06E0;
  v5[4] = self;
  dispatch_async(v4, v5);

}

uint64_t __32__BioLogBase_synchronizeLogFile__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_synchronizeLogFile, 0);
}

uint64_t __32__BioLogBase_synchronizeLogFile__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeLogFileSync");
}

- (void)synchronizeLogFileSync
{
  NSFileHandle *logFile;
  void *v3;
  id v4;

  logFile = self->_logFile;
  v4 = 0;
  if (!-[NSFileHandle synchronizeAndReturnError:](logFile, "synchronizeAndReturnError:", &v4))
  {
    objc_msgSend(v4, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("BioLog: ERROR: Log file synchronization failed: %@"), v3);

  }
}

- (void)closeLogFile
{
  -[BioLogBase synchronizeLogFileSync](self, "synchronizeLogFileSync");
  -[NSFileHandle closeFile](self->_logFile, "closeFile");
}

- (void)checkLogEndWithAbsoluteTime:(unint64_t)a3
{
  BioLogBase *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t absoluteTimeOverride;
  void *v14;
  id v15;
  int v16;
  NSException *lastLogWriteException;
  NSException **p_lastLogWriteException;
  uint64_t v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSException *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", a3, 0);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4->_logFilePath);

  if ((v6 & 1) == 0)
  {
    p_lastLogWriteException = &v4->_lastLogWriteException;
    lastLogWriteException = v4->_lastLogWriteException;
    if (lastLogWriteException)
    {
      LOBYTE(v16) = 1;
      goto LABEL_19;
    }
LABEL_23:
    if (!-[BioLogBase createNewLog](v4, "createNewLog"))
      NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Retrying on next entry..."));
    goto LABEL_29;
  }
  if (-[BLTimeBox clockChanged](self->_timeBox, "clockChanged"))
  {
    -[NSDateFormatter timeZone](v4->_timestampFormatter, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToTimeZone:", v8)
      && (-[BLTimeBox clockOffset](self->_timeBox, "clockOffset"), fabs(v9) < 4.0))
    {
      -[BLTimeBox idleTimeAtDate:](self->_timeBox, "idleTimeAtDate:", v43);
      if (v10 <= 6.0)
      {
        v16 = 0;
        goto LABEL_16;
      }
      -[BLTimeBox synchronizeToClock](self->_timeBox, "synchronizeToClock");
      v12 = v11;
      absoluteTimeOverride = v4->_absoluteTimeOverride;
      if (!absoluteTimeOverride)
        absoluteTimeOverride = mach_absolute_time();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ~ %fs"), "Time synchronization", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v40) = 0;
      v15 = -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](v4, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", CFSTR("System"), v14, absoluteTimeOverride - 1000, 0, 0, 0, v40, 0, 0);
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setTimeZone:](v4->_timestampFormatter, "setTimeZone:", v8);
      -[NSDateFormatter setTimeZone:](v4->_timeZoneFormatter, "setTimeZone:", v8);
      v22 = (void *)MEMORY[0x24BDD17C8];
      -[NSDateFormatter stringFromDate:](v4->_timestampFormatter, "stringFromDate:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](v4->_timeZoneFormatter, "stringFromDate:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSince1970");
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%s%s%@ %@%s%d"), "Time (zone) changed", ": ", v23, v24, ": ", (int)v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateFormatter setTimeZone:](v4->_timestampFormatter, "setTimeZone:", v7);
      LOWORD(v41) = 0;
      v27 = -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](v4, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", CFSTR("LOG END"), v26, 0, 0, 0, 0, v41, 0, 0);
      -[NSDateFormatter setTimeZone:](v4->_timestampFormatter, "setTimeZone:", v8);
      -[BLTimeBox synchronizeToClock](self->_timeBox, "synchronizeToClock");
      -[BLTimeBox setIdleStartDate:](self->_timeBox, "setIdleStartDate:", 0);

      v16 = 1;
    }

LABEL_16:
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "component:fromDate:", 16, v43);
  if (v19 == objc_msgSend(v7, "component:fromDate:", 16, v4->_logStartDate)
    || (-[BLTimeBox idleTimeAtDate:](self->_timeBox, "idleTimeAtDate:", v43), v20 <= 6.0))
  {
    v16 = 0;
  }
  else
  {
    -[BLTimeBox setIdleStartDate:](self->_timeBox, "setIdleStartDate:", 0);
    LOWORD(v39) = 0;
    v21 = -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](v4, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", CFSTR("LOG END"), CFSTR("End of day"), 0, 0, 0, 0, v39, 0, 0);
    v16 = 1;
  }
LABEL_18:

  p_lastLogWriteException = &v4->_lastLogWriteException;
  lastLogWriteException = v4->_lastLogWriteException;
  if (!lastLogWriteException)
  {
    if (!v16)
      goto LABEL_26;
    goto LABEL_23;
  }
LABEL_19:
  v28 = (void *)MEMORY[0x24BDD17C8];
  -[NSException reason](lastLogWriteException, "reason");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%s%s%@"), "Logging interrupted due to error", ": ", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v4->_lastLogWriteException;
  v4->_lastLogWriteException = 0;

  LOWORD(v42) = 0;
  v32 = -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](v4, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", CFSTR("LOG END"), v30, 0, 0, 0, 0, v42, 0, 0);
  if (*p_lastLogWriteException)
    v33 = v16;
  else
    v33 = 1;

  if ((v33 & 1) != 0)
    goto LABEL_23;
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%s"), v4->_rootPath, "Current");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "fileExistsAtPath:", v34);

  if ((v36 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString lastPathComponent](v4->_logPath, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "createSymbolicLinkAtPath:withDestinationPath:error:", v34, v38, 0);

  }
LABEL_29:
  objc_sync_exit(v4);

}

- (id)log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 fromClient:(id)a6 endingWithToken:(char *)a7 osLogMsgType:(unsigned __int8)a8
{
  uint64_t v9;

  BYTE1(v9) = a8;
  LOBYTE(v9) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, a5, a6, 0, a7, v9, 0, 0);
}

- (id)log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 fromClient:(id)a6 endingWithToken:(char *)a7 osLogMsgType:(unsigned __int8)a8 source:(id)a9
{
  uint64_t v10;

  BYTE1(v10) = a8;
  LOBYTE(v10) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, a5, a6, 0, a7, v10, a9, 0);
}

- (id)log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6 endingWithToken:(char *)a7 osLogMsgType:(unsigned __int8)a8
{
  uint64_t v9;

  BYTE1(v9) = a8;
  LOBYTE(v9) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, a5, 0, a6, a7, v9, 0, 0);
}

- (id)log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6 endingWithToken:(char *)a7 osLogMsgType:(unsigned __int8)a8 source:(id)a9 sourceTimestamp:(unint64_t)a10
{
  uint64_t v11;

  BYTE1(v11) = a8;
  LOBYTE(v11) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, a5, 0, a6, a7, v11, a9, a10);
}

- (id)log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 osLogMsgType:(unsigned __int8)a6 source:(id)a7
{
  uint64_t v8;

  BYTE1(v8) = a6;
  LOBYTE(v8) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, a5, 0, 0, 0, v8, a7, 0);
}

- (id)log:(id)a3 withDetails:(id)a4 osLogMsgType:(unsigned __int8)a5 source:(id)a6 sourceTimestamp:(unint64_t)a7
{
  uint64_t v8;

  BYTE1(v8) = a5;
  LOBYTE(v8) = 1;
  return -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:](self, "_log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:", a3, a4, 0, 0, 0, 0, v8, a6, a7);
}

- (id)_log:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)absoluteTimeOverride fromClient:(id)a6 forClients:(id)a7 endingWithToken:(char *)a8 checkingLogEnd:(BOOL)a9 osLogMsgType:(unsigned __int8)a10 source:(id)a11 sourceTimestamp:(unint64_t)a12
{
  id v17;
  __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  BOOL v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  __CFString *v36;
  NSString *v37;
  NSString *lastLogMessage;
  void *v39;
  __CFString *v40;
  unint64_t lastLogMessageRepeated;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  NSObject *osLog;
  __CFString *v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  __CFString *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  __CFString *v58;
  id v59;
  void *v60;
  id v62;
  id v63;
  _QWORD block[5];
  unint64_t v65;
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = (__CFString *)a4;
  v63 = a6;
  v62 = a7;
  v59 = a11;
  if (!absoluteTimeOverride)
  {
    absoluteTimeOverride = self->_absoluteTimeOverride;
    if (!absoluteTimeOverride)
      absoluteTimeOverride = mach_absolute_time();
  }
  if (v63)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@"), "BioKit", ": ", v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v19;
  }
  if (v18 && v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%s"), v17, ": ");
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%s"), v17, "::");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!v18 && v17)
  {
    v21 = (const __CFString *)v17;
    if (v63)
      v20 = CFSTR("BioKit::");
    else
      v20 = &stru_251CA43A8;
    goto LABEL_22;
  }
  if (v17)
    v22 = 1;
  else
    v22 = v18 == 0;
  v20 = &stru_251CA43A8;
  v23 = CFSTR("::");
  if (v22)
    v23 = &stru_251CA43A8;
  v60 = (void *)v23;
  if (!v18)
  {
    v21 = &stru_251CA43A8;
LABEL_22:
    v18 = &stru_251CA43A8;
    v60 = (void *)v20;
    v20 = v21;
  }
LABEL_23:
  v58 = (__CFString *)v20;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@%@"), v20, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    +[BLHelper stringFromClientObject:](BLHelper, "stringFromClientObject:", v63);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("%s%@"), " - ", v25);

  }
  if (v62)
  {
    +[BLHelper stringFromClientObjectArray:](BLHelper, "stringFromClientObjectArray:", v62);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("%s%@"), " -> ", v26);

  }
  if (a8 && !self->_compactOSLogOnly)
    objc_msgSend(v24, "appendFormat:", CFSTR("%s"), a8);
  objc_msgSend(v24, "appendString:", CFSTR("\n"));
  if (!self->_compactOSLogOnly)
  {
    if (self->_compact && -[NSString isEqualToString:](self->_lastLogMessage, "isEqualToString:", v24))
    {
      if (self->_lastLogMessageRepeated > 4 || !a9)
        goto LABEL_38;
    }
    else if (!a9)
    {
      goto LABEL_38;
    }
    -[BioLogBase checkLogEndWithAbsoluteTime:](self, "checkLogEndWithAbsoluteTime:", absoluteTimeOverride);
  }
LABEL_38:
  v65 = 0;
  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", absoluteTimeOverride, &v65);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTimeBox setIdleStartDate:](self->_timeBox, "setIdleStartDate:", v27);
  if (a12)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(a12 / 0x3E8) / 1000.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v27);
    if (fabs(v29) >= 2.0)
    {
      v31 = 32;
    }
    else
    {
      v30 = v28;

      v65 = 1000 * (a12 % 0x3E8);
      v31 = 42;
      v27 = v30;
    }

  }
  else
  {
    v31 = 32;
  }
  v32 = (void *)MEMORY[0x24BDD17C8];
  -[NSDateFormatter stringFromDate:](self->_timestampFormatter, "stringFromDate:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%03llu%@%c: "), v33, v65 / 0x3E8, CFSTR("[-]"), v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString isEqualToString:](self->_lastLogMessage, "isEqualToString:", v24))
  {
    v37 = (NSString *)objc_msgSend(v24, "copy");
    lastLogMessage = self->_lastLogMessage;
    self->_lastLogMessage = v37;

    objc_msgSend(v24, "insertString:atIndex:", v34, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@%@"), v34, v60);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\n"), v39, 0, 0, objc_msgSend(v24, "length") - 1);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

    lastLogMessageRepeated = self->_lastLogMessageRepeated;
    if (lastLogMessageRepeated)
    {
      if (lastLogMessageRepeated >= 4 && self->_compact)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lux\n%@"), self->_lastLogMessageRepeated, v40);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v40);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (__CFString *)v42;

      self->_lastLogMessageRepeated = 0;
    }
    else
    {
      v36 = v40;
    }
LABEL_58:
    if (!v36)
      goto LABEL_81;
    goto LABEL_59;
  }
  v35 = self->_lastLogMessageRepeated;
  self->_lastLogMessageRepeated = v35 + 1;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%s"), v34, v60, ".");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v36 = CFSTR(".");
  if (v35 + 1 >= 4 && self->_compact)
  {
    if (v35 != 3)
    {
      v36 = 0;
      goto LABEL_81;
    }
    v36 = CFSTR(": ");
  }
LABEL_59:
  if (self->_osLog)
  {
    v43 = v36;
    if (a8)
    {
      if (!self->_compactOSLogOnly)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a8);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "containsString:", CFSTR("\n"));

        if (v45)
        {
          v46 = -[__CFString rangeOfString:options:range:](v43, "rangeOfString:options:range:", CFSTR("\n"), 4, 0, -[__CFString length](v43, "length") - 1);
          if (!v46 || v46 >= -[__CFString length](v43, "length"))
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "endTokenLineLocation > 0 && endTokenLineLocation < [logEntry length]", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 942, 0);
            v46 = -[__CFString length](v43, "length") - 1;
          }
          -[__CFString substringToIndex:](v43, "substringToIndex:", v46);
          v47 = objc_claimAutoreleasedReturnValue();

          v43 = (__CFString *)v47;
        }
      }
    }
    switch(a10)
    {
      case 1u:
        osLog = self->_osLog;
        if (os_log_type_enabled(osLog, OS_LOG_TYPE_DEFAULT))
        {
          v49 = objc_retainAutorelease(v43);
          v50 = osLog;
          v51 = -[__CFString UTF8String](v49, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v67 = v51;
          _os_log_impl(&dword_24B74E000, v50, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

        }
        break;
      case 2u:
        v52 = self->_osLog;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = objc_retainAutorelease(v43);
          v54 = v52;
          v55 = -[__CFString UTF8String](v53, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v67 = v55;
          _os_log_impl(&dword_24B74E000, v54, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

        }
        break;
      case 3u:
        if (os_log_type_enabled((os_log_t)self->_osLog, OS_LOG_TYPE_DEBUG))
          -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:].cold.1(v43);
        break;
      case 4u:
        if (os_log_type_enabled((os_log_t)self->_osLog, OS_LOG_TYPE_ERROR))
          -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:].cold.2(v43);
        break;
      case 5u:
        if (os_log_type_enabled((os_log_t)self->_osLog, OS_LOG_TYPE_FAULT))
          -[BioLogBase _log:withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:].cold.3(v43);
        break;
      default:
        break;
    }

  }
  if (!self->_compactOSLogOnly)
  {
    -[__CFString dataUsingEncoding:](v36, "dataUsingEncoding:", 4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileHandle writeData:](self->_logFile, "writeData:", v56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __130__BioLogBase__log_withDetails_timestamp_fromClient_forClients_endingWithToken_checkingLogEnd_osLogMsgType_source_sourceTimestamp___block_invoke;
    block[3] = &unk_251CA06E0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
LABEL_81:

  return v36;
}

uint64_t __130__BioLogBase__log_withDetails_timestamp_fromClient_forClients_endingWithToken_checkingLogEnd_osLogMsgType_source_sourceTimestamp___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_synchronizeLogFile, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_synchronizeLogFile, 0, 5.0);
}

- (BOOL)logLogStartSync
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  const __CFString *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  size_t v24;
  utsname v25;
  int v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v26 = 0x4100000001;
  v24 = 0;
  v3 = sysctl(v26, 2u, 0, &v24, 0, 0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sysctl(v26, 2u, v5, &v24, 0, 0) < 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  memset(&v25, 0, 512);
  uname(&v25);
  mach_absolute_time();
  v7 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s%s%d%s"), "PID", ": ", objc_msgSend(v8, "processIdentifier"), ": ");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendFormat:", CFSTR("%llu ns"), absoluteToNanoseconds());
  objc_msgSend(v9, "appendString:", CFSTR(": "));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_timeZoneFormatter, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v11);

  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v9, "appendFormat:", CFSTR("%s%d%s"), ": ", (int)v12, ": ");
  +[BLHelper systemVersion](BLHelper, "systemVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%s: System Version: %@ (%@)"), v25.machine, v13, v6);

  if (self->_compact)
    v14 = CFSTR("LOG START COMPACT");
  else
    v14 = CFSTR("LOG START");
  v15 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", v14, v9, 0, 0, 0, 1);
  if (isEphemeralMultiUser())
    v16 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), CFSTR("Ephemeral Multi User mode: Enabled"), 0, 0, 0, 1);
  -[BioLogBase logPowerSourceStateAsync:initial:](self, "logPowerSourceStateAsync:initial:", 0, 1);
  self->_loggingType = -[BiometricKitXPCServerMesa loggingType](self->_server, "loggingType");
  v17 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromLoggingType:](BLHelper, "stringFromLoggingType:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLHelper stringFromProvisioningState:](BLHelper, "stringFromProvisioningState:", -[BiometricKitXPCServerMesa getProvisioningStateWithClient:](self->_server, "getProvisioningStateWithClient:", 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@)"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("SEP: DataAccess"), v20, 0, 0, 0, 1);

  return 1;
}

- (void)addImageComment:(id)a3
{
  NSMutableString *imageCommentString;
  NSMutableString *v4;
  objc_class *v6;
  id v7;
  NSMutableString *v8;
  NSMutableString *v9;

  imageCommentString = self->_imageCommentString;
  if (imageCommentString)
  {
    v9 = (NSMutableString *)a3;
    -[NSMutableString appendString:](imageCommentString, "appendString:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x24BDD16A8];
    v7 = a3;
    v8 = (NSMutableString *)objc_msgSend([v6 alloc], "initWithString:", v7);

    v4 = self->_imageCommentString;
    self->_imageCommentString = v8;
  }

}

- (void)logTopology:(id *)a3
{
  const __CFString *v5;
  $231F164E076A7A800315E88C64A5A782 *v6;
  uint64_t var1;
  uint64_t var2;
  uint64_t var0;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  uint64_t i;
  id v15;
  id v16;

  if (!a3)
  {
    v11 = (void *)MEMORY[0x24BDD16A8];
    v12 = "No Data";
LABEL_13:
    objc_msgSend(v11, "stringWithUTF8String:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog: Topology"), v16, 0, 0, 0, 0);
    goto LABEL_19;
  }
  if (a3->var0 != 3060)
  {
    v11 = (void *)MEMORY[0x24BDD16A8];
    v12 = "Error";
    goto LABEL_13;
  }
  if (a3->var3 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("Image not added"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3->var4 == -1)
      v5 = CFSTR("Image added as node %u");
    else
      v5 = CFSTR("Image replaced node %u");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", v5, a3->var3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendString:", CFSTR(": "));
    v6 = &a3->var10[a3->var3];
    var1 = v6->var0.var1;
    var2 = v6->var0.var2;
    var0 = v6->var0.var0;
    if ((v6->var2 & 1) != 0)
      v10 = "^-1";
    else
      v10 = "";
    objc_msgSend(v16, "appendFormat:", CFSTR("Coordinates:  [%i,%i,%i]%s"), var1, var2, var0, v10);
    objc_msgSend(v16, "appendString:", CFSTR(": "));
    objc_msgSend(v16, "appendFormat:", CFSTR("Parent: %i"), a3->var10[a3->var3].var1);
  }
  objc_msgSend(v16, "appendString:", CFSTR("\n"));
  objc_msgSend(v16, "appendFormat:", CFSTR("Node placement: [%i,%i,%i,%i,%i,%i,["), a3->var0, a3->var1, a3->var2, a3->var3, a3->var4, a3->var9);
  for (i = 0; ; ++i)
  {
    objc_msgSend(v16, "appendFormat:", CFSTR("[%i,%i,%i,%i,%i]"), a3->var10[i].var0.var1, a3->var10[i].var0.var2, a3->var10[i].var0.var0, a3->var10[i].var1, a3->var10[i].var2);
    if (i == 299)
      break;
    objc_msgSend(v16, "appendString:", CFSTR(","));
  }
  objc_msgSend(v16, "appendFormat:", CFSTR("],%i,%i,%i,%i,%i,0x%04x]"), a3->var11, a3->var12, a3->var13, a3->var14, a3->var15, a3->var16);
  v13 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog: Topology"), v16, 0, 0, 0, 0);
LABEL_19:
  v15 = v13;

}

- (void)logTemplateGraphState:(id *)a3
{
  __int16 *p_var0;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[7];
  _QWORD v15[8];

  p_var0 = &a3->var0;
  v15[7] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v14[0] = CFSTR("wCompCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3->var0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v14[1] = CFSTR("wNodeCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v6;
    v14[2] = CFSTR("wEdgeCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[2]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v7;
    v14[3] = CFSTR("wEnrollImageCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v8;
    v14[4] = CFSTR("sLargestCompState.wArea");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[9]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v9;
    v14[5] = CFSTR("sLargestCompState.wNodeCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v10;
    v14[6] = CFSTR("sLargestCompState.wEdgeCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", p_var0[8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
    p_var0 = (__int16 *)objc_claimAutoreleasedReturnValue();

  }
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", p_var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog: TemplateGraphState"), v12, 0, 0, 0, 0);

}

- (id)stringFromTemplateByIdentity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s%s%@ %s%@%s"), "IDT*", ": ", v6, "'", v7, "'");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stringFromTemplateListForUser:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", ");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[BLTemplateList identitiesForUser:](self->_templateList, "identitiesForUser:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR("\n"));
        -[BioLogBase stringFromTemplateByIdentity:](self, "stringFromTemplateByIdentity:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)logTemplateListWithIdentity:(id)a3 listingAllIdentitiesForUser:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  v6 = objc_msgSend(v9, "userID");
  if (self->_compact)
  {
    -[BioLogBase logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:](self, "logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:", 0, v9, v4, 0);
  }
  else
  {
    if (v6)
      v7 = v6;
    else
      v7 = v4;
    -[BiometricKitXPCServerMesa getSerialisedTemplatesForUser:](self->_server, "getSerialisedTemplatesForUser:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BioLogBase logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:](self, "logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:", v8, v9, v4, 0);

  }
}

- (void)logTemplateList:(id)a3 withIdentity:(id)a4 listingAllIdentitiesForUser:(unsigned int)a5 imageMetadata:(id *)a6
{
  uint64_t v6;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BLTemplateList *templateList;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;

  v6 = *(_QWORD *)&a5;
  v36 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%s%s"), "TPL+", ": ");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v6;
  if (v9)
    v11 = objc_msgSend(v9, "userID");
  v37 = 0;
  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", mach_absolute_time(), &v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "timeIntervalSince1970");
  v15 = (uint64_t)v14;
  -[NSDateFormatter stringFromDate:](self->_milisecondsFormatter, "stringFromDate:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_fileNameFormatter, "stringFromDate:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%s%ld%s%@%s%@%s%d%s%s"), ", v15, "_", v16, "-", v17, "-", v11, ", ".tpl");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_loggingType == 3)
  {
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(".mc"));
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  if (!v36
    || self->_compact
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v20 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v20 == v36))
  {
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(" NO DATA!"));
    v21 = v18;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BioLogBase checkLogEndWithAbsoluteTime:](self, "checkLogEndWithAbsoluteTime:", mach_absolute_time());
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createFileAtPath:contents:attributes:", v22, v36, self->_fileAttributesProtected);

  }
  objc_msgSend(v35, "appendString:", v18);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_251CA43A8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[BLTemplateList countForUser:](self->_templateList, "countForUser:", v11);
  if (v9)
  {
    objc_msgSend(v9, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendFormat:", CFSTR("\n%s%s%@"), "IDT+", ": ", v26);

    objc_msgSend(v9, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v9, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendFormat:", CFSTR(" %s%@%s"), "'", v28, "'");

    }
    else
    {
      objc_msgSend(v23, "appendFormat:", CFSTR(" %s"), "'New Finger'");
    }
    -[BLTemplateList templateNameForIdentity:](self->_templateList, "templateNameForIdentity:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[BLTemplateList setIdentity:](self->_templateList, "setIdentity:", v9);
    if (objc_msgSend(v9, "userID") == v10)
    {
      if (!v29)
        ++v24;
      -[BLTemplateList removeIdentity:](self->_templateList, "removeIdentity:", v9);
      goto LABEL_20;
    }
LABEL_22:
    v32 = v23;
    goto LABEL_24;
  }
  if (v10 == -1)
    goto LABEL_22;
LABEL_20:
  v30 = (void *)MEMORY[0x24BDD16A8];
  -[BioLogBase stringFromTemplateListForUser:](self, "stringFromTemplateListForUser:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("\n%s%s%lu%@%@"), "IDT#", ": ", v24, v23, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  templateList = self->_templateList;
  if (v9)
    -[BLTemplateList setIdentity:withTemplateName:](templateList, "setIdentity:withTemplateName:", v9, v18);
  else
    -[BLTemplateList setIdentitiesForUser:withTemplateListName:](templateList, "setIdentitiesForUser:withTemplateListName:", v11, v18);
LABEL_24:
  objc_msgSend(v35, "appendString:", v32);
  v34 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog"), v35, 0, 0, 0, 1);

}

- (id)imageFileNameWithTimestamp:(unint64_t)a3 captureCounter:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = 0;
  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", a3, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "timeIntervalSince1970");
  v10 = (uint64_t)v9;
  -[NSDateFormatter stringFromDate:](self->_milisecondsFormatter, "stringFromDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_fileNameFormatter, "stringFromDate:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s%ld%s%@%s%@%s%02d%s%016llx%s%s"), ", v10, "_", v11, "-", v12, "-", v4, "-", a3, ", ".pgm");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logTemplateUpdate:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  BLTemplateList *templateList;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 compact;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int *v37;
  char *v38;
  const __CFString *v39;
  void *v40;
  _QWORD v41[9];
  _QWORD v42[11];

  v42[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%s%s%s%s"), "Template", ": ", "Update", ": ");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") == 3202)
  {
    v6 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v7 = v6;
    v38 = (char *)v6 + 3163;
    v8 = v6 + 776;
    v9 = 0x24BDD1000uLL;
    if (v6[5] && *((_WORD *)v6 + 12) == 3080)
    {
      v37 = v6 + 776;
      v33 = (void *)MEMORY[0x24BDBCED8];
      v41[0] = CFSTR("userID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v6);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v36;
      v41[1] = CFSTR("matchS2SCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7[775]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v35;
      v41[2] = CFSTR("matchNodeIndex");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *((__int16 *)v7 + 14));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v34;
      v41[3] = CFSTR("nodeAdded");
      v10 = v7 + 9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *((__int16 *)v7 + 21));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v32;
      v41[4] = CFSTR("nodeRemoved");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *((__int16 *)v7 + 22));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42[4] = v31;
      v41[5] = CFSTR("addedToTemplate");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *((__int16 *)v7 + 23));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42[5] = v30;
      v41[6] = CFSTR("removedFromTemplate");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *((__int16 *)v7 + 24));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42[6] = v29;
      v41[7] = CFSTR("addedToTemplateUUID");
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)v7 + 50);
      objc_msgSend(v28, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42[7] = v11;
      v41[8] = CFSTR("removedFromTemplateUUID");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)v7 + 66);
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[8] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dictionaryWithDictionary:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((self->_loggingType & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v39 = CFSTR("matchingScore");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7[774]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v17);

      }
      +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v15);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v8 = v37;
      v9 = 0x24BDD1000;
    }
    else
    {
      v10 = 0;
      v18 = CFSTR("Error");
    }
    templateList = self->_templateList;
    v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 2176)), "initWithUUIDBytes:", v7 + 1);
    -[BLTemplateList identityByUUID:](templateList, "identityByUUID:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%s%@"), v23, ": ", v18);

    -[BioLogBase imageFileNameWithTimestamp:captureCounter:](self, "imageFileNameWithTimestamp:captureCounter:", *(_QWORD *)v38, *((unsigned int *)v38 + 2));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n%s%s%@"), "IMG*", ": ", v24);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("No Data"));
    v19 = 0;
    v8 = 0;
    v10 = 0;
  }
  v25 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog"), v5, 0, 0, 0, 1);
  -[BioLogBase logTopology:](self, "logTopology:", v10);
  compact = self->_compact;
  if (self->_compact)
  {
    v27 = 0;
  }
  else
  {
    -[BiometricKitXPCServerMesa getSerialisedTemplatesForUser:](self->_server, "getSerialisedTemplatesForUser:", objc_msgSend(v19, "userID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BioLogBase logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:](self, "logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:", v27, v19, objc_msgSend(v19, "userID"), v8);
  if (!compact)

}

- (void)logTemplateUpdateResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%s%s%s%s"), "Template", ": ", "Update", ": ");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") == 3214)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v7 = v6;
    v8 = v6 + 3175;
    v9 = *(unsigned int *)(v6 + 8);
    if ((_DWORD)v9)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%s%s0x%x"), "Error", ": ", v9);
    }
    else
    {
      if (*(_DWORD *)(v6 + 32))
      {
        if (*(_WORD *)(v6 + 36) == 3080)
        {
          v10 = (void *)MEMORY[0x24BDBCED8];
          v24[0] = CFSTR("matchS2SCount");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v6 + 3112));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = CFSTR("matchNodeIndex");
          v25[0] = v11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *(__int16 *)(v7 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dictionaryWithDictionary:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((self->_loggingType & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v22 = CFSTR("matchingScore");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v7 + 3108));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v15;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addEntriesFromDictionary:", v16);

          }
          +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v14);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("Error");
        }
      }
      else
      {
        v17 = CFSTR("No topology");
      }
      objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v17);

    }
    -[BioLogBase imageFileNameWithTimestamp:captureCounter:](self, "imageFileNameWithTimestamp:captureCounter:", *(_QWORD *)v8, *(unsigned int *)(v8 + 8));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n%s%s%@"), "IMG*", ": ", v18);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("No Data"));
    v7 = 0;
  }
  v19 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog"), v5, 0, 0, 0, 1);
  if (v7 && *(_DWORD *)(v7 + 8))
  {
    -[BioLogBase noteAssertionFailureWithResultCode:](self, "noteAssertionFailureWithResultCode:");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s0x%x"), "ASSERT", ": ", *(unsigned int *)(v7 + 8));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("SEP"), v20, 0, 0, 0, 1);

  }
}

- (void)noteAssertionFailureWithResultCode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("AssertionFailureCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_logDetails, "setObject:forKeyedSubscript:", v7, CFSTR("AssertionFailureCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_logDetails, "setObject:forKeyedSubscript:", v8, CFSTR("LastAssertionFailureCode"));

}

- (void)logStatusMessage:(int)a3 withData:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSDate *v48;
  NSDate *lastStatusESDRecovery;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BioLogBase *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  unint64_t v59;
  BioLogBase *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  _QWORD v66[6];
  _QWORD v67[6];
  _QWORD v68[7];
  _QWORD v69[7];
  _QWORD v70[5];
  _QWORD v71[7];

  v8 = *(_QWORD *)&a3;
  v71[5] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = 0;
  v13 = (v8 - 51);
  if (v13 <= 0x30)
  {
    if (((1 << (v8 - 51)) & 0x100002203C081) != 0)
    {
      v12 = "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    }
    else if (v13 == 24)
    {
      +[BLHelper stringFromStatus:](BLHelper, "stringFromStatus:", 75);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BioLogBase log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:source:sourceTimestamp:](self, "log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:source:sourceTimestamp:", CFSTR("Status"), v14, a5, v11, "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", 1, 0, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
  }
  +[BLHelper stringFromStatus:](BLHelper, "stringFromStatus:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 - 85) <= 0xD
    && ((1 << (v8 - 85)) & 0x340F) != 0
    && (unint64_t)objc_msgSend(v10, "length") >= 0xEC)
  {
    v58 = v12;
    v59 = a5;
    v60 = self;
    v61 = v14;
    v62 = v11;
    v63 = v10;
    v15 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 20; i += 4)
    {
      LODWORD(v17) = *(_DWORD *)(v15 + 44 + i);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v19);

    }
    v64 = (void *)MEMORY[0x24BDBCED8];
    v70[0] = CFSTR("Dirt");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v15 + 8));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v20;
    v70[1] = CFSTR("Fb");
    +[BLHelper stringFromIQFeedback:](BLHelper, "stringFromIQFeedback:", *(unsigned int *)(v15 + 14));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v21;
    v70[2] = CFSTR("HomeButton");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v15 + 81));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v22;
    v70[3] = CFSTR("MenuPin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v15 + 82));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v23;
    v70[4] = CFSTR("ImgDiag.eProbCl");
    +[BLHelper stringFromIQProblemClass:](BLHelper, "stringFromIQProblemClass:", *(unsigned int *)(v15 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryWithDictionary:", v25);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_DWORD *)(v15 + 83) == 1)
    {
      v68[0] = CFSTR("Asses");
      +[BLHelper stringFromIQAssessment:](BLHelper, "stringFromIQAssessment:", *(unsigned int *)(v15 + 2));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v56;
      v68[1] = CFSTR("Prp");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v15 + 18));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v55;
      v68[2] = CFSTR("ImgDiag.fCont");
      LODWORD(v26) = *(_DWORD *)(v15 + 24);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v27;
      v68[3] = CFSTR("ImgDiag.fBright");
      LODWORD(v28) = *(_DWORD *)(v15 + 28);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v69[3] = v29;
      v68[4] = CFSTR("ImgDiag.fFStrength");
      LODWORD(v30) = *(_DWORD *)(v15 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v69[4] = v31;
      v68[5] = CFSTR("ImgDiag.uiNumPxOutliers");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v15 + 36));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v69[5] = v32;
      v68[6] = CFSTR("ImgDiag.fClFeat");
      +[BLHelper stringFromArray:](BLHelper, "stringFromArray:", v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v69[6] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addEntriesFromDictionary:", v34);

      if (*(_DWORD *)(v15 + 133) >= 0x63u && *(_DWORD *)(v15 + 192) >= 7u)
      {
        v66[0] = CFSTR("ImgDiag.CrkRes");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v15 + 208));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v57;
        v66[1] = CFSTR("ImgDiag.CrkSc");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v15 + 204));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v35;
        v66[2] = CFSTR("ImgDiag.fL1");
        LODWORD(v36) = *(_DWORD *)(v15 + 212);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v67[2] = v37;
        v66[3] = CFSTR("ImgDiag.fLineerr");
        LODWORD(v38) = *(_DWORD *)(v15 + 224);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v67[3] = v39;
        v66[4] = CFSTR("ImgDiag.px");
        LODWORD(v40) = *(_DWORD *)(v15 + 228);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v67[4] = v41;
        v66[5] = CFSTR("ImgDiag.py");
        LODWORD(v42) = *(_DWORD *)(v15 + 232);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v67[5] = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 6);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addEntriesFromDictionary:", v44);

      }
    }
    +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v65);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stringByAppendingFormat:", CFSTR("\n%@"), v45);
    v46 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v46;
    v11 = v62;
    v10 = v63;
    a5 = v59;
    self = v60;
    v12 = v58;
  }
  -[BioLogBase log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:source:sourceTimestamp:](self, "log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:source:sourceTimestamp:", CFSTR("Status"), v14, a5, v11, v12, 1, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v8 <= 83)
  {
    switch((_DWORD)v8)
    {
      case '9':
        self->_absoluteTimeOverride = a5;
        -[BioLogBase logTemplateUpdateResult:](self, "logTemplateUpdateResult:", v10);
        break;
      case '?':
        self->_fingerStateCaptureCounter = 0;
        goto LABEL_38;
      case 'I':
        self->_absoluteTimeOverride = a5;
        -[BioLogBase logTemplateUpdate:](self, "logTemplateUpdate:", v10);
        break;
      default:
        goto LABEL_33;
    }
LABEL_31:
    self->_absoluteTimeOverride = 0;
    goto LABEL_38;
  }
  if ((int)v8 > 94)
  {
    if ((_DWORD)v8 == 95 || (_DWORD)v8 == 97)
    {
      -[BioLogBase addImageComment:](self, "addImageComment:", v47);
      goto LABEL_38;
    }
  }
  else
  {
    if ((_DWORD)v8 == 84)
    {
      -[BLTimeBox date](self->_timeBox, "date");
      v48 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastStatusESDRecovery = self->_lastStatusESDRecovery;
      self->_lastStatusESDRecovery = v48;

      goto LABEL_38;
    }
    if ((_DWORD)v8 == 94)
    {
      if (self->_compact)
      {
        -[BioLogBase logCalibrationData:withSource:](self, "logCalibrationData:withSource:", 0, 0);
      }
      else
      {
        -[BiometricKitXPCServerMesa pullCalibrationDataWithClient:](self->_server, "pullCalibrationDataWithClient:", 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[BioLogBase logCalibrationData:withSource:](self, "logCalibrationData:withSource:", v54, 0);

      }
      goto LABEL_38;
    }
  }
LABEL_33:
  if ((v8 - 100) <= 0xFF)
  {
    -[BioLogBase addImageComment:](self, "addImageComment:", v47);
    if (objc_msgSend(v10, "length") == 3224)
    {
      v50 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
      v51 = v50;
      self->_absoluteTimeOverride = a5;
      if (*(_DWORD *)(v50 + 6))
      {
        v52 = v50 + 10;
        v53 = self;
      }
      else
      {
        v53 = self;
        v52 = 0;
      }
      -[BioLogBase logTopology:](v53, "logTopology:", v52);
      -[BioLogBase logTemplateGraphState:](self, "logTemplateGraphState:", v51 + 3192);
      goto LABEL_31;
    }
  }
LABEL_38:

}

- (void)logCalibrationData:(id)a3 withSource:(id)a4
{
  id v6;
  void *v7;
  NSDateFormatter *fileNameFormatter;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  fileNameFormatter = self->_fileNameFormatter;
  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", mach_absolute_time(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](fileNameFormatter, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s%@%s%s"), ", v10, "_CalibrationBLOB", ".bin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_loggingType == 3)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(".mc"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (self->_compact || !objc_msgSend(v17, "length"))
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(" NO DATA!"));
    v13 = v11;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BioLogBase checkLogEndWithAbsoluteTime:](self, "checkLogEndWithAbsoluteTime:", mach_absolute_time());
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createFileAtPath:contents:attributes:", v14, v17, self->_fileAttributes);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@"), "CLB", ": ", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:source:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:source:", CFSTR("BioLog"), v15, 0, 0, 0, 0, v6);

}

- (void)logSEPTransferData:(id)a3 withTimestamp:(unint64_t)a4 alsoBinary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSDateFormatter *fileNameFormatter;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSDateFormatter *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  BioLogBase *v54;
  unint64_t v55;
  id v56;
  void *v57;
  unint64_t v58;
  id v59;
  _QWORD v60[6];
  _QWORD v61[8];

  v5 = a5;
  v61[6] = *MEMORY[0x24BDAC8D0];
  v8 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    fileNameFormatter = self->_fileNameFormatter;
    -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", a4, 0);
    v14 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](fileNameFormatter, "stringFromDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s%@%s"), "XFER_", v16, ".dmp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createFileAtPath:contents:attributes:", v19, v8, self->_fileAttributes);

    v10 = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@ (%u bytes)"), "SEPXfer", ": ", v17, objc_msgSend(v8, "length"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v20, a4, 0, 0, 3);

  }
  v54 = self;
  v55 = a4;
  v56 = v8;
  if (v10 < 0x21)
  {
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v57 = v11;
    do
    {
      if (*(_DWORD *)v9 != -559023410 || v10 < *(unsigned int *)(v9 + 12))
        break;
      v23 = v9 + 33;
      v24 = v10 - 33;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = *(_DWORD *)(v9 + 29);
      if (v27)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", (2 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0x24BDD1000uLL;
        if (*(_DWORD *)(v9 + 29))
        {
          v30 = 0;
          do
          {
            objc_msgSend(v28, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v23 + v30++));
            v31 = *(unsigned int *)(v9 + 29);
          }
          while (v30 < v31);
        }
        else
        {
          v31 = 0;
        }
        v23 += v31;
        v24 -= v31;
      }
      else
      {
        v28 = (void *)v25;
        v29 = 0x24BDD1000;
      }
      v58 = v24;
      v60[0] = CFSTR("Timestamp");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 4));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v32;
      v60[1] = CFSTR("Direction");
      v33 = "OUT";
      if (*(_BYTE *)(v9 + 16) == 1)
        v33 = "IN";
      objc_msgSend(*(id *)(v29 + 1992), "stringWithFormat:", CFSTR("%s"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v34;
      v60[2] = CFSTR("Command");
      objc_msgSend(*(id *)(v29 + 1992), "stringWithFormat:", CFSTR("0x%X"), *(unsigned int *)(v9 + 17));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2] = v35;
      v60[3] = CFSTR("Message");
      objc_msgSend(*(id *)(v29 + 1992), "stringWithFormat:", CFSTR("0x%llX"), *(_QWORD *)(v9 + 21));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v61[3] = v36;
      v60[4] = CFSTR("DataSize");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v9 + 29));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v60[5] = CFSTR("Data");
      v61[4] = v37;
      v61[5] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 6);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (v22 + 1);
      v11 = v57;
      objc_msgSend(v57, "addObject:", v38);

      v9 = v23;
      v10 = v58;
    }
    while (v58 > 0x20);
  }
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v11))
  {
    v59 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v11, 1, &v59);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v59;
    v41 = v40;
    v42 = (void *)MEMORY[0x24BDD17C8];
    if (v39)
    {
      v43 = v54->_fileNameFormatter;
      -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](v54->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", v55, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](v43, "stringFromDate:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%s%@%s"), "XFER_", v45, ".json");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v54->_logPath, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "createFileAtPath:contents:attributes:", v48, v39, v54->_fileAttributes);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@ (%u bytes)"), "SEPXfer", ": ", v46, objc_msgSend(v39, "length"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](v54, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v49, v55, 0, 0, 3);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%s%@"), "SEPXfer", ": ", "Error", ": ", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](v54, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v46, v55, 0, 0, 3);
    }
    v52 = v56;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%s Failed to write %u records"), "SEPXfer", ": ", "Error", ": ", v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](v54, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v41, v55, 0, 0, 3);
    v52 = v56;
  }

}

- (void)logCapture:(id)a3 withTimestamp:(unint64_t)a4 captureCounter:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v21 = 0;
  -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", a4, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "timeIntervalSince1970");
  v12 = (uint64_t)v11;
  -[NSDateFormatter stringFromDate:](self->_milisecondsFormatter, "stringFromDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_fileNameFormatter, "stringFromDate:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%s%ld%s%@%s%@%s%02d%s%016llx%s%s"), ", v12, "_", v13, "-", v14, "-", v5, "-", a4, ", ".bin16");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_loggingType == 3)
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".mc"));
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  if (self->_compact || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(" NO DATA!"));
    v17 = v15;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BioLogBase checkLogEndWithAbsoluteTime:](self, "checkLogEndWithAbsoluteTime:", mach_absolute_time());
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createFileAtPath:contents:attributes:", v18, v8, self->_fileAttributesProtected);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@"), "CAP", ": ", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog"), v19, a4, 0, 0, 1);

}

- (void)logImage:(id)a3 withWidth:(unsigned int)a4 height:(unsigned int)a5 timestamp:(unint64_t)a6 captureCounter:(unsigned int)a7 source:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableString *imageCommentString;
  id v21;

  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v21 = a3;
  v14 = a8;
  -[BioLogBase imageFileNameWithTimestamp:captureCounter:](self, "imageFileNameWithTimestamp:captureCounter:", a6, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_compact || !objc_msgSend(v21, "length"))
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(" NO DATA!"));
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@"), "IMG", ": ", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:source:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:source:", CFSTR("BioLog"), v17, a6, 0, 0, 1, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_compact && objc_msgSend(v21, "length"))
  {
    -[BioLogBase addImageComment:](self, "addImageComment:", v18);
    -[BioLogBase checkLogEndWithAbsoluteTime:](self, "checkLogEndWithAbsoluteTime:", mach_absolute_time());
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLHelper writeImageAsPGM:withWidth:height:toFile:withComment:attributes:](BLHelper, "writeImageAsPGM:withWidth:height:toFile:withComment:attributes:", v21, v12, v11, v19, self->_imageCommentString, self->_fileAttributesProtected);

  }
  imageCommentString = self->_imageCommentString;
  self->_imageCommentString = 0;

}

- (void)logTemplateLists:(id)a3 fromIdentities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BLTemplateList removeAll](self->_templateList, "removeAll");
  if (objc_msgSend(v7, "count"))
  {
    -[BLTemplateList setIdentities:](self->_templateList, "setIdentities:", v7);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BioLogBase logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:](self, "logTemplateList:withIdentity:listingAllIdentitiesForUser:imageMetadata:", v14, 0, objc_msgSend(v13, "unsignedIntValue"), 0);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v15 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog"), CFSTR("No identities"), 0, 0, 0, 1);
  }

}

- (void)logThermalLevel:(unsigned __int8)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%d"), "ThermalLevel", ": ", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 >= 0xC)
  {
    v9 = v5;
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(" (Trap)"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v10 = v6;
  v8 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v6, 0, 0, 0, 1);

}

- (void)logDisplayState:(BOOL)a3 withTimestamp:(unint64_t)a4
{
  const __CFString *v5;
  const char *v6;
  id v7;

  if (a3)
    v5 = CFSTR("Display: On");
  else
    v5 = CFSTR("Display: Off");
  if (a3)
    v6 = "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
  else
    v6 = "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
  v7 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v5, a4, 0, v6, 1);
}

- (void)logPowerStateSync:(BOOL)a3 withTimestamp:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const char *v9;
  void *v10;
  id v11;
  __CFString *v12;

  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[BLTimeBox machCorrectionWithCheck](self->_timeBox, "machCorrectionWithCheck");
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" ~ %.3fs"), v7);
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v9 = "On";
  }
  else
  {
    -[BLTimeBox setLastMachCorrection:](self->_timeBox, "setLastMachCorrection:", 0.0);
    v8 = &stru_251CA43A8;
    v9 = "Off";
  }
  v12 = (__CFString *)v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%@"), "Power", ": ", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v10, a4, 0, 0, 1);

}

- (void)logSaveTemplateListWithDetails:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s%s%s%s%@"), "Catacomb", ": ", "Save", ": ", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Daemon"), v7, 0, 0, 0, 1);
}

- (void)logSaveTemplateListError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Daemon"), CFSTR("Catacomb: Save"), *(_QWORD *)&a3);
}

- (void)logWakeGestureState:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromWakeGestureState:](BLHelper, "stringFromWakeGestureState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s%s%@"), "WakeGesture", ": ", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v7, 0, 0, 0, 1);
}

- (void)logCall:(SEL)a3 withParameters:(id)a4 fromClient:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v8 = a5;
  NSStringFromSelector(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("withObject:"), &stru_251CA43A8, 1, 0, objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", v10, v11, 0, v8, 0, 1);

}

- (void)logCall:(SEL)a3 withError:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("withObject:"), &stru_251CA43A8, 1, 0, objc_msgSend(v6, "length"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", v7, 0, v4);
}

- (void)logSensorStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const __CFString *v7;
  BioLogBase *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "length") == 17)
  {
    v4 = objc_retainAutorelease(v11);
    +[BLHelper stringFromSensorStatusLog:maskUnstableFields:](BLHelper, "stringFromSensorStatusLog:maskUnstableFields:", objc_msgSend(v4, "bytes"), self->_compact);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Sensor"), v5, *(_QWORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), 0, 0, 2);

  }
  else
  {
    if (objc_msgSend(v11, "length"))
    {
      v7 = CFSTR("Error");
      v8 = self;
      v9 = 1;
    }
    else
    {
      v7 = CFSTR("No Data");
      v8 = self;
      v9 = 2;
    }
    v10 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](v8, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Sensor"), v7, 0, 0, 0, v9);
  }

}

- (void)logHomeButtonState:(BOOL)a3 fromKernel:(BOOL)a4 withTimestamp:(unint64_t)a5
{
  const __CFString *v5;
  const __CFString *v6;
  id v7;

  v5 = CFSTR("System: HomeBn");
  if (a4)
    v5 = CFSTR("Kernel: HomeBn");
  if (a3)
    v6 = CFSTR("Pressed");
  else
    v6 = CFSTR("Released");
  v7 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", v5, v6, a5, 0, 0, 1);
}

- (void)logStackshotWithErrorCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *logPath;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (WriteStackshotReport())
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self like[cd] %@"), CFSTR("*stacks-*.ips"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    logPath = self->_logPath;
    objc_msgSend(v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](logPath, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16
      && (v17 = (void *)v16,
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "moveItemAtPath:toPath:error:", v12, v15, 0),
          v18,
          v17,
          v19))
    {
      objc_msgSend(v10, "firstObject");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@%s"), v22, " NO DATA!");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = CFSTR(" NO DATA!");
  }
  v23 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("BioLog: SCT"), v20, 0, 0, 0, 0);

}

- (void)logKernelMessage:(id)a3
{
  id v4;
  unsigned int *v5;
  unsigned int *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSDateFormatter *fileNameFormatter;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  const char *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  if (!objc_msgSend(v40, "length"))
  {
    v13 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), CFSTR("No Data"), 0, 0, 0, 1);
    goto LABEL_43;
  }
  v4 = objc_retainAutorelease(v40);
  v5 = (unsigned int *)objc_msgSend(v4, "bytes");
  v6 = v5;
  switch(*v5)
  {
    case 0u:
      if (v5[6] <= 0x3FF)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5 + 7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v7, "length") < 2
          || (v8 = objc_retainAutorelease(v7),
              v9 = objc_msgSend(v8, "bytes"),
              *(_BYTE *)(v9 + objc_msgSend(v8, "length") - 1))
          || (v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 1)) == 0)
        {
          v10 = &stru_251CA43A8;
        }
        else
        {
          v39 = v38;
          objc_msgSend(v38, "stringByAppendingString:", CFSTR(": "));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%@%@"), "DEBUG", ": ", v10, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v11, *(_QWORD *)(v6 + 1), 0, 0, 3);

        goto LABEL_11;
      }
      v23 = (void *)MEMORY[0x24BDD17C8];
      fileNameFormatter = self->_fileNameFormatter;
      v25 = *(_QWORD *)(v5 + 3);
      if (!v25)
        v25 = *(_QWORD *)(v5 + 1);
      -[BLTimeBox dateFromAbsoluteTime:hasNanoseconds:](self->_timeBox, "dateFromAbsoluteTime:hasNanoseconds:", v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](fileNameFormatter, "stringFromDate:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%s%@%s%s"), "DBG_", v27, ", ".dmp");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_logPath, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "createFileAtPath:contents:attributes:", v30, v4, self->_fileAttributes);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%s%@ (%u bytes)"), "DEBUG", ": ", "DBG", ": ", v28, v6[6]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v31, *(_QWORD *)(v6 + 1), 0, 0, 3);

      goto LABEL_42;
    case 1u:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5 + 7, v5[6], 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BioLogBase logCapture:withTimestamp:captureCounter:](self, "logCapture:withTimestamp:captureCounter:", v7, *(_QWORD *)(v6 + 3), v6[5]);
LABEL_11:

      goto LABEL_43;
    case 2u:
      v14 = v5[6];
      v15 = 96;
      v16 = 112;
      if (v14 <= 19711)
      {
        if (v14 != 9856)
        {
          if (v14 == 10752)
            goto LABEL_35;
          goto LABEL_34;
        }
LABEL_29:
        v15 = 56;
        v16 = 176;
        goto LABEL_35;
      }
      if (v14 == 21504)
        goto LABEL_35;
      if (v14 == 19712)
        goto LABEL_29;
LABEL_34:
      v16 = 88;
      v15 = 88;
LABEL_35:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5 + 7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[BioLogBase logImage:withWidth:height:timestamp:captureCounter:source:](self, "logImage:withWidth:height:timestamp:captureCounter:source:", v35, v16, v15, *(_QWORD *)(v6 + 3), v6[5], 0);

LABEL_43:
      return;
    case 3u:
      if (v5[6] == 8)
      {
        if (*(_QWORD *)(v5 + 7))
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          -[BLTimeBox machCorrectionWithCheck](self->_timeBox, "machCorrectionWithCheck");
          objc_msgSend(v17, "stringWithFormat:", CFSTR(" ~ %.3fs"), v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[BLTimeBox setLastMachCorrection:](self->_timeBox, "setLastMachCorrection:", 0.0);
          v19 = &stru_251CA43A8;
        }
        if (*(_QWORD *)(v6 + 7))
          v36 = "On";
        else
          v36 = "Off";
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%@"), "Power", ": ", v36, v19);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = CFSTR("Power: Unknown state data received!");
      }
      v37 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v28, *(_QWORD *)(v6 + 1), 0, 0, 1);
LABEL_42:

      goto LABEL_43;
    case 4u:
      if (v5[6] == 4)
        v20 = v5[7];
      else
        v20 = 0;
      -[BioLogBase noteAssertionFailureWithResultCode:](self, "noteAssertionFailureWithResultCode:", v20);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s0x%x"), "ASSERT", ": ", v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Kernel"), v33, *(_QWORD *)(v6 + 1), 0, 0, 1);

      if (!self->_compactOSLogOnly)
        -[BioLogBase logStackshotWithErrorCode:](self, "logStackshotWithErrorCode:", (int)v20);
      goto LABEL_43;
    case 5u:
      v21 = *(_QWORD *)(v5 + 3);
      if (!v21)
        v21 = *(_QWORD *)(v5 + 1);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5 + 7, v5[6], 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BioLogBase logSEPTransferData:withTimestamp:alsoBinary:](self, "logSEPTransferData:withTimestamp:alsoBinary:", v22, v21, 1);

      goto LABEL_43;
    default:
      NSLog(CFSTR("BioLog: Warning: Unknown kernel message (%d) received! (Length: %u)"), *v5, v5[6]);
      goto LABEL_43;
  }
}

- (void)logSensorRecoveryReason:(unsigned int)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromResetReason:](BLHelper, "stringFromResetReason:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("0x%02x%s%@"), v5, ": ", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Recovery"), v9, a4, 0, 0, 1);

  -[BiometricKitXPCServer biometricABC](self->_server, "biometricABC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reporter");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  +[BLHelper stringFromResetReason:](BLHelper, "stringFromResetReason:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("TouchID"), CFSTR("SensorRecovery"), v12, CFSTR("biometrickitd"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BiometricKitXPCServer biometricABC](self->_server, "biometricABC");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendSignature:withDuration:", v13, 2.0);

}

- (void)logSKSLockState:(unsigned __int16)a3 forUser:(unsigned int)a4 withTimestamp:(unint64_t)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)&a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromSKSLockState:](BLHelper, "stringFromSKSLockState:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d%s%@"), v6, ": ", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("SEPSKS"), v9, a5, 0, 0, 1);

}

- (void)logDelegateRegistered:(BOOL)a3 fromClient:(id)a4
{
  const __CFString *v5;
  id v6;

  if (a3)
    v5 = CFSTR("Registered");
  else
    v5 = CFSTR("Unregistered");
  v6 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Delegate"), v5, 0, a4, 0, 1);
}

- (void)logEnrollStartForUser:(unsigned int)a3 fromClient:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%d"), "Start", ": ", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Enroll"), v6, 0, v8, "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", 1);

}

- (void)logMatchStartFromClient:(id)a3
{
  id v3;

  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Match "), CFSTR("Start"), 0, a3, "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", 1);
}

- (void)logMatchStart:(id)a3 withOptions:(id)a4 fromClient:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend(&unk_251CB3B50, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(&unk_251CB3B50);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v16, v14);

        }
      }
      v11 = objc_msgSend(&unk_251CB3B50, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  v17 = v9;
  v18 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringWithFormat:", CFSTR("%s%s%@%s%@"), "Start", ": ", v19, ": ", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Match "), v21, 0, v8, "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", 1);
}

- (void)logFingerDetectStartWithOptions:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%s%s%@"), "Start", ": ", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("FDet  "), v8, 0, v10, "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", 1);
}

- (void)logCancelFromClient:(id)a3
{
  id v3;

  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("CANCEL"), 0, 0, a3, 0, 1);
}

- (void)logUpdateIdentity:(id)a3 withOptions:(id)a4 fromClient:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a5;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s%s%@ %s%@%s%s%@"), "Update", ": ", v12, "'", v13, "'", ": ", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), v15, 0, v17, 0, 1);
}

- (void)logRemoveIdentity:(id)a3 withOptions:(id)a4 fromClient:(id)a5 withTimestamp:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("%s%s%@ %s%@%s%s%@"), "Remove", ": ", v14, "'", v15, "'", ": ", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), v17, a6, v19, 0, 1);
}

- (void)logRemoveAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 fromClient:(id)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a5;
  v8 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s%s%s%s%d%s%@"), "Remove", ": ", "All", ": ", v6, ": ", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), v10, 0, v12, 0, 1);
}

- (void)logGetIdentityFromUUID:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%s%s%@"), "Get", ": ", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), v8, 0, v10, 0, 1);
}

- (void)logGetIdentities:(id)a3 fromClient:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%s%s%@"), "IdentitiesWithFilter", ": ", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), v8, 0, v10, 0, 1);
}

- (void)logGetMaxIdentityCount:(int)a3 fromClient:(id)a4
{
  id v4;

  v4 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Ident "), CFSTR("Get: MaxIdentityCount"), 0, a4, 0, 1);
}

- (void)logProtectedConfigurationSync:(id)a3 forUser:(unsigned int)a4 fromClient:(id)a5
{
  uint64_t v6;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v14 = a3;
  v8 = a5;
  if ((_DWORD)v6 == -1)
  {
    v9 = CFSTR("All");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%s%@"), v9, ": ", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Catacomb: Config"), v12, 0, v8, 0, 1);

}

- (void)logDisconnectingClient:(id)a3
{
  id v3;

  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("Disconnect"), 0, 0, a3, 0, 1);
}

- (void)logError:(id)a3 withDetails:(id)a4 status:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a3;
  v8 = a4;
  v9 = v8;
  if ((_DWORD)v5)
  {
    if (v8)
    {
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%s%s%s0x%x"), ": ", "Error", ": ", v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s0x%x"), "Error", ": ", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", v12, v9, 0, 0, 0, 1);
  }

}

- (void)logEnrollStartError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Enroll"), CFSTR("Start"), *(_QWORD *)&a3);
}

- (void)logMatchStartError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Match "), CFSTR("Start"), *(_QWORD *)&a3);
}

- (void)logFingerDetectStartError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("FDet  "), CFSTR("Start"), *(_QWORD *)&a3);
}

- (void)logCancelError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("CANCEL"), 0, *(_QWORD *)&a3);
}

- (void)logUpdateIdentity:(id)a3 withError:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Ident "), CFSTR("Update"), v4);
  if (!(_DWORD)v4)
    -[BioLogBase updateIdentity:](self, "updateIdentity:", v6);

}

- (void)logRemoveIdentity:(id)a3 withError:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Ident "), CFSTR("Remove"), v4);
  if (!(_DWORD)v4)
  {
    -[BLTemplateList removeIdentity:](self->_templateList, "removeIdentity:", v6);
    -[BioLogBase logTemplateListWithIdentity:listingAllIdentitiesForUser:](self, "logTemplateListWithIdentity:listingAllIdentitiesForUser:", 0, objc_msgSend(v6, "userID"));
  }

}

- (void)logProtectedConfigurationError:(int)a3
{
  -[BioLogBase logError:withDetails:status:](self, "logError:withDetails:status:", CFSTR("Catacomb"), CFSTR("Config"), *(_QWORD *)&a3);
}

- (void)logEnrollResultIdentity:(id)a3 withTimestamp:(unint64_t)a4 forClients:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a5;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a3;
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s%s%s%s%@"), "Result", ": ", "Complete", ": ", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[BioLogBase log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:", CFSTR("Enroll"), v12, a4, v14, "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<", 1);
  -[BioLogBase logTemplateListWithIdentity:listingAllIdentitiesForUser:](self, "logTemplateListWithIdentity:listingAllIdentitiesForUser:", v9, objc_msgSend(v9, "userID"));

}

- (void)logMatchResultIdentity:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6
{
  id v9;
  id v10;
  BiometricKitIdentity *v11;
  BiometricKitIdentity *lastMatchedIdentity;
  const __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  BioLogBase *v59;
  _QWORD v60[6];
  _QWORD v61[6];
  const __CFString *v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v58 = a6;
  if (v9)
  {
    v11 = (BiometricKitIdentity *)objc_msgSend(v9, "copy");
    lastMatchedIdentity = self->_lastMatchedIdentity;
    self->_lastMatchedIdentity = v11;

    v13 = CFSTR("MATCH");
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKMatchDetailNoMatchMatcher"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
      v13 = CFSTR("NO MATCH");
    else
      v13 = CFSTR("NO MATCH (Artificial)");
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("BKMatchDetailTopologyData"), CFSTR("BKMatchDetailImageMetadata"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v10, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)v16;
  objc_msgSend(v19, "minusSet:", v16);
  v55 = v19;
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithValuesForKeys:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v10, "objectForKey:", CFSTR("BKMatchDetailTopologyData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = self;
  if (objc_msgSend(v23, "length") == 3080)
  {
    v24 = objc_msgSend(objc_retainAutorelease(v23), "bytes");
    if (*(_WORD *)v24 == 3080)
    {
      v25 = v24;
      v64[0] = CFSTR("matchS2SCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v24 + 3076));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = CFSTR("matchNodeIndex");
      v65[0] = v26;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *(__int16 *)(v25 + 4));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addEntriesFromDictionary:", v28);

      self = v59;
      if ((v59->_loggingType & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v62 = CFSTR("matchingScore");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v25 + 3072));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addEntriesFromDictionary:", v30);

      }
    }
  }
  v31 = (void *)MEMORY[0x24BDD16A8];
  v54 = v22;
  +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%s%s%@%s%@"), "Result", ": ", v13, ": ", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", CFSTR("BKMatchDetailImageMetadata"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "length") == 98)
  {
    v35 = objc_retainAutorelease(v34);
    -[BioLogBase imageFileNameWithTimestamp:captureCounter:](self, "imageFileNameWithTimestamp:captureCounter:", *(_QWORD *)(objc_msgSend(v35, "bytes") + 59), *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v35), "bytes") + 67));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKMatchDetailNoMatchMatcher")),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = objc_msgSend(v37, "BOOLValue"),
          v37,
          v38))
    {
      objc_msgSend(v33, "appendFormat:", CFSTR("\n%s%s%@"), "IMG*", ": ", v36);
    }

    self = v59;
  }
  if (v9)
  {
    v51 = v34;
    v60[0] = CFSTR("userID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v50;
    v60[1] = CFSTR("name");
    objc_msgSend(v9, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v23;
    v53 = v10;
    if (v39)
    {
      objc_msgSend(v9, "name");
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = CFSTR("(nil)");
    }
    v61[1] = v40;
    v60[2] = CFSTR("uuid");
    objc_msgSend(v9, "uuid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v42;
    v60[3] = CFSTR("type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "type"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v43;
    v60[4] = CFSTR("attribute");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "attribute"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v44;
    v60[5] = CFSTR("entity");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "entity"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v61[5] = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    +[BLHelper stringFromDictionary:](BLHelper, "stringFromDictionary:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendFormat:", CFSTR("\n%s%s%@\n"), "Identity", ": ", v47);

    self = v59;
    -[BioLogBase stringFromTemplateByIdentity:](v59, "stringFromTemplateByIdentity:", v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendString:", v48);

    v23 = v52;
    v10 = v53;
    v34 = v51;
  }
  v49 = -[BioLogBase log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:forClients:endingWithToken:osLogMsgType:", CFSTR("Match "), v33, a5, v58, "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<", 1);

}

+ (int)runInShell:(id)a3
{
  id v3;
  int v4;
  pid_t v6[2];
  char *__argv[5];

  __argv[4] = *(char **)MEMORY[0x24BDAC8D0];
  *(_QWORD *)v6 = 0;
  __argv[0] = "/bin/sh";
  __argv[1] = "-c";
  v3 = objc_retainAutorelease(a3);
  __argv[2] = (char *)objc_msgSend(v3, "cStringUsingEncoding:", 1);
  __argv[3] = 0;
  if (posix_spawn(v6, "/bin/sh", 0, 0, __argv, (char *const *)*MEMORY[0x24BDAE198]))
  {
    NSLog(CFSTR("Failed to run shell command: %@"), v3);
    v4 = 1;
  }
  else
  {
    waitpid(v6[0], &v6[1], 0);
    v4 = BYTE1(v6[1]);
  }

  return v4;
}

- (id)packCurrentLog
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), CFSTR("Requested as attachment"), 0, 0, 0, 0);
  -[NSString lastPathComponent](self->_logPath, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.zip"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cd %@ && ditto -ck --keepParent %@ %s/%@"), self->_rootPath, v4, "/tmp", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BioLogBase createNewLog](self, "createNewLog"))
    NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Retrying on next entry..."));
  objc_msgSend((id)objc_opt_class(), "runInShell:", v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%@"), "/tmp", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)packAllLogs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), CFSTR("Requested as attachment"), 0, 0, 0, 0);
  -[BioLogBase synchronizeLogFileSync](self, "synchronizeLogFileSync");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%@"), "/tmp", CFSTR("BioLog.tar.bz2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cd %@ && tar --exclude *.bin16 --exclude *.pgm -cyf %@ ."), self->_rootPath, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("BioLog: Compressing %@ ..."), v4);
  v6 = objc_msgSend((id)objc_opt_class(), "runInShell:", v5);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("BioLog: Compression done. ExitCode: %d, FileExists:%d"), v6, objc_msgSend(v7, "fileExistsAtPath:", v4));

  if (!-[BioLogBase createNewLog](self, "createNewLog"))
    NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Retrying on next entry..."));

  return v4;
}

- (id)attachmentsFromCurrentLog
{
  id v3;
  NSString *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), CFSTR("Requested as attachment"), 0, 0, 0, 0);
  v4 = self->_logPath;
  if (!-[BioLogBase createNewLog](self, "createNewLog"))
    NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Retrying on next entry..."));
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attachmentsFromAllLogs
{
  id v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("LOG END"), CFSTR("Requested as attachment"), 0, 0, 0, 0);
  if (!-[BioLogBase createNewLog](self, "createNewLog"))
    NSLog(CFSTR("BioLog: ERROR: Log file could not be created! Retrying on next entry..."));
  v5[0] = self->_rootPath;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  return -[BioLogBase fileRadarWithLogs:withDescription:andKeywordIDs:](self, "fileRadarWithLogs:withDescription:andKeywordIDs:", a3, a4, CFSTR("575595"));
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4 andKeywordIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CFOptionFlags v12;
  _BOOL4 compact;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t i;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFOptionFlags v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v48 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("RadarPromptAccepted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (!v11)
  {
    CFUserNotificationDisplayAlert(0.0, 1uLL, 0, 0, 0, &stru_251CA43A8, CFSTR("Use only to file a radar with automatically generated logs (BioLog) to 'Mesa | Autofiled Bugs' component for Touch ID biometric performance triage. General Touch ID radars should be filed manually or using Tap-to-Radar app to Touch ID component."), 0, CFSTR("Cancel"), 0, &v48);
    v12 = v48;
  }
  compact = self->_compact;
  if (!self->_compact && !v12)
  {
    CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, CFSTR("Privacy Alert"), CFSTR("Your biometric data is about to be sent to Apple Radar database for Touch ID project debugging purposes."), CFSTR("I agree"), CFSTR("Cancel"), 0, &v48);
    compact = self->_compact;
    v12 = v48;
  }
  if (compact || !v12)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", "What were you doing when issue happened?\n...\n\n");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", ");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("RadarPromptAccepted"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("RadarPromptAccepted"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v20);
      v22 = v21;

      if (v22 < 60.0)
      {
        objc_msgSend(v16, "appendString:", v10);
        objc_msgSend(v15, "appendString:", CFSTR("[ASSERT]\n"));
        -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("LastAssertionFailureCode"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR("Last error code: 0x%x\n"), objc_msgSend(v23, "intValue"));

        -[NSMutableDictionary objectForKeyedSubscript:](self->_logDetails, "objectForKeyedSubscript:", CFSTR("AssertionFailureCount"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR("Failure count: %@\n"), v24);

      }
    }
    objc_msgSend(v15, "appendString:", CFSTR("[Details]\n"));
    objc_msgSend(v15, "appendFormat:", CFSTR("Internal description: %@\n"), v9);
    +[BLHelper stringFromProvisioningState:](BLHelper, "stringFromProvisioningState:", -[BiometricKitXPCServerMesa getProvisioningStateWithClient:](self->_server, "getProvisioningStateWithClient:", 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR("Provisioning state: %@\n"), v25);

    objc_msgSend(v15, "appendFormat:", CFSTR("Sensor patch version: %ld\n"), getSensorPatchVersion());
    objc_msgSend(v15, "appendString:", CFSTR("\nDetailed steps to reproduce:\n1."));
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=Mesa&ComponentVersion=Autofiled Bugs&ComponentID=529507&Classification=Other Bug&Reproducibility=Not Applicable&"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      objc_msgSend(v26, "appendFormat:", CFSTR("Keywords=%@&"), v16);
    v43 = v16;
    if (objc_msgSend(v8, "count"))
    {
      v41 = v10;
      v42 = v9;
      objc_msgSend(v26, "appendString:", CFSTR("Attachments="));
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v27 = v8;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v45;
        v31 = 1;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v27);
            v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            if ((v31 & 1) == 0)
              objc_msgSend(v26, "appendString:", CFSTR(","));
            objc_msgSend(v26, "appendString:", v33);
            v31 = 0;
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          v31 = 0;
        }
        while (v29);
      }

      v34 = CFSTR("&");
      v10 = v41;
      v9 = v42;
    }
    else
    {
      v34 = CFSTR("ExtensionIdentifiers=com.apple.BiometricKit.BioLogDiagnostic&");
    }
    objc_msgSend(v26, "appendString:", v34);
    objc_msgSend(v26, "appendFormat:", CFSTR("Description=%@"), v15);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAddingPercentEncodingWithAllowedCharacters:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URLWithString:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v35, "openURL:withOptions:", v39, 0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)timeBox
{
  return self->_timeBox;
}

- (void)logAsync:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 endingWithToken:(char *)a6
{
  id v6;

  v6 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", a3, a4, a5, 0, a6, 1);
}

- (void)logMobileKeyBagLockStatus:(int)a3
{
  void *v7;

  if ((logMobileKeyBagLockStatus__lastLockState != a3 - 100 || a3 <= 100)
    && logMobileKeyBagLockStatus__lastLockState != a3)
  {
    +[BLHelper stringFromMobileKeyBagState:](BLHelper, "stringFromMobileKeyBagState:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BioLogBase logAsync:withDetails:timestamp:endingWithToken:](self, "logAsync:withDetails:timestamp:endingWithToken:", CFSTR("System"), v7, 0, 0);

    logMobileKeyBagLockStatus__lastLockState = a3;
  }
}

- (void)logPowerSourceStateAsync:(BOOL)a3 initial:(BOOL)a4
{
  _BOOL8 v5;
  _BOOL4 v7;
  id v8;
  BOOL v9;

  v5 = a3;
  v9 = 0;
  if (-[BioLogBase chargerConnected:](self, "chargerConnected:", &v9))
  {
    v7 = v9;
    if (a4 || self->_chargerConnected != v9)
    {
      self->_chargerConnected = v9;
      -[BioLogBase logPowerSource:withAbsoluteTime:async:](self, "logPowerSource:withAbsoluteTime:async:", v7, 0, v5);
    }
  }
  else if (v5)
  {
    -[BioLogBase logAsync:withDetails:timestamp:endingWithToken:](self, "logAsync:withDetails:timestamp:endingWithToken:", CFSTR("System"), CFSTR("PowerSource: Error: Cannot read state!"), 0, 0);
  }
  else
  {
    v8 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), CFSTR("PowerSource: Error: Cannot read state!"), 0, 0, 0, 1);
  }
}

- (void)logPowerSource:(BOOL)a3 withAbsoluteTime:(unint64_t)a4 async:(BOOL)a5
{
  _BOOL4 v5;
  const char *v8;
  id v9;
  id v10;

  v5 = a5;
  if (a3)
    v8 = "Charger";
  else
    v8 = "Battery";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s"), "PowerSource", ": ", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[BioLogBase logAsync:withDetails:timestamp:endingWithToken:](self, "logAsync:withDetails:timestamp:endingWithToken:", CFSTR("System"), v10, a4, 0);
  else
    v9 = -[BioLogBase log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:](self, "log:withDetails:timestamp:fromClient:endingWithToken:osLogMsgType:", CFSTR("System"), v10, a4, 0, 0, 1);

}

- (BOOL)chargerConnected:(BOOL *)a3
{
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_registry_entry_t v7;
  const __CFAllocator *v8;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v10;
  int Value;
  const __CFBoolean *v12;
  const __CFBoolean *v13;
  BOOL v14;

  v4 = *MEMORY[0x24BDD8B20];
  v5 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "pmService", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3051, 0);
    return 0;
  }
  v7 = MatchingService;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("ExternalConnected"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "cfType", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3054, 0);
LABEL_13:
    v14 = 0;
    goto LABEL_8;
  }
  v10 = CFProperty;
  Value = CFBooleanGetValue(CFProperty);
  CFRelease(v10);
  if (!Value)
  {
    *a3 = 0;
    goto LABEL_7;
  }
  v12 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("ExternalChargeCapable"), v8, 0);
  if (!v12)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "cfType", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3062, 0);
    goto LABEL_13;
  }
  v13 = v12;
  *a3 = CFBooleanGetValue(v12) != 0;
  CFRelease(v13);
LABEL_7:
  v14 = 1;
LABEL_8:
  IOObjectRelease(v7);
  return v14;
}

- (void)initializeEventSystem
{
  __CFNotificationCenter *DarwinNotifyCenter;
  mach_port_t v4;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  kern_return_t v8;
  const __CFDictionary *v9;
  io_service_t v10;
  kern_return_t v11;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)mobileKeyBagLockStatusNotificationCallback, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = *MEMORY[0x24BDD8B20];
  v5 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  self->_notificationPort = v5;
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_notificationPort", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3103, 0);
    goto LABEL_11;
  }
  IONotificationPortSetDispatchQueue(v5, MEMORY[0x24BDAC9B8]);
  v6 = IOServiceMatching("AppleMesaSEPDriver");
  MatchingService = IOServiceGetMatchingService(v4, v6);
  if (!MatchingService)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "mesaService", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3108, 0);
  v8 = IOServiceAddInterestNotification(self->_notificationPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)mesaScanningStateNotificationCallback, self, &self->_mesaScanningStateNotification);
  if (v8)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == 0 ", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3116, v8);
  IOObjectRelease(MatchingService);
  v9 = IOServiceMatching("IOPMPowerSource");
  v10 = IOServiceGetMatchingService(v4, v9);
  if (!v10)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "pmService", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3125, 0);
  v11 = IOServiceAddInterestNotification(self->_notificationPort, v10, "IOGeneralInterest", (IOServiceInterestCallback)powerSourceInterestNotificationCallback, self, &self->_powerSourceNotification);
  if (v11)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == 0 ", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3133, v11);
  IOObjectRelease(v10);
  if (!v11)
  {
LABEL_11:
    if (self->_mesaScanningStateNotification)
      return;
  }
  NSLog(CFSTR("BioLog: Warning: Event system initialization maybe incomplete!"));
}

- (void)uninitializeEventSystem
{
  __CFNotificationCenter *DarwinNotifyCenter;
  io_object_t powerSourceNotification;
  io_object_t mesaScanningStateNotification;
  IONotificationPort *notificationPort;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  powerSourceNotification = self->_powerSourceNotification;
  if (powerSourceNotification)
  {
    IOObjectRelease(powerSourceNotification);
    self->_powerSourceNotification = 0;
  }
  mesaScanningStateNotification = self->_mesaScanningStateNotification;
  if (mesaScanningStateNotification)
  {
    IOObjectRelease(mesaScanningStateNotification);
    self->_mesaScanningStateNotification = 0;
  }
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0;
  }
}

- (unint64_t)absoluteTimeOverride
{
  return self->_absoluteTimeOverride;
}

- (void)setAbsoluteTimeOverride:(unint64_t)a3
{
  self->_absoluteTimeOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDetails, 0);
  objc_storeStrong((id *)&self->_osLog, 0);
  objc_storeStrong((id *)&self->_lastMatchedIdentity, 0);
  objc_storeStrong((id *)&self->_templateList, 0);
  objc_storeStrong((id *)&self->_imageCommentString, 0);
  objc_storeStrong((id *)&self->_milisecondsFormatter, 0);
  objc_storeStrong((id *)&self->_timeZoneFormatter, 0);
  objc_storeStrong((id *)&self->_fileNameFormatter, 0);
  objc_storeStrong((id *)&self->_timestampFormatter, 0);
  objc_storeStrong((id *)&self->_lastLogWriteException, 0);
  objc_storeStrong((id *)&self->_lastStatusESDRecovery, 0);
  objc_storeStrong((id *)&self->_logStartDate, 0);
  objc_storeStrong((id *)&self->_timeBox, 0);
  objc_storeStrong((id *)&self->_logFile, 0);
  objc_storeStrong((id *)&self->_fileAttributesProtected, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_lastLogMessage, 0);
  objc_storeStrong((id *)&self->_logFilePath, 0);
  objc_storeStrong((id *)&self->_logPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)initToPath:withServerObject:identities:mode:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_24B74E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t for com.apple.BiometricKit.Daemon-BioLog", v0, 2u);
}

- (void)_log:(void *)a1 withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:.cold.1(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = OUTLINED_FUNCTION_1();
  v3 = 136315138;
  v4 = OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_24B74E000, v2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_0();
}

- (void)_log:(void *)a1 withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:.cold.2(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = OUTLINED_FUNCTION_1();
  v3 = 136315138;
  v4 = OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24B74E000, v2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_0();
}

- (void)_log:(void *)a1 withDetails:timestamp:fromClient:forClients:endingWithToken:checkingLogEnd:osLogMsgType:source:sourceTimestamp:.cold.3(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = OUTLINED_FUNCTION_1();
  v3 = 136315138;
  v4 = OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_24B74E000, v2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_0();
}

@end
