@implementation BRCTLDiagnoseCommand

- (BRCTLDiagnoseCommand)init
{
  BRCTLDiagnoseCommand *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray *allAccounts;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  BRCTLDiagnoseCommand *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v22.receiver = self;
  v22.super_class = (Class)BRCTLDiagnoseCommand;
  v2 = -[BRCTLDiagnoseCommand init](&v22, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SUDO_USER")));
    v2->_sudoed = v5 != 0;

    v2->_rootUser = geteuid() == 0;
    v2->_shouldCollectEnterpriseData = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors"));
    allAccounts = v2->_allAccounts;
    v2->_allAccounts = (NSArray *)v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v2->_allAccounts;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_100012120;
          v15[3] = &unk_1000257B8;
          v15[4] = v13;
          v16 = v2;
          v17 = v4;
          BRPerformWithAccountDescriptor(v13, v15);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

  }
  return v2;
}

- (id)libraryPathForPersona:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_libraryPath, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_libraryPath, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homePath, "objectForKeyedSubscript:", v4));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homePath, "objectForKeyedSubscript:", v4));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library")));

      -[NSMutableDictionary setObject:forKey:](self->_libraryPath, "setObject:forKey:", v6, v4);
    }
    else
    {
      v6 = CFSTR("/var/mobile/Library");
    }
  }

  return v6;
}

- (id)cloudDocsLogPath
{
  NSString *cloudDocsLogPath;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  cloudDocsLogPath = self->_cloudDocsLogPath;
  if (!cloudDocsLogPath)
  {
    v4 = BRLogsAbsolutePath();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_cloudDocsLogPath;
    self->_cloudDocsLogPath = v5;

    cloudDocsLogPath = self->_cloudDocsLogPath;
  }
  return cloudDocsLogPath;
}

- (id)cloudKitLogPath
{
  NSString *cloudKitLogPath;
  void *v4;
  NSString *v5;
  NSString *v6;

  cloudKitLogPath = self->_cloudKitLogPath;
  if (!cloudKitLogPath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/DiagnosticLogs/com.apple.cloudkit")));
    v6 = self->_cloudKitLogPath;
    self->_cloudKitLogPath = v5;

    cloudKitLogPath = self->_cloudKitLogPath;
  }
  return cloudKitLogPath;
}

- (id)coreSpotlightLogPath
{
  return objc_msgSend(CFSTR("Logs/CrashReporter/DiagnosticLogs/com.apple.corespotlight.asl"), "br_pathRelativeToDirectory:", 5);
}

- (id)appSupportPathForPersona:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appSupportPath, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appSupportPath, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_libraryPath, "objectForKeyedSubscript:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Application Support")));

    -[NSMutableDictionary setObject:forKey:](self->_appSupportPath, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (id)containersPathForPersona:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_containersPath, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_containersPath, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_libraryPath, "objectForKeyedSubscript:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", BRUbiquitousContainersRootFolderName));

    -[NSMutableDictionary setObject:forKey:](self->_containersPath, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (id)crashLogsPaths
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter")));
  v6[0] = v3;
  v6[1] = CFSTR("/Library/Logs/CrashReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (id)deviceName
{
  NSString *deviceName;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  __CFString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _OWORD v12[16];

  deviceName = self->_deviceName;
  if (!deviceName)
  {
    v4 = (NSString *)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
    v5 = self->_deviceName;
    self->_deviceName = v4;

    v6 = self->_deviceName;
    if (!v6)
    {
      memset(v12, 0, 255);
      if (gethostname((char *)v12, 0xFFuLL))
        v7 = CFSTR("local");
      else
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      v8 = self->_deviceName;
      self->_deviceName = &v7->isa;

      v6 = self->_deviceName;
    }
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[BRTask sanitizeStringForFilename:](BRTask, "sanitizeStringForFilename:", v6));
    v10 = self->_deviceName;
    self->_deviceName = v9;

    deviceName = self->_deviceName;
  }
  return deviceName;
}

- (id)_generateDiagnoseDirectoryNameWithDeviceName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yy.MM.dd-HH.mm.ss"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("clouddocs-%@-%@"), v3, v6));

  return v7;
}

- (BOOL)_removeDirectoryIfNecessaryAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  BOOL v9;
  FILE *v10;
  const char *v11;
  id v12;
  id v14;
  char v15;

  v3 = a3;
  if (!v3)
    sub_1000173D8();
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = 0;
  if (!objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v15))
    goto LABEL_6;
  if (!v15)
  {
    fprintf(__stderrp, "No directory to remove at path '%s'.", (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"));
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v14 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v14);
  v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    v10 = __stderrp;
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    fprintf(v10, "Unable to remove directory at path '%s' (error: %s).\n", v11, (const char *)objc_msgSend(v12, "UTF8String"));

    goto LABEL_9;
  }

LABEL_6:
  v9 = 1;
LABEL_10:

  return v9;
}

- (id)_diagnoseParentPath
{
  return objc_msgSend(CFSTR("Logs/CrashReporter/Cloud"), "br_pathRelativeToDirectory:", 5);
}

- (id)_generateHelperDiagnoseDirName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand deviceName](self, "deviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _generateDiagnoseDirectoryNameWithDeviceName:](self, "_generateDiagnoseDirectoryNameWithDeviceName:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _diagnoseParentPath](self, "_diagnoseParentPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("_helper")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v6));

  return v7;
}

- (id)_prepareTargetDiagnoseDirPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  FILE *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  FILE *v26;
  FILE *v27;
  const char *v28;
  id v29;
  FILE *v30;
  FILE *v31;
  const char *v32;
  id v33;
  id v35;
  id v36;
  NSFileAttributeKey v37;
  _UNKNOWN **v38;
  NSFileAttributeKey v39;
  _UNKNOWN **v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  if (!objc_msgSend(v4, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand deviceName](self, "deviceName"));
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _generateDiagnoseDirectoryNameWithDeviceName:](self, "_generateDiagnoseDirectoryNameWithDeviceName:", v15));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _diagnoseParentPath](self, "_diagnoseParentPath"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v10));
    v8 = v4;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v7));

  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _diagnoseParentPath](self, "_diagnoseParentPath"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v6));

    if (objc_msgSend(v5, "fileExistsAtPath:", v10) && !self->continueExecution)
    {
      v30 = __stderrp;
      v10 = objc_retainAutorelease(v10);
      objc_msgSend(v10, "UTF8String");
      fprintf(v30, "Invalid output path (path: '%s'); already exists.\n");
    }
    else
    {
      if ((objc_msgSend(v10, "isEqualToString:", v8) & 1) != 0
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private"), "stringByAppendingPathComponent:", v10)),
            v12 = objc_msgSend(v11, "isEqualToString:", v8),
            v11,
            (v12 & 1) != 0))
      {
        if ((objc_msgSend(v10, "br_isAbsolutePath") & 1) != 0)
          goto LABEL_11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _diagnoseParentPath](self, "_diagnoseParentPath"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v10));
LABEL_10:

        v10 = (id)v14;
LABEL_11:
        if (self->_isSysdiagnose)
        {
          v16 = 0;
          goto LABEL_19;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "br_realpath"));

        if (objc_msgSend(v5, "fileExistsAtPath:", v19))
        {
          if ((objc_msgSend(v5, "isWritableFileAtPath:", v19) & 1) != 0)
          {
            v16 = 0;
LABEL_18:

LABEL_19:
            if (self->continueExecution && (objc_msgSend(v5, "fileExistsAtPath:", v10) & 1) == 0)
            {
              v37 = NSFilePosixPermissions;
              v38 = &off_100027F88;
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
              v35 = v16;
              v23 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, v22, &v35);
              v24 = v35;

              if ((v23 & 1) == 0)
              {
                v27 = __stderrp;
                v28 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
                v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description")));
                fprintf(v27, "Unable to create directory at path '%s'; %s.\n",
                  v28,
                  (const char *)objc_msgSend(v29, "UTF8String"));

                v25 = 0;
LABEL_33:

                goto LABEL_34;
              }
              v16 = v24;
            }
            v25 = v10;
LABEL_32:
            v24 = v16;
            goto LABEL_33;
          }
          fprintf(__stderrp, "Path is not writable '%s'\n", (const char *)objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation"));
          v16 = 0;
        }
        else
        {
          v39 = NSFilePosixPermissions;
          v40 = &off_100027F88;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
          v36 = 0;
          v21 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 0, v20, &v36);
          v16 = v36;

          if ((v21 & 1) != 0)
            goto LABEL_18;
          v31 = __stderrp;
          v32 = (const char *)objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation");
          v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description")));
          fprintf(v31, "Unable to create directory at path '%s'; %s.\n",
            v32,
            (const char *)objc_msgSend(v33, "UTF8String"));

        }
        v25 = 0;
        goto LABEL_32;
      }
      v26 = __stderrp;
      v8 = objc_retainAutorelease(v8);
      objc_msgSend(v8, "UTF8String");
      fprintf(v26, "Invalid output path (path: '%s'); does not match expected path\n");
    }

  }
  else
  {
    v17 = __stderrp;
    v8 = objc_retainAutorelease(v8);
    fprintf(v17, "Invalid output path (path: '%s').\n", (const char *)objc_msgSend(v8, "UTF8String"));
  }
  v25 = 0;
LABEL_34:

  return v25;
}

- (BOOL)_isNoSuchFileError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", NSCocoaErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)4 || objc_msgSend(v3, "code") == (id)260;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_collectFilesWithPredicate:(id)a3 srcPath:(id)a4 dstPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  unsigned __int8 v26;
  FILE *v27;
  const char *v28;
  id v29;
  FILE *v30;
  const char *v31;
  const char *v32;
  BOOL v33;
  unsigned __int8 v34;
  FILE *v35;
  const char *v36;
  FILE *v37;
  const char *v38;
  FILE *v39;
  const char *v40;
  const char *v41;
  void *v44;
  id obj;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  char v59;
  _BYTE v60[128];

  v50 = a3;
  v7 = a4;
  v8 = a5;
  v59 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v47 = v7;
  if (!objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v59))
  {
LABEL_27:
    v11 = 0;
    v13 = 0;
    v33 = 0;
    goto LABEL_33;
  }
  if (v59)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtPath:", v7));
    if (v10)
    {
      v11 = (void *)v10;
      v57 = 0;
      v12 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v57);
      v13 = v57;
      if ((v12 & 1) != 0)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v14 = v11;
        v49 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (!v49)
          goto LABEL_22;
        v48 = *(_QWORD *)v54;
        obj = v14;
        v46 = v8;
        v44 = v9;
        while (1)
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v48)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
            v17 = objc_autoreleasePoolPush();
            if (!v50 || objc_msgSend(v50, "evaluateWithObject:", v16))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringByAppendingPathComponent:", v16));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v16));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByDeletingLastPathComponent"));
              v52 = v13;
              v21 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v52);
              v22 = v9;
              v23 = v8;
              v24 = v21;
              v25 = v52;

              if ((v24 & 1) != 0)
              {
                v51 = v25;
                v26 = objc_msgSend(v22, "copyItemAtPath:toPath:error:", v18, v19, &v51);
                v13 = v51;

                v9 = v22;
                if ((v26 & 1) != 0 || -[BRCTLDiagnoseCommand _isNoSuchFileError:](self, "_isNoSuchFileError:", v13))
                {
                  v8 = v46;
LABEL_19:

                  goto LABEL_20;
                }
                v30 = __stderrp;
                v31 = (const char *)objc_msgSend(objc_retainAutorelease(v18), "fileSystemRepresentation");
                v32 = (const char *)objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation");
                v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description")));
                fprintf(v30, "can't copy item from \"%s\" to \"%s\": %s\n", v31, v32, (const char *)objc_msgSend(v29, "UTF8String"));
              }
              else
              {
                v27 = __stderrp;
                v28 = (const char *)objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation");
                v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description")));
                fprintf(v27, "can't create destination dir at \"%s\": %s\n", v28, (const char *)objc_msgSend(v29, "UTF8String"));
                v13 = v25;
              }

              v8 = v46;
              v9 = v44;
              goto LABEL_19;
            }
LABEL_20:
            objc_autoreleasePoolPop(v17);
          }
          v14 = obj;
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          if (!v49)
          {
LABEL_22:
            v33 = 1;
            v11 = v14;
            goto LABEL_32;
          }
        }
      }
      v35 = __stderrp;
      v36 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description")));
      fprintf(v35, "can't create destination dir at \"%s\": %s\n", v36, (const char *)objc_msgSend(v14, "UTF8String"));
      goto LABEL_30;
    }
    if (!-[BRCTLDiagnoseCommand _isNoSuchFileError:](self, "_isNoSuchFileError:", 0))
    {
      v37 = __stderrp;
      v38 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description")));
      fprintf(v37, "can't get the contents of dir at \"%s\": %s\n", v38, (const char *)objc_msgSend(v14, "UTF8String"));
      v11 = 0;
      v13 = 0;
LABEL_30:
      v33 = 0;
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_27;
  }
  v58 = 0;
  v34 = objc_msgSend(v9, "copyItemAtPath:toPath:error:", v7, v8, &v58);
  v13 = v58;
  if ((v34 & 1) == 0 && !-[BRCTLDiagnoseCommand _isNoSuchFileError:](self, "_isNoSuchFileError:", v13))
  {
    v39 = __stderrp;
    v40 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v41 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description")));
    fprintf(v39, "can't copy item from \"%s\" to \"%s\": %s\n", v40, v41, (const char *)objc_msgSend(v14, "UTF8String"));
    v11 = 0;
    v33 = 1;
    goto LABEL_32;
  }
  v11 = 0;
  v33 = 1;
LABEL_33:

  return v33;
}

- (BOOL)_collectFilesAtPath:(id)a3 dstPath:(id)a4
{
  return -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", 0, a3, a4);
}

- (void)_printActionStartWithLabel:(id)a3
{
  printf("- %s... ", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  fflush(__stdoutp);
}

- (void)_printActionEnd
{
  puts("done");
  fflush(__stdoutp);
}

- (void)_printActionFailedWithError:(id)a3
{
  id v3;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription")));
  printf("failed: %s\n", (const char *)objc_msgSend(v3, "UTF8String"));

  fflush(__stdoutp);
}

- (void)_printActionFailed
{
  puts("failed");
  fflush(__stdoutp);
}

- (BOOL)_execTask:(id)a3 withLabel:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  unsigned __int16 v10;
  unsigned __int16 v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", v7);
    if (objc_msgSend(v6, "exec"))
    {
      -[BRCTLDiagnoseCommand _printActionFailed](self, "_printActionFailed");
    }
    else
    {
      v10 = (unsigned __int16)objc_msgSend(v6, "waitStatus");
      if ((v10 & 0x7F) != 0x7F)
      {
        if ((v10 & 0x7F) == 0)
        {
          v11 = v10;
          -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
          v8 = (v11 & 0xFF00) == 0;
          goto LABEL_6;
        }
        puts("aborted");
      }
    }
  }
  else
  {
    objc_msgSend(v6, "exec");
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)_moveMobileLogs
{
  void *v2;
  void *v3;
  void *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  BOOL v7;
  xpc_object_t value;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD handler[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  xpc_connection_t mach_service;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("ips"), 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v2, CFSTR("Extensions")));
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100013720;
  v18 = sub_100013730;
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
  v5 = (_xpc_connection_s *)v15[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013738;
  handler[3] = &unk_1000257E0;
  handler[4] = &v14;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_resume((xpc_connection_t)v15[5]);
  v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v15[5], v4);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary
    && (value = xpc_dictionary_get_value(v6, "Success"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(value),
        (v11 = v10) != 0)
    && (v12 = xpc_BOOL_get_value(v10), v11, v12))
  {
    v7 = 1;
  }
  else
  {
    fwrite("crash_mover xpc service failed.\n", 0x20uLL, 1uLL, __stderrp);
    v7 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)_collectCrashesAndSpinsAtPath:(id)a3 processes:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v6 = a3;
  v20 = a4;
  -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("collecting crashes and spins"));
  -[BRCTLDiagnoseCommand _moveMobileLogs](self, "_moveMobileLogs");
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("crashes_and_spins")));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand crashLogsPaths](self, "crashLogsPaths"));
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v23 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF LIKE 'stacks*'")));
        -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:");
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = v20;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("^(ExcResource_|Sandbox-)?%@.*\\.(crash|ips|spin|hang|diag)(\\.synced)?$"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14)));
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v15));
              -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v16, v9, v7);

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v12);
        }

        v8 = v23 + 1;
      }
      while ((id)(v23 + 1) != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
}

- (void)_sampleTaskAtPath:(id)a3 cmd:(id)a4 process:(id)a5 pid:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v6 = *(_QWORD *)&a6;
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)BRTask);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%i.txt"), v14, v10, v6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v15));

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("sample")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-f \"%@\" @@"), v16));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@"), v17));

    objc_msgSend(v12, "setRedirectStdoutToFileAtPath:", CFSTR("/dev/null"));
    v9 = (id)v18;
  }
  else
  {
    objc_msgSend(v12, "setRedirectStdoutToFileAtPath:", v16);
  }
  objc_msgSend(v12, "setRedirectStderrToFileDescriptor:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@"), v20));

  objc_msgSend(v12, "setCommandWithArguments:", v21);
  objc_msgSend(v12, "exec");

}

- (void)_postOrderChmodWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = v3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:"));
  v6 = objc_alloc_init((Class)BRTask);
  objc_msgSend(v6, "setRedirectStderrToFileDescriptor:", 1);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
        v22 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
        v14 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v13, &v22);
        v15 = v22;

        if (v14)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (v16 || objc_msgSend(v7, "isEnumeratingDirectoryPostOrder"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/bin/chmod 777 \"%@\"), v17));

          objc_msgSend(v6, "setCommandWithArguments:", v18);
          objc_msgSend(v6, "exec");

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/bin/chmod 777 \"%@\"), v21));
  objc_msgSend(v6, "setCommandWithArguments:", v19);
  objc_msgSend(v6, "exec");

}

- (void)_collectFileCoordinationDumpAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_time_t v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  dispatch_semaphore_t v13;

  v4 = a3;
  -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("collecting filecoordination dump"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100013F30;
  v11 = &unk_100025808;
  v12 = v4;
  v13 = dispatch_semaphore_create(0);
  v5 = v13;
  v6 = v4;
  +[NSFileCoordinator _getDebugInfoWithCompletionHandler:](NSFileCoordinator, "_getDebugInfoWithCompletionHandler:", &v8);
  v7 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v5, v7);
  -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd", v8, v9, v10, v11);

}

- (BOOL)_tar_c:(id)a3 withContentsOfDirectory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  uint64_t disk_new;
  FTS *v14;
  FTS *v15;
  id v16;
  size_t v17;
  FTSENT *v18;
  FTSENT *v19;
  unsigned int fts_info;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  stat *fts_statp;
  ssize_t v26;
  id v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v32;
  _BYTE v33[16384];
  char *v34[2];

  v7 = a3;
  v8 = a4;
  v9 = (void *)archive_write_new();
  v10 = objc_retainAutorelease(v8);
  v34[0] = (char *)objc_msgSend(v10, "fileSystemRepresentation");
  v34[1] = 0;
  archive_write_set_compression_gzip(v9);
  archive_write_set_format_pax(v9);
  v11 = objc_retainAutorelease(v7);
  if (archive_write_open_filename(v9, objc_msgSend(v11, "fileSystemRepresentation")))
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError br_errorFromErrno](NSError, "br_errorFromErrno"));
    free(v9);
    v12 = 0;
    goto LABEL_47;
  }
  disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  v14 = fts_open(v34, 84, 0);
  v15 = v14;
  if (a5 && !v14)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError br_errorFromErrno](NSError, "br_errorFromErrno"));
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent")));
  v17 = strlen((const char *)objc_msgSend(v16, "fileSystemRepresentation"));

  if (v15)
  {
    v32 = disk_new;
    v18 = fts_read(v15);
    v12 = 1;
    if (v18)
    {
      v19 = v18;
      while (1)
      {
        fts_info = v19->fts_info;
        if (fts_info > 0xE)
          goto LABEL_16;
        v21 = 1 << fts_info;
        if ((v21 & 0x4266) == 0)
          break;
LABEL_13:
        v19 = fts_read(v15);
        if (!v19)
        {
          v12 = 1;
          goto LABEL_29;
        }
      }
      if ((v21 & 0x490) == 0)
      {
LABEL_16:
        v22 = open(v19->fts_accpath, 0, 0);
        if ((v22 & 0x80000000) == 0)
        {
          v23 = v22;
          v24 = archive_entry_new();
          archive_entry_set_pathname(v24, &v19->fts_path[v17 + 1]);
          fts_statp = v19->fts_statp;
          disk_new = v32;
          if (archive_read_disk_entry_from_file(v32, v24, v23, fts_statp)
            || archive_write_header(v9, v24))
          {
LABEL_27:
            if (!a5)
            {
LABEL_35:
              archive_entry_free(v24);
              close(v23);
              goto LABEL_36;
            }
            v27 = +[NSError br_errorWithPOSIXCode:](NSError, "br_errorWithPOSIXCode:", archive_errno(v32));
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          }
          else
          {
            do
            {
              while (1)
              {
                v26 = read(v23, v33, 0x4000uLL);
                if (v26 < 0)
                  break;
                if (!v26)
                {
                  archive_entry_free(v24);
                  close(v23);
                  goto LABEL_13;
                }
                if (archive_write_data(v9, v33, v26) == -1)
                  goto LABEL_27;
              }
            }
            while (*__error() == 35 || *__error() == 4);
            if (!a5)
              goto LABEL_35;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError br_errorFromErrno](NSError, "br_errorFromErrno"));
          }
          *a5 = v28;
          goto LABEL_35;
        }
      }
      disk_new = v32;
      if (!a5)
        goto LABEL_36;
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError br_errorFromErrno](NSError, "br_errorFromErrno"));
    }
    else
    {
LABEL_29:
      disk_new = v32;
    }
  }
  else
  {
LABEL_36:
    v12 = 0;
  }
  if (v9)
  {
    v29 = archive_write_finish(v9);
    if (v29)
      v12 = 0;
    if (a5 && v29)
    {
      v30 = +[NSError br_errorWithPOSIXCode:](NSError, "br_errorWithPOSIXCode:", archive_errno(v9));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v30);
    }
  }
  if (disk_new)
    archive_read_finish(disk_new);
  if (v15)
    fts_close(v15);
LABEL_47:

  return v12;
}

- (void)_collectMobileDocumentsAtPath:(id)a3 containerID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *homePath;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *obj;
  BRCTLDiagnoseCommand *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[3];
  _QWORD v42[4];
  _BYTE v43[128];

  v33 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_collectMobileDocs)
  {
    if (!v6)
      goto LABEL_7;
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("=")))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 1));

      v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "containsString:", CFSTR(".")))
      v9 = objc_msgSend(objc_alloc((Class)BRMangledID), "initWithAppLibraryName:", v7);
    else
LABEL_7:
      v9 = 0;
    v28 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_allAccounts;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (v34)
    {
      v31 = *(_QWORD *)v38;
      v13 = (void *)BRUbiquitousContainersRootFolderName;
      v32 = v9;
      v30 = self;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          v35 = v10;
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
          homePath = self->_homePath;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountIdentifier"));
          v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homePath, "objectForKeyedSubscript:", v18));
          v20 = (void *)v19;
          if (v9)
          {
            v42[0] = v19;
            v42[1] = CFSTR("Library");
            v42[2] = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mangledIDString"));
            v42[3] = v21;
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
            v23 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v22));

            v11 = (void *)v23;
          }
          else
          {
            v41[0] = v19;
            v41[1] = CFSTR("Library");
            v41[2] = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
            v22 = v11;
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v21));
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_100026330));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountIdentifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", v25));

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("tar.gz")));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", v27));

          self = v30;
          -[BRCTLDiagnoseCommand _printActionStartWithLabel:](v30, "_printActionStartWithLabel:", CFSTR("creating root folder archive"));
          v36 = v15;
          LODWORD(v27) = -[BRCTLDiagnoseCommand _tar_c:withContentsOfDirectory:error:](v30, "_tar_c:withContentsOfDirectory:error:", v10, v11, &v36);
          v12 = v36;

          if ((_DWORD)v27)
            -[BRCTLDiagnoseCommand _printActionEnd](v30, "_printActionEnd");
          else
            -[BRCTLDiagnoseCommand _printActionFailedWithError:](v30, "_printActionFailedWithError:", v12);
          v9 = v32;
          v14 = (char *)v14 + 1;
          v15 = v12;
        }
        while (v34 != v14);
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v34);
    }

    v7 = v28;
  }

}

- (void)_collectDefaultsAtPathForDomain:(id)a3 path:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFArray *v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  __CFString *applicationID;

  applicationID = (__CFString *)a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("defaults-%@.txt"), applicationID));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reading defaults for %@"), applicationID));
  -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", v9);

  if (self->_rootUser)
  {
    v10 = CFPreferencesCopyKeyList(applicationID, CFSTR("mobile"), kCFPreferencesCurrentHost);
    v11 = CFPreferencesCopyMultiple(v10, applicationID, CFSTR("mobile"), kCFPreferencesCurrentHost);
  }
  else
  {
    v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = (CFDictionaryRef)objc_claimAutoreleasedReturnValue(-[__CFArray persistentDomainForName:](v10, "persistentDomainForName:", applicationID));
  }
  v12 = v11;

  if (!v12)
  {
    objc_msgSend(CFSTR("no default set\n"), "writeToFile:atomically:encoding:error:", v8, 1, 4, 0);
    goto LABEL_8;
  }
  if (-[__CFDictionary writeToFile:atomically:](v12, "writeToFile:atomically:", v8, 1))
  {
LABEL_8:
    -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
    goto LABEL_9;
  }
  -[BRCTLDiagnoseCommand _printActionFailed](self, "_printActionFailed");
LABEL_9:

}

- (void)_collectDefaultsAtPath:(id)a3
{
  id v4;

  v4 = a3;
  -[BRCTLDiagnoseCommand _collectDefaultsAtPathForDomain:path:](self, "_collectDefaultsAtPathForDomain:path:", CFSTR("com.apple.bird"), v4);
  -[BRCTLDiagnoseCommand _collectDefaultsAtPathForDomain:path:](self, "_collectDefaultsAtPathForDomain:path:", FPICloudDriveFeaturesUserDefaultsSuiteName, v4);

}

- (void)_collectLogs:(id)a3 diagnosePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v7, v9);
}

- (void)_truncateFileForiOSSysdiagnose:(id)a3
{
  id v4;
  unint64_t trackedSize;
  void *v6;
  id v7;

  if (self->_iOSSysdiagnose)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", a3));
    v4 = objc_msgSend(v7, "seekToEndOfFile");
    if ((unint64_t)v4 >= 0x32000)
    {
      trackedSize = self->_trackedSize;
      self->_trackedSize = (unint64_t)v4 + trackedSize;
      if ((unint64_t)v4 + trackedSize > 0x500000)
      {
        objc_msgSend(v7, "truncateFileAtOffset:", (5242880 - trackedSize) & ~((uint64_t)(5242880 - trackedSize) >> 63));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[truncated for sysdiagnose]"), "dataUsingEncoding:", 4));
        objc_msgSend(v7, "writeData:", v6);

        puts(" > truncated for sysdiagnose");
      }
    }

  }
}

- (id)_createSecureDiagnoseDirectory
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  FILE *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  FILE *v17;
  id v19;
  id v20;
  NSFileAttributeKey v21;
  _UNKNOWN **v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand deviceName](self, "deviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _generateDiagnoseDirectoryNameWithDeviceName:](self, "_generateDiagnoseDirectoryNameWithDeviceName:", v3));

  v5 = NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
  {
    v20 = 0;
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v20);
    v10 = v20;
    if ((v9 & 1) == 0)
    {
      v11 = __stderrp;
      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
      objc_msgSend(v12, "UTF8String");
      fprintf(v11, "Unable to remove directory at path '%s'; %s.\n");
LABEL_8:

      v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
  }
  v13 = v10;
  v21 = NSFilePosixPermissions;
  v22 = &off_100027F88;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v19 = v10;
  v15 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v14, &v19);
  v10 = v19;

  if ((v15 & 1) == 0)
  {
    v17 = __stderrp;
    objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
    objc_msgSend(v12, "UTF8String");
    fprintf(v17, "Unable to create directory at path '%s'; %s.\n");
    goto LABEL_8;
  }
  v16 = v7;
LABEL_9:

  return v16;
}

- (BOOL)_moveSecuredDiagnoseDirToTargetPath:(id)a3 targetPath:(id)a4
{
  id v5;
  id v6;
  NSNumber *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  FILE *v13;
  const char *v14;
  const char *v15;
  id v16;
  id v18;
  NSFileAttributeKey v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v19 = NSFileOwnerAccountID;
  v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_10000E23C());
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v20 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  if (sub_10000DCEC(v5, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = 0;
    v11 = objc_msgSend(v10, "moveItemAtPath:toPath:error:", v5, v6, &v18);
    v12 = v18;
    if ((v11 & 1) == 0)
    {
      v13 = __stderrp;
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
      v15 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
      fprintf(v13, "Unable to rename %s to '%s' (error: %s).\n", v14, v15, (const char *)objc_msgSend(v16, "UTF8String"));

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_moveContentsOfDirSrcDist:(id)a3 dstDir:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  BOOL v19;
  FILE *v20;
  id v21;
  const char *v22;
  id v23;
  const char *v24;
  id v25;
  FILE *v26;
  const char *v27;
  id v28;
  BRCTLDiagnoseCommand *v30;
  void *v31;
  id obj;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];

  v6 = a3;
  v33 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v39 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, &v39));
  v9 = v39;
  if (v8)
  {
    v30 = self;
    v31 = v8;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      while (2)
      {
        v13 = 0;
        v14 = v9;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", v15));
          v34 = v14;
          v18 = objc_msgSend(v7, "moveItemAtPath:toPath:error:", v16, v17, &v34);
          v9 = v34;

          if (!v18)
          {
            v20 = __stderrp;
            v21 = objc_retainAutorelease(v16);
            v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
            v23 = objc_retainAutorelease(v17);
            v24 = (const char *)objc_msgSend(v23, "fileSystemRepresentation");
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
            fprintf(v20, "Unable to move %s to '%s' (error: %s).\n", v22, v24, (const char *)objc_msgSend(v25, "UTF8String"));

            v19 = 0;
            goto LABEL_12;
          }

          v13 = (char *)v13 + 1;
          v14 = v9;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[BRCTLDiagnoseCommand _removeDirectoryIfNecessaryAtPath:](v30, "_removeDirectoryIfNecessaryAtPath:", v6);
    v19 = 1;
LABEL_12:
    v8 = v31;
  }
  else
  {
    v26 = __stderrp;
    v27 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
    fprintf(v26, "Error listing contents of directory %s: %s", v27, (const char *)objc_msgSend(v28, "UTF8String"));

    v19 = 0;
  }

  return v19;
}

- (void)prepareDiagnose
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  FILE *v7;
  const char *v8;
  id v9;
  id v10;
  NSFileAttributeKey v11;
  _UNKNOWN **v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _diagnoseParentPath](self, "_diagnoseParentPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v3, "fileExistsAtPath:", v2) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v11 = NSFilePosixPermissions;
    v12 = &off_100027F88;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = 0;
    v6 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 0, v5, &v10);
    v4 = v10;

    if ((v6 & 1) == 0)
    {
      v7 = __stderrp;
      v8 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
      fprintf(v7, "Unable to create directory at path '%s'; %s.\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

    }
  }

}

- (void)diagnoseWithPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char *v16;
  FILE *v17;
  FILE *v18;
  void *v19;
  id v20;
  NSString *documentPath;
  void *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  id v26;
  id v27;
  FILE *v28;
  FILE *v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BRCTLDiagnoseCommand *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSArray *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *i;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  unsigned int v117;
  id v118;
  const __CFString *v119;
  id v120;
  void *v121;
  FILE *v122;
  void *v123;
  NSArray *obj;
  id obja;
  void *v126;
  id v127;
  void *v128;
  BRCTLDiagnoseCommand *v129;
  void *v130;
  id v131;
  _QWORD v132[4];
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  _QWORD v144[5];
  _BYTE v145[128];
  _BYTE v146[128];

  v4 = a3;
  signal(2, (void (__cdecl *)(int))1);
  v5 = objc_alloc_init((Class)BRTask);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR(".tgz")) & 1) != 0)
  {
    v7 = CFSTR("tgz");
    v8 = -4;
LABEL_5:
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend(v4, "length") + v8));

    v4 = (id)v9;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".tar.gz")))
  {
    v7 = CFSTR("tar.gz");
    v8 = -7;
    goto LABEL_5;
  }
  v7 = CFSTR("tgz");
LABEL_7:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _prepareTargetDiagnoseDirPath:](self, "_prepareTargetDiagnoseDirPath:", v4));

  if (!v10)
    sub_100017400(v11);
  v119 = v7;
  if (self->continueExecution)
  {
    v12 = v10;
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand _createSecureDiagnoseDirectory](self, "_createSecureDiagnoseDirectory"));

    if (!v12)
      sub_100017414(v13);
  }
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("diagnose-errors.log"))));
  v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
  if (self->continueExecution)
    v16 = "w+";
  else
    v16 = "w";
  v17 = fopen(v15, v16);
  if (!v17)
    sub_100017428(v14);
  v18 = v17;
  err_set_file(v17);
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_100016738;
  v144[3] = &unk_100025828;
  v144[4] = v18;
  err_set_exit_b(v144);
  v122 = v18;
  v123 = v5;
  v129 = self;
  if (self->continueExecution)
  {
    v126 = v12;
    v19 = 0;
  }
  else
  {
    v20 = objc_retainAutorelease(v10);
    printf("collecting logs at \"%s\"\n", (const char *)objc_msgSend(v20, "fileSystemRepresentation"));
    fflush(__stdoutp);
    puts("- sending SIGINFO to cloudd");
    sub_10000DF2C("cloudd", 29);
    documentPath = self->_documentPath;
    if (documentPath)
    {
      v127 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL brctl_fileURLWithUserInput:](NSURL, "brctl_fileURLWithUserInput:", -[NSString fileSystemRepresentation](documentPath, "fileSystemRepresentation")));
      v143 = 0;
      v23 = objc_msgSend(v22, "checkPromisedItemIsReachableAndReturnError:", &v143);
      v24 = v143;
      if ((v23 & 1) != 0)
      {
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent")));
        printf("- collecting document-specific information for \"%s\"\n", (const char *)objc_msgSend(v25, "fileSystemRepresentation"));

        v26 = v12;
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("document-info.txt"))));
        v28 = fopen((const char *)objc_msgSend(v27, "fileSystemRepresentation"), "w");

        if (v28)
        {
          sub_10000AC00(v28, v22, -1);
          fclose(v28);
        }
      }
      else
      {
        v26 = v12;
        v29 = __stderrp;
        v30 = -[NSString fileSystemRepresentation](self->_documentPath, "fileSystemRepresentation");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description")));
        fprintf(v29, "can't collect document-specific information at \"%s\": %s\n", v30, (const char *)objc_msgSend(v31, "UTF8String"));

        self = v129;
      }

      v12 = v26;
      v20 = v127;
    }
    if ((self->_sudoed || self->_rootUser) && !self->_isSysdiagnose)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("taskinfo-threads.txt")));
      objc_msgSend(v5, "setRedirectStdoutToFileAtPath:", v32);
      objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 1);
      objc_msgSend(v5, "setCommandWithArguments:", CFSTR("/usr/bin/taskinfo --threads bird"));
      -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("collecting taskinfo"));
    }
    else
    {
      v32 = 0;
    }
    if (!self->_isSysdiagnose)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("launchctl-print.txt")));

      objc_msgSend(v5, "setRedirectStdoutToFileAtPath:", v33);
      objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 1);
      objc_msgSend(v5, "setCommand:", CFSTR("/bin/launchctl print system/com.apple.bird"));
      -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("running launchctl print"));
      if (self->_isSysdiagnose
        || (WriteStackshotReport(CFSTR("CloudDocs diagnostics requested"), 3131746989), self->_isSysdiagnose)
        || (-[BRCTLDiagnoseCommand _collectFileCoordinationDumpAtPath:](self, "_collectFileCoordinationDumpAtPath:", v12), self->_isSysdiagnose)|| self->skipLogArchive|| self->_isUITests)
      {
        v32 = v33;
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("system_logs.logarchive")));

        objc_msgSend(v5, "setRedirectStdoutToFileDescriptor:", 1);
        objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 2);
        objc_msgSend(v5, "setCommand:", CFSTR("/usr/bin/log collect --output \"%@\"), v32);
        -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("collecting system logarchive"));
      }
    }
    if ((objc_msgSend(v12, "isEqualToString:", v20) & 1) == 0
      && !-[BRCTLDiagnoseCommand _moveSecuredDiagnoseDirToTargetPath:targetPath:](self, "_moveSecuredDiagnoseDirToTargetPath:targetPath:", v12, v20))
    {
      fclose(__stderrp);
      goto LABEL_108;
    }
    v34 = v32;
    sub_10000E23C();
    v35 = sub_10000DF24();
    if ((v35 & 1) == 0)
      sub_10001748C(v35);
    objc_msgSend(v5, "resetRedirect");
    v36 = v20;

    objc_msgSend(v5, "setRedirectStdoutToFileDescriptor:", 1);
    objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 2);
    if (self->_isSysdiagnose)
    {
      objc_msgSend(v5, "setCommand:", CFSTR("/usr/bin/brctl diagnose -c %@"), self->diagnoseArgs);
      -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("running userland diagnostics"));
    }
    if (!self->continueExecution && self->_isSysdiagnose)
    {
      v115 = 0;
      v112 = 0;
      v12 = v36;
      v32 = v34;
      goto LABEL_107;
    }
    v126 = v36;
    v19 = v34;
  }
  v120 = v14;
  v121 = v10;
  v128 = v6;
  v141 = 0u;
  v142 = 0u;
  v140 = 0u;
  v139 = 0u;
  obj = self->_allAccounts;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v140;
    do
    {
      v41 = 0;
      v42 = v39;
      do
      {
        if (*(_QWORD *)v140 != v40)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "accountIdentifier"));
        v45 = self;
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand appSupportPathForPersona:](self, "appSupportPathForPersona:", v44));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringByAppendingPathComponent:", CFSTR("CloudDocs/session/containers")));

        if (objc_msgSend(v128, "fileExistsAtPath:", v39))
        {
          puts("- copying containers plists");
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "accountIdentifier"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("containers-%@"), v47));
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", v48));

          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("^.*\\.plist$")));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v50));
          -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](v45, "_collectFilesWithPredicate:srcPath:dstPath:", v51, v39, v49);

          v19 = (void *)v49;
        }
        v41 = (char *)v41 + 1;
        v42 = v39;
        self = v129;
      }
      while (v38 != v41);
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
    }
    while (v38);
  }
  else
  {
    v39 = 0;
  }

  v52 = v126;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("brctl-dump.txt")));

  v54 = v123;
  objc_msgSend(v123, "setRedirectStdoutToFileAtPath:", v53);
  objc_msgSend(v123, "setRedirectStderrToFileDescriptor:", 1);
  objc_msgSend(v123, "setCommandWithArguments:", CFSTR("/usr/bin/brctl dump -i"));
  -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v123, CFSTR("dumping daemon state"));
  v55 = -[BRCTLDiagnoseCommand _truncateFileForiOSSysdiagnose:](self, "_truncateFileForiOSSysdiagnose:", v53);
  if (self->_shouldCollectEnterpriseData)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v56 = self->_allAccounts;
    v57 = -[NSArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v58; i = (char *)i + 1)
        {
          if (*(_QWORD *)v136 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v61, "isDataSeparated"))
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "accountIdentifier"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("brctl-dump-enterprise-%@.txt"), v62));
            v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", v63));

            v54 = v123;
            objc_msgSend(v123, "setRedirectStdoutToFileAtPath:", v64);
            objc_msgSend(v123, "setRedirectStderrToFileDescriptor:", 1);
            objc_msgSend(v123, "setCommandWithArguments:", CFSTR("/usr/bin/brctl dump -i -e"));
            -[BRCTLDiagnoseCommand _execTask:withLabel:](v129, "_execTask:withLabel:", v123, CFSTR("dumping enterprise daemon state"));
            -[BRCTLDiagnoseCommand _truncateFileForiOSSysdiagnose:](v129, "_truncateFileForiOSSysdiagnose:", v64);
            v53 = (void *)v64;
          }
        }
        v58 = -[NSArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
      }
      while (v58);
    }

    self = v129;
    v52 = v126;
  }
  if (!self->_iOSSysdiagnose
    && (!fp_shouldObfuscateFilenames(v55) || _brc_log_is_internal_install()))
  {
    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("db")));

    objc_msgSend(v54, "setRedirectStdoutToFileDescriptor:", 1);
    objc_msgSend(v54, "setCommand:", CFSTR("/usr/bin/brctl backup \"%@\"), v65);
    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v54, CFSTR("copying client.db and server.db"));
    v53 = (void *)v65;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("brctl-container-list.txt")));

  objc_msgSend(v54, "setRedirectStdoutToFileAtPath:", v66);
  objc_msgSend(v54, "setRedirectStderrToFileDescriptor:", 1);
  objc_msgSend(v54, "setCommandWithArguments:", CFSTR("/usr/bin/brctl container list"));
  -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v54, CFSTR("listing containers"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Logs/CrashReporter/DiagnosticLogs/iCloudDriveApp.asl/"), "br_pathRelativeToDirectory:", 5));
  -[BRCTLDiagnoseCommand _collectLogs:diagnosePath:](self, "_collectLogs:diagnosePath:", v67, v52);

  -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("collecting clouddocs logs"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.clouddocs.asl")));

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand cloudDocsLogPath](self, "cloudDocsLogPath"));
  -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v69, v68);

  -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
  -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("collecting cloudkit logs"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.cloudkit")));

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand cloudKitLogPath](self, "cloudKitLogPath"));
  -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v71, v70);

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.cloudkit.asl")));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand cloudKitLogPath](self, "cloudKitLogPath"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringByAppendingPathExtension:", CFSTR("asl")));
  -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v74, v72);

  -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
  if (!self->_isSysdiagnose)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF LIKE 'ProtectedCloudStorage*'")));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/DiagnosticLogs")));

    v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("PCS")));
    -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v75, v77, v78);

    v72 = (void *)v78;
    v39 = (void *)v77;
  }
  if (!self->_iOSSysdiagnose)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond")));

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond")));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF LIKE '*.plist'")));
    -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v82, v80, v81);

    if (self->_iOSSysdiagnose)
    {
      v72 = v81;
      v39 = v80;
    }
    else
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/DiagnosticLogs/com.apple.nsurlsessiond")));

      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond")));
      -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v39, v72);
      if (!self->_iOSSysdiagnose)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
        v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "stringByAppendingPathComponent:", CFSTR("Logs/com.apple.nsurlsessiond")));

        v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond.asl")));
        -[BRCTLDiagnoseCommand _collectFilesAtPath:dstPath:](self, "_collectFilesAtPath:dstPath:", v85, v86);
        v72 = (void *)v86;
        v39 = (void *)v85;
      }
    }
  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Logs"), "br_pathRelativeToDirectory:", 5));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DuetLoggingDetailed.apsd"), "br_pathRelativeToPath:", v87));
  -[BRCTLDiagnoseCommand _collectLogs:diagnosePath:](self, "_collectLogs:diagnosePath:", v88, v52);

  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DuetHeuristic-BM.log"), "br_pathRelativeToPath:", v87));
  -[BRCTLDiagnoseCommand _collectLogs:diagnosePath:](self, "_collectLogs:diagnosePath:", v89, v52);

  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CoreDuetAdmission.asl"), "br_pathRelativeToPath:", v87));
  -[BRCTLDiagnoseCommand _collectLogs:diagnosePath:](self, "_collectLogs:diagnosePath:", v90, v52);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
  v92 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "stringByAppendingPathComponent:", CFSTR("Logs")));

  if (!self->_iOSSysdiagnose)
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF LIKE 'coreduetd.log*'")));
    -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v93, v92, v52);

  }
  if (!self->_isSysdiagnose)
  {
    v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", CFSTR("syslog.txt")));

    objc_msgSend(v123, "setRedirectStdoutToFileAtPath:", v94);
    objc_msgSend(v123, "setCommandWithArguments:", CFSTR("/usr/bin/syslog"));
    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v123, CFSTR("collecting syslog"));
    v72 = (void *)v94;
  }
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/System/Library/LaunchDaemons/com.apple.cloudd.plist")));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("EnvironmentVariables")));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("CFNETWORK_DIAGNOSTICS_LOG_FILE")));

  if (!self->_isSysdiagnose && v96 && objc_msgSend(v128, "fileExistsAtPath:", v96))
  {
    v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("cloudd-cfnetwork-log.txt")));

    objc_msgSend(v123, "setRedirectStdoutToFileDescriptor:", 1);
    objc_msgSend(v123, "setRedirectStderrToFileDescriptor:", 2);
    objc_msgSend(v123, "setCommand:", CFSTR("/bin/cp \"%@\" \"%@\"), v96, v97);
    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v123, CFSTR("collecting CFNetwork log"));
    v72 = (void *)v97;
  }
  if (!self->_iOSSysdiagnose)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand libraryPathForPersona:](self, "libraryPathForPersona:", 0));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "stringByAppendingPathComponent:", CFSTR("Logs/PersistentConnection")));

    if (objc_msgSend(v128, "fileExistsAtPath:", v99))
    {
      v100 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("PersistentConnection")));

      objc_msgSend(v123, "setCommand:", CFSTR("/bin/mkdir \"%@\"), v100);
      -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v123, CFSTR("collecting APSD logs"));
      v132[0] = _NSConcreteStackBlock;
      v132[1] = 3221225472;
      v132[2] = sub_100016740;
      v132[3] = &unk_100025850;
      v92 = v99;
      v133 = v92;
      v134 = v128;
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v132));
      -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v101, v92, v100);

      v72 = (void *)v100;
    }
    else
    {
      v92 = v99;
    }
  }
  if (self->_isSysdiagnose)
  {
    v102 = v92;
    v32 = v72;
    v5 = v123;
  }
  else
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Logs/CrashReporter/DiagnosticLogs/Accounts"), "br_pathRelativeToDirectory:", 5));

    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("^(accounts\\.|appleaccount_|appleid\\.log\\.|authkit\\.log\\.).*$")));
    v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("Accounts")));

    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v103));
    -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", v105, v102, v104);

    if (self->_isSysdiagnose)
    {
      v5 = v123;
    }
    else
    {
      v5 = v123;
      if (!self->_isUITests)
        -[BRCTLDiagnoseCommand _collectCrashesAndSpinsAtPath:processes:](self, "_collectCrashesAndSpinsAtPath:processes:", v126, &off_100027F58);
    }
    v32 = (void *)v104;
  }
  -[BRCTLDiagnoseCommand _collectMobileDocumentsAtPath:containerID:](self, "_collectMobileDocumentsAtPath:containerID:", v126, self->_mobileDocsContainerID);
  -[BRCTLDiagnoseCommand _collectDefaultsAtPath:](self, "_collectDefaultsAtPath:", v126);
  if (!self->_isSysdiagnose && !self->_isUITests)
  {
    v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("pcs-status.txt")));

    objc_msgSend(v5, "setRedirectStdoutToFileAtPath:", v106);
    objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/usr/libexec/pcsstatus"), "));
    objc_msgSend(v5, "setCommandWithArguments:", v107);

    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("running pcs status"));
    -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("collecting Wallet diagnostics"));
    v108 = -[objc_class generateUbiquityDiagnosticsFile:](off_10002A8F0(), "generateUbiquityDiagnosticsFile:", 1);
    v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "path"));
    -[BRCTLDiagnoseCommand _collectLogs:diagnosePath:](self, "_collectLogs:diagnosePath:", v110, v126);

    -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
    v32 = (void *)v106;
  }
  printf("- collecting package extensions...");
  fflush(__stdoutp);
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand appSupportPathForPersona:](self, "appSupportPathForPersona:", 0));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "stringByAppendingPathComponent:", CFSTR("CloudDocs/pkg_extensions.plist")));

  v6 = v128;
  if (objc_msgSend(v128, "fileExistsAtPath:", v112))
  {
    v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("sharedPkgExtensions.plist")));

    -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:", 0, v112, v113);
    v32 = (void *)v113;
  }
  puts(" done");
  fflush(__stdoutp);
  if (self->_full)
  {
    if (self->_isSysdiagnose)
      goto LABEL_103;
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("brctl-check-local.txt")));

    objc_msgSend(v5, "setRedirectStdoutToFileAtPath:", v114);
    objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 1);
    objc_msgSend(v5, "setCommandWithArguments:", CFSTR("/usr/bin/brctl check local"));
    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("running local checks"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", CFSTR("brctl-check-server.txt")));

    objc_msgSend(v5, "setRedirectStdoutToFileAtPath:", v32);
    objc_msgSend(v5, "setRedirectStderrToFileDescriptor:", 1);
    objc_msgSend(v5, "setCommandWithArguments:", CFSTR("/usr/bin/brctl check server"));
    -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v5, CFSTR("running server checks"));
  }
  if (!self->_isSysdiagnose)
  {
    obja = v32;
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathExtension:", v119));
    objc_msgSend(v5, "resetRedirect");
    -[BRCTLDiagnoseCommand _printActionStartWithLabel:](self, "_printActionStartWithLabel:", CFSTR("archiving diagnose"));
    v131 = 0;
    v117 = -[BRCTLDiagnoseCommand _tar_c:withContentsOfDirectory:error:](self, "_tar_c:withContentsOfDirectory:error:", v116, v126, &v131);
    v115 = v131;
    if (!v117)
      sub_10001744C(self, v115);
    -[BRCTLDiagnoseCommand _printActionEnd](self, "_printActionEnd");
    v118 = objc_retainAutorelease(v116);
    printf("\nplease attach the following file to your radar:\n%s\n\n", (const char *)objc_msgSend(v118, "fileSystemRepresentation"));
    -[BRCTLDiagnoseCommand _removeDirectoryIfNecessaryAtPath:](self, "_removeDirectoryIfNecessaryAtPath:", v126);

    v32 = obja;
    goto LABEL_106;
  }
LABEL_103:
  v115 = 0;
LABEL_106:

  v14 = v120;
  v10 = v121;
  v12 = v126;
LABEL_107:
  err_set_file(0);
  err_set_exit_b(0);
  fclose(v122);

LABEL_108:
}

- (void)_listFoldersUnderPath:(id)a3 withOutPath:(id)a4 listAsPlainFile:(BOOL)a5 label:(id)a6
{
  const char *v9;
  id v10;
  id v11;
  id v12;

  if (a5)
    v9 = "d";
  else
    v9 = "";
  v10 = a6;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[BRTask taskWithCommand:](BRTask, "taskWithCommand:", CFSTR("%@%s \"%@\"), CFSTR("/bin/ls -laRie@T"), v9, a3));
  objc_msgSend(v12, "setRedirectStdoutToFileAtPath:", v11);

  objc_msgSend(v12, "setRedirectStderrToFileDescriptor:", 1);
  -[BRCTLDiagnoseCommand _execTask:withLabel:](self, "_execTask:withLabel:", v12, v10);

}

- (void)_listSyncedFoldersWithDiagnosePath:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("ls-synced-folders.txt")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_allAccounts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLDiagnoseCommand containersPathForPersona:](self, "containersPathForPersona:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("listing containers files for account %@"), v12));
        -[BRCTLDiagnoseCommand _listFoldersUnderPath:withOutPath:listAsPlainFile:label:](self, "_listFoldersUnderPath:withOutPath:listAsPlainFile:label:", v11, v4, 0, v13);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[BRCTLDiagnoseCommand _truncateFileForiOSSysdiagnose:](self, "_truncateFileForiOSSysdiagnose:", v4);
}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  NSString *v5;
  NSString *mobileDocsContainerID;
  NSString *v7;
  NSString *documentPath;
  NSString *v9;
  NSString *deviceName;
  id v11;

  switch(a3)
  {
    case 'c':
      self->continueExecution = 1;
      break;
    case 'd':
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
      documentPath = self->_documentPath;
      self->_documentPath = v7;

      break;
    case 'e':
      self->_skipRevealInFinder = 1;
      break;
    case 'f':
      self->_full = 1;
      break;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'm':
    case 'o':
    case 'p':
    case 'q':
      return;
    case 'l':
      self->skipDarwinupList = 1;
      break;
    case 'n':
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[BRTask sanitizeStringForFilename:](BRTask, "sanitizeStringForFilename:", v11));
      deviceName = self->_deviceName;
      self->_deviceName = v9;

      break;
    case 'r':
      self->skipLogArchive = 1;
      break;
    case 's':
      self->_isSysdiagnose = 1;
      self->_iOSSysdiagnose = 1;
      break;
    case 't':
      self->_isUITests = 1;
      break;
    default:
      if (a3 == 77)
      {
        if (a4)
        {
          v5 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
          mobileDocsContainerID = self->_mobileDocsContainerID;
          self->_mobileDocsContainerID = v5;
        }
        else
        {
          mobileDocsContainerID = self->_mobileDocsContainerID;
          self->_mobileDocsContainerID = 0;
        }

        self->_collectMobileDocs = 1;
      }
      break;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPath, 0);
  objc_storeStrong((id *)&self->_mobileDocsContainerID, 0);
  objc_storeStrong((id *)&self->_containersPath, 0);
  objc_storeStrong((id *)&self->_appSupportPath, 0);
  objc_storeStrong((id *)&self->_cloudKitLogPath, 0);
  objc_storeStrong((id *)&self->_cloudDocsLogPath, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_homePath, 0);
  objc_storeStrong((id *)&self->_allAccounts, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->diagnoseArgs, 0);
}

@end
