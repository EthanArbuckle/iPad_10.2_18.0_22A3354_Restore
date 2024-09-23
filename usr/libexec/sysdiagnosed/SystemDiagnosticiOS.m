@implementation SystemDiagnosticiOS

- (SystemDiagnosticiOS)init
{
  SystemDiagnosticiOS *v2;
  SystemDiagnosticiOS *v3;
  FBSDisplayLayoutMonitor *v4;
  FBSDisplayLayoutMonitor *layoutMonitor;
  FBSDisplayLayoutMonitor *v6;
  id deviceAssertion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SystemDiagnosticiOS;
  v2 = -[SystemDiagnostic init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[SystemDiagnosticiOS setIdsCase:](v2, "setIdsCase:", 0);
    -[SystemDiagnostic setDpClass:](v3, "setDpClass:", 0);
    -[SystemDiagnostic setShouldPostProcess:](v3, "setShouldPostProcess:", 0);
    v4 = (FBSDisplayLayoutMonitor *)objc_msgSend(objc_alloc((Class)FBSDisplayLayoutMonitor), "initWithDisplayType:", 0);
    layoutMonitor = v3->_layoutMonitor;
    v3->_layoutMonitor = v4;

    v6 = v3->_layoutMonitor;
    if (v6)
      -[FBSDisplayLayoutMonitor addObserver:](v6, "addObserver:", v3);
    deviceAssertion = v3->_deviceAssertion;
    v3->_deviceAssertion = 0;

    -[SystemDiagnosticiOS setMaxHistory:](v3, "setMaxHistory:", -1);
  }
  return v3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "elements"));

    if (v11)
    {
      v21 = v8;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "elements"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
            -[SystemDiagnostic setFrontmostBundleID:](self, "setFrontmostBundleID:", v18);

            if (v17)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
              if (v19
                && (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___SBSDisplayLayoutElement) & 1) != 0)
              {
                v20 = objc_msgSend(v17, "layoutRole");

                if (v20 == (id)1)
                  goto LABEL_16;
              }
              else
              {

              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }
LABEL_16:

      v8 = v21;
    }
  }

}

- (id)defaultBaseDirectory
{
  return +[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory");
}

- (void)clearHistory
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
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
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int64_t v27;

  if (-[SystemDiagnosticiOS maxHistory](self, "maxHistory") != -1)
  {
    v3 = -[SDCacheEnumerator initCacheEnumerator]([SDCacheEnumerator alloc], "initCacheEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextValidURL"));
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        v8 = objc_autoreleasePoolPush();
        objc_msgSend(v4, "addObject:", v7);
        objc_autoreleasePoolPop(v8);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextValidURL"));

        v7 = (void *)v9;
      }
      while (v9);
    }
    objc_msgSend(v4, "sortUsingComparator:", &stru_10009A048);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = objc_msgSend(v4, "count");
      v26 = 2048;
      v27 = -[SystemDiagnosticiOS maxHistory](self, "maxHistory");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found %ld files in history with max of %ld", buf, 0x16u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "log:", CFSTR("Found %ld files in history with max of %ld"), objc_msgSend(v4, "count"), -[SystemDiagnosticiOS maxHistory](self, "maxHistory"));

    v11 = objc_msgSend(v4, "count");
    if (v11 > (id)-[SystemDiagnosticiOS maxHistory](self, "maxHistory"))
    {
      v12 = -[SystemDiagnosticiOS maxHistory](self, "maxHistory");
      if (v12 < (unint64_t)objc_msgSend(v4, "count"))
      {
        v13 = 0;
        do
        {

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v12));
            *(_DWORD *)buf = 138412546;
            v25 = v14;
            v26 = 2048;
            v27 = v12;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing '%@' at index '%lu'", buf, 0x16u);

          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v12));
          objc_msgSend(v15, "log:", CFSTR("Removing '%@' at index '%lu'"), v16, v12);

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v12));
          v23 = 0;
          objc_msgSend(v5, "removeItemAtURL:error:", v17, &v23);
          v13 = v23;

          if (v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v12));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
              *(_DWORD *)buf = 138412546;
              v25 = v18;
              v26 = 2112;
              v27 = (int64_t)v19;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error removing '%@': %@", buf, 0x16u);

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v12));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
            objc_msgSend(v20, "log:", CFSTR("Error removing '%@': %@"), v21, v22);

          }
          ++v12;
        }
        while (v12 < (unint64_t)objc_msgSend(v4, "count"));

      }
    }

  }
}

- (BOOL)makeOutputDirectory
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  -[SystemDiagnosticiOS clearHistory](self, "clearHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "stringByAppendingPathComponent:", CFSTR("Latest")));
  objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  LOBYTE(v4) = -[SystemDiagnostic makeTargetDirectory:](self, "makeTargetDirectory:", v6);

  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    v8 = -[SystemDiagnostic makeTargetDirectory:](self, "makeTargetDirectory:", v7);

    if ((v8 & 1) != 0)
      return 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create directory: %@", buf, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    objc_msgSend(v16, "stdoutWrite:", CFSTR("Failed to create directory: %@"), v17);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create directory: %@", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    objc_msgSend(v11, "stdoutWrite:", CFSTR("Failed to create directory: %@"), v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  }
  v18 = (void *)v14;
  objc_msgSend(v13, "log:", CFSTR("Failed to create directory: %@"), v14);

  return 0;
}

- (BOOL)readCoSysdiagnoseSetting
{
  BOOL v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[SystemDiagnosticiOS idsCase](self, "idsCase") == 5 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 2;
  v4 = sub_100029528();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cosysdiagnose")));
  v7 = v6;
  if (v6)
    v3 = objc_msgSend(v6, "integerValue") == (id)1;

  return v3;
}

- (void)createFileAndTransfer:(id)a3 atLocation:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  sub_100023C18(a3, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  LODWORD(self) = objc_msgSend(v6, "sendFileAtPath:forDiagnosticID:withCase:", v9, v7, -[SystemDiagnosticiOS idsCase](self, "idsCase"));

  if ((_DWORD)self)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v8, "removeItemAtPath:error:", v9, 0);

  }
}

- (void)sendUnableToCreateMsg
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("co-sysdiagnose-failed.log")));

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:](self, "createFileAndTransfer:atLocation:", CFSTR("Co-sysdiagnose archive could not be transferred to the phone.\nThe sysdiagnose archive creation on the device failed.\nSee the logfile generated inside the watch's sysdiagnose directory for more details.\n"), v4);
}

- (void)sendFailedInstructions
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("co-sysdiagnose-failed.log")));

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:](self, "createFileAndTransfer:atLocation:", CFSTR("Co-sysdiagnose archive could not be transferred to the phone.\nSince the current sysdiagnose was run before first unlock, it cannot be accessed due to Data Protection class\n\n"), v4);
}

- (void)sendDefaultsInstructions
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("co-sysdiagnose-disabled.log")));

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:](self, "createFileAndTransfer:atLocation:", CFSTR("Co-sysdiagnoses are disabled on the watch.\nTo re-enable them, ssh in to your watch as mobile and run:\ndefaults write com.apple.sysdiagnose cosysdiagnose -BOOL true \n\n"), v4);
}

- (void)sendPathToArchive
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS defaultBaseDirectory](self, "defaultBaseDirectory"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("co-sysdiagnose-location.log")));

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Co-sysdiagnoses was triggered from command line.\nThe local archive can be found at the following path on the watch:\n%s\n\n"), objc_msgSend(v4, "UTF8String")));

  -[SystemDiagnosticiOS createFileAndTransfer:atLocation:](self, "createFileAndTransfer:atLocation:", v5, v6);
}

- (void)dropCoSysdiagnoseError:(id)a3
{
  sub_100023C18(CFSTR("The watch archive did not arrive in time.\nThe transfer will continue in the background and place the archive in the default sysdiagnose directory on the phone.\n\n"), a3);
}

- (void)prompt
{
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  SDPromptDelegate *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  unsigned int v13;
  __int16 v14;
  void *v15;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[SystemDiagnostic earlyPrompt](self, "earlyPrompt");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    *(_DWORD *)buf = 67109378;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt early enabled: %d for id: %@", buf, 0x12u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = -[SystemDiagnostic earlyPrompt](self, "earlyPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v5, "log:", CFSTR("Prompt early enabled: %d for id: %@"), v6, v7);

  v8 = objc_alloc_init(SDPromptDelegate);
  -[SDPromptDelegate setIsEarlyPrompt:](v8, "setIsEarlyPrompt:", -[SystemDiagnostic earlyPrompt](self, "earlyPrompt"));
  -[SDPromptDelegate setOpenIssueFiler:](v8, "setOpenIssueFiler:", -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  -[SDPromptDelegate setDiagnosticID:](v8, "setDiagnosticID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic frontmostBundleID](self, "frontmostBundleID"));
  -[SDPromptDelegate setBundleID:](v8, "setBundleID:", v10);

  -[SDPromptDelegate setDidPartnerTimeout:](v8, "setDidPartnerTimeout:", 0);
  -[SDPromptDelegate setIsCoSysdiagnoseResponse:](v8, "setIsCoSysdiagnoseResponse:", -[SystemDiagnosticiOS idsCase](self, "idsCase") == 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS fetchUserActivity](self, "fetchUserActivity"));
  -[SDPromptDelegate setTtrOverrideURLStr:](v8, "setTtrOverrideURLStr:", v11);

  sub_100029280(v8);
  -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", 0);

}

- (BOOL)triggerWatchCoSysdiagnose
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  uint8_t buf[4];
  void *v20;

  if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 1 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    v4 = objc_msgSend(v3, "isPaired");

    if ((v4 & 1) == 0)
    {
      -[SystemDiagnosticiOS setIdsCase:](self, "setIdsCase:", 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](self, "idsCase")));
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is unpaired, switching to %@", buf, 0xCu);

      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](self, "idsCase")));
      objc_msgSend(v6, "log:", CFSTR("Device is unpaired, switching to %@"), v7);

    }
  }
  v8 = -[SystemDiagnosticiOS readCoSysdiagnoseSetting](self, "readCoSysdiagnoseSetting");
  -[SystemDiagnosticiOS startIDSConnection](self, "startIDSConnection");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](self, "idsCase")));
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The case is %@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](self, "idsCase")));
  objc_msgSend(v10, "stdoutWrite:", CFSTR("The case is %@"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](self, "idsCase")));
  objc_msgSend(v12, "log:", CFSTR("The case is %@"), v13);

  if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 3
    && -[SystemDiagnostic requestSource](self, "requestSource") == 2)
  {
    -[SystemDiagnosticiOS sendPathToArchive](self, "sendPathToArchive");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDispatchGroupForDiagnostic:", v15));

  if (v16)
    dispatch_group_enter(v16);
  v17 = -[SystemDiagnosticiOS idsCase](self, "idsCase") != 5 || v8;
  if ((v17 & 1) == 0)
    -[SystemDiagnosticiOS sendDefaultsInstructions](self, "sendDefaultsInstructions");

  return v8;
}

- (void)triggerAirPodLogs:(BOOL)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v5, "startBTSessionAndTriggerAirPodLogs:", v4);

}

- (void)triggerRemoteSysdiagnoses
{
  _BOOL8 v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = -[SystemDiagnosticiOS triggerWatchCoSysdiagnose](self, "triggerWatchCoSysdiagnose");
  if (NSClassFromString(CFSTR("NRPairedDeviceRegistry")))
    v4 = !v3;
  else
    v4 = 1;
  if (!v4
    && (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 4 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getActivePairedDevice"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000558FC;
    v11[3] = &unk_10009A070;
    v11[4] = self;
    objc_msgSend(v7, "setActivePairedDevice:withActiveDeviceAssertionHandler:", v6, v11);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic prepareCoSysdiagnoseParams](self, "prepareCoSysdiagnoseParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v8, "triggerCoSysdiagnosesWithParams:forDiagnosticID:", v9, v10);

  -[SystemDiagnosticiOS triggerAirPodLogs:](self, "triggerAirPodLogs:", v3);
}

- (void)gatherDiagnostic
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
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  __CFNotificationCenter *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v3, "setMayStartExecuting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v4, "readyToReceiveCoSysdiagnosesAtDir:forDiagnosticID:", v5, v6);

  -[SystemDiagnosticiOS triggerRemoteSysdiagnoses](self, "triggerRemoteSysdiagnoses");
  if (-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    objc_msgSend(v7, "waitForCoSysdiagnosesForDiagnosticID:", v8);

    -[SystemDiagnostic endDiagnostics](self, "endDiagnostics");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    objc_msgSend(v3, "setOutputDirectory:", v9);

    objc_msgSend(v3, "setPushBufferDelegate:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
    -[SystemDiagnostic setOldestDateCreatedCutoff:](self, "setOldestDateCreatedCutoff:", v10);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting start notification", buf, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Posting start notification"));

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.sysdiagnose.sysdiagnoseStarted"), 0, 0, 1u);
    -[SystemDiagnostic executeDiagnosticContainers](self, "executeDiagnosticContainers");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting stop notification", v15, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Posting stop notification"));

    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v14, CFSTR("com.apple.sysdiagnose.sysdiagnoseStopped"), 0, 0, 1u);
  }

}

- (void)launchSettings_async
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_10009A090);

}

- (void)configureDefaultSettings
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint8_t buf[4];
  int64_t v8;

  v3 = sub_100045E60();
  if ((_DWORD)v3)
  {
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", 0);
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", 1);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 2);
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", 1);
  }
  else
  {
    v5 = sub_10002334C(v3, v4);
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", 0);
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", v5);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0);
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", 1);
    -[SystemDiagnostic setEarlyPrompt:](self, "setEarlyPrompt:", v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Seed check : %ld", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Seed check : %ld"), -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));

  }
}

- (void)getUserSettings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = sub_100029528();
  v13 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tailspinOnly")));
  v5 = v4;
  if (v4)
    -[SystemDiagnosticiOS setTailspinOnly:](self, "setTailspinOnly:", objc_msgSend(v4, "BOOLValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("postCompletion")));

  if (v6)
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("vibrateStart")));

  if (v7)
    -[SystemDiagnosticiOS setVibrateStart:](self, "setVibrateStart:", objc_msgSend(v7, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("statusBar")));

  if (v8)
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", objc_msgSend(v8, "integerValue"));
  if (-[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose"))
  {
    v9 = v8;
    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cosysdiagnose")));

  if (v9)
  {
    if (!-[SystemDiagnosticiOS idsCase](self, "idsCase") || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
    {
      v10 = (uint64_t)objc_msgSend(v9, "BOOLValue");
LABEL_20:
      -[SystemDiagnosticiOS setIdsCase:](self, "setIdsCase:", v10);
      goto LABEL_21;
    }
    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
    {
      if (objc_msgSend(v9, "BOOLValue"))
        v10 = 3;
      else
        v10 = 2;
      goto LABEL_20;
    }
  }
LABEL_21:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("earlyPrompt")));

  if (v11)
    -[SystemDiagnostic setEarlyPrompt:](self, "setEarlyPrompt:", objc_msgSend(v11, "BOOLValue"));
  if (-[SystemDiagnostic disableUIFeedback](self, "disableUIFeedback"))
  {
    -[SystemDiagnosticiOS setOpenIssueFiler:](self, "setOpenIssueFiler:", 0);
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("maxHistory")));

  if (v12)
    -[SystemDiagnosticiOS setMaxHistory:](self, "setMaxHistory:", objc_msgSend(v12, "integerValue"));

}

- (void)overrideSettings
{
  int64_t v3;
  unsigned int v4;
  uint64_t v5;

  if (-[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose"))
  {
    v3 = -[SystemDiagnostic coSysdiagnose](self, "coSysdiagnose");
    v4 = -[SystemDiagnosticiOS idsCase](self, "idsCase");
    if (v3 == 2)
    {
      if (!v4 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
      {
        v5 = 1;
LABEL_15:
        -[SystemDiagnosticiOS setIdsCase:](self, "setIdsCase:", v5);
        return;
      }
      if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
      {
        v5 = 3;
        goto LABEL_15;
      }
    }
    else
    {
      if (!v4 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
      {
        v5 = 0;
        goto LABEL_15;
      }
      if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 2 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 3)
      {
        v5 = 2;
        goto LABEL_15;
      }
    }
  }
}

- (void)getSettings
{
  -[SystemDiagnosticiOS configureDefaultSettings](self, "configureDefaultSettings");
  -[SystemDiagnosticiOS getUserSettings](self, "getUserSettings");
  -[SystemDiagnosticiOS overrideSettings](self, "overrideSettings");
}

- (id)searchForTransfer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v22 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/IdentityServices/incomingfiles")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0));
  v21 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v5, 4, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v23 = 0;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
        v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("sysdiagnose"));

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = 0;
          objc_msgSend(v12, "getResourceValue:forKey:error:", &v25, NSURLCreationDateKey, 0);
          v16 = v25;
          if (objc_msgSend(v16, "compare:", v7) == (id)1)
          {
            v17 = v16;

            v18 = v12;
            v23 = v18;
            v7 = v17;
          }

        }
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v23 = 0;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
  return v19;
}

- (id)parseSizeToString:(unint64_t)a3
{
  NSString *v3;

  if (a3 > 0x100000)
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu MB"), (unint64_t)(int)a3 >> 20);
  else
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu KB"), a3 >> 10);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)run
{
  id v3;
  char **v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  FBSDisplayLayoutMonitor *layoutMonitor;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  FBSDisplayLayoutMonitor *v19;
  SDPromptDelegate *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  void *v46;
  id v47;
  void *v48;
  char *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  dispatch_time_t v58;
  id v59;
  id v60;
  id v61;
  unsigned __int8 v62;
  uint64_t v63;
  void *i;
  int v65;
  id v66;
  void *v67;
  SystemDiagnosticiOS *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  dispatch_time_t v74;
  dispatch_queue_global_t global_queue;
  NSObject *v76;
  void *v77;
  id deviceAssertion;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned __int8 v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unsigned int v119;
  unsigned int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  unsigned __int8 v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  NSObject *group;
  void *v144;
  __CFString *v145;
  id v146;
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  char v153;
  objc_super v154;
  NSFileAttributeKey v155;
  _UNKNOWN **v156;
  _BYTE v157[128];
  _BYTE buf[12];
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  void *v162;
  uint64_t v163;

  sub_100027B48();
  -[SystemDiagnosticiOS getSettings](self, "getSettings");
  v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done reading settings: issueFiler %ld", buf, 0xCu);
  }

  v4 = &selRef_vibrateStart;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v5, "log:", CFSTR("Done reading settings: issueFiler %ld"), -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));

  if ((sub_100045E60() & 1) == 0)
    -[SystemDiagnosticiOS setStatusBar:](self, "setStatusBar:", 0);
  if (-[SystemDiagnostic requestSource](self, "requestSource") == 1
    || -[SystemDiagnostic requestSource](self, "requestSource") == 4
    || -[SystemDiagnostic deShowFeedback](self, "deShowFeedback"))
  {
    sub_1000284B4(-[SystemDiagnosticiOS vibrateStart](self, "vibrateStart"), -[SystemDiagnosticiOS statusBar](self, "statusBar"));
  }
  if (!-[SystemDiagnostic requestSource](self, "requestSource"))
    sub_100062738(&v163, buf);
  v6 = -[SystemDiagnostic requestSource](self, "requestSource");
  if (v6 > 5)
  {
LABEL_17:
    v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected request", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "stdoutWrite:", CFSTR("unexpected request"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("unexpected request"));

    goto LABEL_20;
  }
  if (((1 << v6) & 0x2C) == 0)
  {
    if (((1 << v6) & 0x12) != 0)
    {
      if (-[SystemDiagnosticiOS tailspinOnly](self, "tailspinOnly"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring full sysdiagnose request due to tailspin only user preference.", buf, 2u);
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v7, "stdoutWrite:", CFSTR("ignoring full sysdiagnose request due to tailspin only user preference."));

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v8, "log:", CFSTR("ignoring full sysdiagnose request due to tailspin only user preference."));

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
        sub_100024C68(v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v10, "closeSysdiagnoseSession");

        sub_1000297AC(0);
        return;
      }
      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_20:
  layoutMonitor = self->_layoutMonitor;
  if (layoutMonitor)
  {
    -[FBSDisplayLayoutMonitor invalidate](layoutMonitor, "invalidate");
    v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic frontmostBundleID](self, "frontmostBundleID"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Front-most bundleID is %@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic frontmostBundleID](self, "frontmostBundleID"));
    objc_msgSend(v17, "log:", CFSTR("Front-most bundleID is %@"), v18);

    v19 = self->_layoutMonitor;
    self->_layoutMonitor = 0;

  }
  v154.receiver = self;
  v154.super_class = (Class)SystemDiagnosticiOS;
  -[SystemDiagnostic run](&v154, "run");
  v20 = objc_alloc_init(SDPromptDelegate);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  -[SDPromptDelegate setDiagnosticID:](v20, "setDiagnosticID:", v21);

  -[SDPromptDelegate setOpenIssueFiler:](v20, "setOpenIssueFiler:", -[SystemDiagnosticiOS openIssueFiler](self, "openIssueFiler"));
  -[SDPromptDelegate setDidPartnerTimeout:](v20, "setDidPartnerTimeout:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic frontmostBundleID](self, "frontmostBundleID"));
  -[SDPromptDelegate setBundleID:](v20, "setBundleID:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getDispatchGroupForDiagnostic:", v24));

  if (v25)
  {
    dispatch_group_leave(v25);
  }
  else
  {
    v26 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Expecting a co-sysdiagnose for %@, but no dispatch group was found.", buf, 0xCu);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    objc_msgSend(v28, "log:", CFSTR("Expecting a co-sysdiagnose for %@, but no dispatch group was found."), v29);

  }
  switch(-[SystemDiagnosticiOS idsCase](self, "idsCase"))
  {
    case 1:
    case 4:
      v30 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("co-"), "stringByAppendingString:", v30));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathComponent:", v32));

      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathExtension:", CFSTR("tar")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
      v35 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = CFSTR("Waiting for Watch diagnostics...");
        v159 = 2112;
        v160 = (uint64_t)v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ -- %@", buf, 0x16u);

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      objc_msgSend(v37, "stdoutWrite:", CFSTR("%@ -- %@"), CFSTR("Waiting for Watch diagnostics..."), v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      v145 = CFSTR("Waiting for Watch diagnostics...");
      objc_msgSend(v39, "log:", CFSTR("%@ -- %@"), CFSTR("Waiting for Watch diagnostics..."), v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v41, "sendProgress:phase:toPeers:", 4, 0, 0.0);

      v153 = 0;
      v141 = v34;
      v139 = v33;
      v42 = objc_msgSend(v34, "fileExistsAtPath:isDirectory:", v33, &v153);
      if ((v42 & (v153 != 0)) != 0)
        v43 = 0;
      else
        v43 = 1801;
      group = v25;
      v138 = (void *)v30;
      if (!v25)
      {
        v140 = 0;
        v142 = 0;
        goto LABEL_96;
      }
      if ((v42 & (v153 != 0)) != 0)
      {
        v140 = 0;
        v142 = 0;
        goto LABEL_96;
      }
      v142 = 0;
      v140 = 0;
      v44 = 1;
      v45 = -1;
      v145 = CFSTR("Waiting for Watch diagnostics...");
      while (2)
      {
        if (!-[SystemDiagnostic didComplete](self, "didComplete"))
          goto LABEL_96;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        v47 = objc_msgSend(v46, "transfer_size");

        if (!v47)
          goto LABEL_43;
        if (v142)
        {
          if (!objc_msgSend(v141, "fileExistsAtPath:", v142))
          {
LABEL_43:
            v49 = (char *)v45;
            goto LABEL_46;
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "attributesOfItemAtPath:error:", v142, 0));
          v49 = (char *)objc_msgSend(v48, "fileSize");

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS parseSizeToString:](self, "parseSizeToString:", v49));
          v51 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Transferred: %@ / %@"), v50, v140));

          v52 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          v53 = (double)(unint64_t)v49 / (double)(unint64_t)objc_msgSend(v52, "transfer_size") * 100.0;

          v54 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v54, "sendProgress:phase:toPeers:", 5, 0, v53);
          v145 = (__CFString *)v51;
          v4 = &selRef_vibrateStart;
        }
        else
        {
          v142 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS searchForTransfer:](self, "searchForTransfer:", v139));
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          v54 = v140;
          v49 = (char *)v45;
          v140 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS parseSizeToString:](self, "parseSizeToString:", objc_msgSend(v50, "transfer_size")));
        }

LABEL_46:
        sub_100028344(v145);
        if (v45 != -1)
        {
          if ((unint64_t)v49 >= v45)
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v49[-v45]));
            objc_msgSend(v144, "insertObject:atIndex:", v57, 0);

            if ((unint64_t)objc_msgSend(v144, "count") >= 4)
              objc_msgSend(v144, "removeLastObject");
          }
          else
          {
            v55 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Old size of file is larger than the current size.", buf, 2u);
            }

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
            objc_msgSend(v56, "log:", CFSTR("Old size of file is larger than the current size."));

            objc_msgSend(v144, "insertObject:atIndex:", &off_1000ACFE0, 0);
          }
        }
        v58 = dispatch_time(0, 2000000000);
        if (!dispatch_group_wait(group, v58))
          goto LABEL_96;
        if (v43 > 1)
        {
          v43 -= 2;
          goto LABEL_75;
        }
        if ((sub_100045E60() & v44) == 1)
        {
          *(_QWORD *)buf = 0;
          CFUserNotificationDisplayAlert(10.0, 0, 0, 0, 0, CFSTR("Co-sysdiagnose Timeout Reached"), CFSTR("Continue waiting for co-sysdiagnose or transfer watch archive independently?"), CFSTR("Watch-only"), CFSTR("Co-sysdiagnose"), 0, (CFOptionFlags *)buf);
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v59 = v144;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
          if (v60)
          {
            v61 = v60;
            v62 = 0;
            v63 = *(_QWORD *)v150;
            do
            {
              for (i = 0; i != v61; i = (char *)i + 1)
              {
                if (*(_QWORD *)v150 != v63)
                  objc_enumerationMutation(v59);
                v62 |= (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)i), "longLongValue") > 0;
              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
            }
            while (v61);
          }
          else
          {
            v62 = 0;
          }

          if (*(_QWORD *)buf == 1)
            v65 = 1;
          else
            v65 = v62 & (*(_QWORD *)buf == 3);
          if (v65 == 1)
          {
            v66 = &_os_log_default;
            v4 = &selRef_vibrateStart;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v163 = 0x70904000100;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timeout extended by %d seconds", (uint8_t *)&v163, 8u);
            }

            v67 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v67, "log:", CFSTR("Timeout extended by %d seconds"), 1801);

            v43 = 1801;
          }
          else
          {
            v43 = -1;
            v4 = &selRef_vibrateStart;
          }
          v44 = v65 ^ 1;
LABEL_75:
          v45 = (unint64_t)v49;
          if (v43 < 1)
            goto LABEL_96;
          continue;
        }
        break;
      }
      v43 = -1;
LABEL_96:
      if (-[SystemDiagnostic didComplete](self, "didComplete"))
      {
        deviceAssertion = self->_deviceAssertion;
        v79 = v136;
        if (deviceAssertion)
          objc_msgSend(deviceAssertion, "invalidate");
        if (v43 < 0)
        {
          -[SDPromptDelegate setDidPartnerTimeout:](v20, "setDidPartnerTimeout:", 1);
          v87 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watch archive did not arrive before timeout", buf, 2u);
          }

          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          objc_msgSend(v88, "stdoutWrite:", CFSTR("Watch archive did not arrive before timeout"));

          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          objc_msgSend(v89, "log:", CFSTR("Watch archive did not arrive before timeout"));

          v90 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          objc_msgSend(v90, "setPreferredWifi:", 0);

          v91 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          objc_msgSend(v91, "sendMessage:WithString:", 3, CFSTR("Companion Timedout"));

          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          objc_msgSend(v92, "sendProgress:phase:toPeers:", 6, 0, 0.0);

          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "stringByDeletingLastPathComponent"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("incomplete-"), "stringByAppendingString:", v138));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "stringByAppendingPathComponent:", v94));

          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "stringByAppendingPathExtension:", CFSTR("tar")));
        }
        else
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          objc_msgSend(v80, "sendProgress:phase:toPeers:", 7, 0, 100.0);
        }

        if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          objc_msgSend(v95, "closeSysdiagnoseSession");

        }
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        objc_msgSend(v96, "setTransfer_size:", 0);

        v155 = NSFilePosixPermissions;
        v156 = &off_1000ACFF8;
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1));
        v148 = 0;
        v98 = objc_msgSend(v141, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v139, 0, v97, &v148);
        v99 = v148;

        if ((v98 & 1) == 0)
        {
          v100 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "localizedDescription"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v139;
            v159 = 2112;
            v160 = (uint64_t)v101;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create the co-sysdiagnose directory %@ due to error: %@", buf, 0x16u);

          }
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "localizedDescription"));
          objc_msgSend(v102, "log:", CFSTR("Could not create the co-sysdiagnose directory %@ due to error: %@"), v139, v103);

        }
        if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        else
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        v105 = v104;

        v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "lastPathComponent"));
        v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "stringByAppendingPathComponent:", v106));

        v147 = 0;
        v108 = (void *)v107;
        LOBYTE(v106) = objc_msgSend(v141, "moveItemAtPath:toPath:error:", v105, v107, &v147);
        v137 = v147;
        if ((v106 & 1) == 0)
        {
          v109 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "localizedDescription"));
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v105;
            v159 = 2112;
            v160 = v107;
            v161 = 2112;
            v162 = v110;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move phone directory %@ to location %@ with error %@", buf, 0x20u);

          }
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "localizedDescription"));
          objc_msgSend(v111, "log:", CFSTR("Could not move phone directory %@ to location %@ with error %@"), v105, v108, v112);

        }
        v135 = v105;
        if (v43 < 0 && v142)
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "lastPathComponent"));
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "stringByDeletingPathExtension"));
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "stringByDeletingPathExtension"));
          v116 = v79;
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "stringByAppendingPathExtension:", CFSTR("log")));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "stringByAppendingPathComponent:", v117));
          -[SystemDiagnosticiOS dropCoSysdiagnoseError:](self, "dropCoSysdiagnoseError:", v118);

          v79 = v116;
          v4 = &selRef_vibrateStart;

        }
        v86 = v139;
        if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
        {
          if (-[SystemDiagnostic useParallelCompression](self, "useParallelCompression"))
            v119 = 20;
          else
            v119 = 16;
          sub_100025B9C(v139, v79, v119, 0);
        }
        v120 = -[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall");
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
        if (v120)
        {
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "lastPathComponent"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "stringByAppendingPathComponent:", v122));
          -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v123);

          -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v139);
        }
        else
        {
          v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "lastPathComponent"));
          v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "stringByAppendingPathComponent:", v124));
          -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v125);

          -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v79);
        }

        v82 = v79;
        if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
          v126 = v79;
        else
          v126 = v139;
        v127 = v126;
        if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
          v128 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        else
          v128 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        v129 = v128;

        v146 = 0;
        v130 = objc_msgSend(v141, "moveItemAtPath:toPath:error:", v127, v129, &v146);
        v85 = v146;
        if ((v130 & 1) == 0)
        {
          v131 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedDescription"));
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v127;
            v159 = 2112;
            v160 = (uint64_t)v129;
            v161 = 2112;
            v162 = v132;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move co-sysdiagnose from %@ to %@ with error %@", buf, 0x20u);

          }
          v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
          v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedDescription"));
          objc_msgSend(v133, "log:", CFSTR("Could not move co-sysdiagnose from %@ to %@ with error %@"), v127, v129, v134);

        }
        if (-[SystemDiagnostic requestSource](self, "requestSource") == 3)
          -[SDPromptDelegate setOpenIssueFiler:](v20, "setOpenIssueFiler:", 0);
        sub_1000297AC(v20);

        v25 = group;
        v81 = v138;
      }
      else
      {
        v82 = v136;
        v81 = v138;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelled co-sysdiagnose.", buf, 2u);
        }
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
        objc_msgSend(v83, "stdoutWrite:", CFSTR("Cancelled co-sysdiagnose."));

        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4 + 372, "sharedResourceManager"));
        objc_msgSend(v84, "log:", CFSTR("Cancelled co-sysdiagnose."));

        -[SDPromptDelegate setBundleID:](v20, "setBundleID:", 0);
        -[SDPromptDelegate setOpenIssueFiler:](v20, "setOpenIssueFiler:", 0);
        sub_1000297AC(v20);
        v85 = 0;
        v25 = group;
        v86 = v139;
      }

LABEL_145:
      return;
    case 3:
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
        goto LABEL_94;
      goto LABEL_81;
    case 5:
LABEL_81:
      if (-[SystemDiagnostic dpClass](self, "dpClass") == 3)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
        v72 = objc_msgSend(v69, "sendFileAtPath:forDiagnosticID:withCase:", v70, v71, -[SystemDiagnosticiOS idsCase](self, "idsCase"));

        if (v72)
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate diagnosticID](v20, "diagnosticID"));
          sub_1000296D0(v73);

          sub_100028344(CFSTR("Transferring"));
          v74 = dispatch_time(0, 1801000000000);
          global_queue = dispatch_get_global_queue(0, 0);
          v76 = objc_claimAutoreleasedReturnValue(global_queue);
          dispatch_after(v74, v76, &stru_10009A0B0);

          goto LABEL_145;
        }
      }
      else if (-[SystemDiagnostic dpClass](self, "dpClass") < 1)
      {
        if (-[SystemDiagnostic dpClass](self, "dpClass") < 0)
          -[SystemDiagnosticiOS sendUnableToCreateMsg](self, "sendUnableToCreateMsg");
      }
      else
      {
        -[SystemDiagnosticiOS sendFailedInstructions](self, "sendFailedInstructions");
      }
LABEL_94:
      -[SDPromptDelegate setOpenIssueFiler:](v20, "setOpenIssueFiler:", 0);
      sub_1000297AC(v20);
      goto LABEL_145;
    default:
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 1)
      {
        if (-[SystemDiagnostic didComplete](self, "didComplete"))
          goto LABEL_90;
        v68 = self;
      }
      else
      {
        v68 = (SystemDiagnosticiOS *)v20;
      }
      -[SystemDiagnosticiOS setOpenIssueFiler:](v68, "setOpenIssueFiler:", 0);
LABEL_90:
      sub_1000297AC(v20);
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v77, "closeSysdiagnoseSession");

      }
      goto LABEL_145;
  }
}

- (void)startIDSConnection
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_group_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[8];
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  if (v3)
  {
    v4 = dispatch_group_create();
    v5 = v4;
    if (v4)
    {
      dispatch_group_enter(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executionGroupDictionary"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      objc_msgSend(v6, "setValue:forKey:", v5, v7);

    }
    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 3 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      objc_msgSend(v3, "startCoSysdiagnoseForFilename:", v8);

    }
    v9 = dispatch_group_create();
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localGroupDictionary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      objc_msgSend(v10, "setObject:forKey:", v9, v11);

    }
    if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 1 || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
    {
      if (!v9)
      {
LABEL_18:
        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
            v23[0] = v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));
            v23[1] = v15;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
            objc_msgSend(v3, "sendFilenamePair:", v16);

          }
        }
        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 5)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localTupleDictionary"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic remoteSysdiagnoseID](self, "remoteSysdiagnoseID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
            objc_msgSend(v18, "setObject:forKey:", v19, v20);

          }
        }
        if (-[SystemDiagnosticiOS idsCase](self, "idsCase") == 1
          || -[SystemDiagnosticiOS idsCase](self, "idsCase") == 4)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          objc_msgSend(v21, "setPreferredWifi:", 1);

        }
        goto LABEL_28;
      }
    }
    else
    {
      v12 = -[SystemDiagnosticiOS idsCase](self, "idsCase");
      if (!v9 || v12 != 3)
        goto LABEL_18;
    }
    dispatch_group_enter(v9);
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got nil SystemDiagnosticIDS instance, not starting IDS connection", v22, 2u);
  }
LABEL_28:

}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *layoutMonitor;
  FBSDisplayLayoutMonitor *v4;
  objc_super v5;

  layoutMonitor = self->_layoutMonitor;
  if (layoutMonitor)
  {
    -[FBSDisplayLayoutMonitor invalidate](layoutMonitor, "invalidate");
    v4 = self->_layoutMonitor;
    self->_layoutMonitor = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SystemDiagnosticiOS;
  -[SystemDiagnostic dealloc](&v5, "dealloc");
}

- (id)fetchUserActivity
{
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t *v13;
  uint8_t v14[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;

  if (objc_opt_class(UAUserActivity, a2))
  {
    *(_QWORD *)v14 = 0;
    v15 = v14;
    v16 = 0x3032000000;
    v17 = sub_100058240;
    v18 = sub_100058250;
    v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100058258;
    v11[3] = &unk_10009A100;
    v13 = v14;
    v3 = dispatch_semaphore_create(0);
    v12 = v3;
    +[UAUserActivity currentUserActivityUUIDWithOptions:completionHandler:](UAUserActivity, "currentUserActivityUUIDWithOptions:completionHandler:", 0, v11);
    v4 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v3, v4);
    if (-[SystemDiagnosticiOS validateTTRString:](self, "validateTTRString:", *((_QWORD *)v15 + 5)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *((_QWORD *)v15 + 5);
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Valid TTR URL from user activity %@", buf, 0xCu);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "stdoutWrite:", CFSTR("Valid TTR URL from user activity %@"), *((_QWORD *)v15 + 5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v7, "log:", CFSTR("Valid TTR URL from user activity %@"), *((_QWORD *)v15 + 5));

      v8 = *((id *)v15 + 5);
    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UserActivity framework is not available!", v14, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v9, "stdoutWrite:", CFSTR("UserActivity framework is not available!"));

    v3 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    -[NSObject log:](v3, "log:", CFSTR("UserActivity framework is not available!"));
    v8 = 0;
  }

  return v8;
}

- (BOOL)validateTTRString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Validating TTR string from UserActivity %@", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "stdoutWrite:", CFSTR("Validating TTR string from UserActivity %@"), v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v5, "log:", CFSTR("Validating TTR string from UserActivity %@"), v3);

  if (v3 && (v7 = objc_opt_class(NSString, v6), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
    v11 = 0;
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("tap-to-radar")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host"));
      v11 = objc_msgSend(v12, "isEqualToString:", CFSTR("new"));

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)tailspinOnly
{
  return self->_tailspinOnly;
}

- (void)setTailspinOnly:(BOOL)a3
{
  self->_tailspinOnly = a3;
}

- (BOOL)vibrateStart
{
  return self->_vibrateStart;
}

- (void)setVibrateStart:(BOOL)a3
{
  self->_vibrateStart = a3;
}

- (int64_t)maxHistory
{
  return self->_maxHistory;
}

- (void)setMaxHistory:(int64_t)a3
{
  self->_maxHistory = a3;
}

- (int64_t)openIssueFiler
{
  return self->_openIssueFiler;
}

- (void)setOpenIssueFiler:(int64_t)a3
{
  self->_openIssueFiler = a3;
}

- (int64_t)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(int64_t)a3
{
  self->_statusBar = a3;
}

- (int)idsCase
{
  return self->_idsCase;
}

- (void)setIdsCase:(int)a3
{
  self->_idsCase = a3;
}

- (BOOL)wasLockedAtLaunch
{
  return self->_wasLockedAtLaunch;
}

- (void)setWasLockedAtLaunch:(BOOL)a3
{
  self->_wasLockedAtLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceAssertion, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
