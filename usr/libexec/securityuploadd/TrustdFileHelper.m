@implementation TrustdFileHelper

- (BOOL)changeOwnerOfValidFile:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD *v6;
  __CFString *v7;
  const __CFURL *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10000FF4C;
  v17 = sub_10000FF5C;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010230;
  v12[3] = &unk_1000189C0;
  v12[4] = &v13;
  v12[5] = &v19;
  v6 = v12;
  if (qword_10001DBC0 != -1)
  {
    dispatch_once(&qword_10001DBC0, &stru_100018C20);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v7 = CFSTR("trustd/");
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("trustd/%@"), v5));
LABEL_6:
  v8 = sub_100010C24(CFSTR("private/var/protected/"), (uint64_t)v7);

  sub_100010D0C(v8, (uint64_t)v6);
  v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    if (*a4)
    {
      v9 = 0;
    }
    else
    {
      *a4 = objc_retainAutorelease((id)v14[5]);
      v9 = *((unsigned __int8 *)v20 + 24);
    }
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)fixValidPermissions:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;

  if (-[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", CFSTR("valid.sqlite3"), a3)&& (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-shm"), CFSTR("valid.sqlite3"))), v6 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v5, a3), v5, v6)&& (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-wal"), CFSTR("valid.sqlite3"))),
        v8 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v7, a3),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-journal"), CFSTR("valid.sqlite3")));
    v10 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v9, a3);

  }
  else
  {
    v10 = 0;
  }
  return -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", CFSTR(".valid_replace"), a3) & v10;
}

- (BOOL)fixTrustSettingsPermissions:(id *)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  const char *v20;
  int v21;
  NSString *v22;
  void *v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  char *v27;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  char *v43;
  NSErrorUserInfoKey v44;
  void *v45;
  _BYTE v46[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/Library/Security/Trust Settings"), 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v7, 0, &stru_100018A00));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v9)
  {
    v10 = v9;
    v29 = a3;
    v30 = v7;
    v31 = v6;
    v32 = v4;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    v5 = 1;
    v33 = v8;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v34 = 0;
        v35 = 0;
        v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v35, NSURLIsDirectoryKey, &v34);
        v16 = v35;
        v17 = v34;

        if (v15
          && (objc_msgSend(v16, "BOOLValue") & 1) == 0
          && (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension")),
              v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("plist")),
              v18,
              v19)
          && (v20 = (const char *)objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation"),
              chmod(v20, 0x1A4u)))
        {
          v21 = *__error();
          v44 = NSLocalizedDescriptionKey;
          v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change permissions of %s: %s"), v20, strerror(v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v45 = v23;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
          v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v21, v24));

          v25 = sub_100010B28("SecError");
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = strerror(v21);
            *(_DWORD *)buf = 136315394;
            v41 = v20;
            v42 = 2080;
            v43 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
          }

          v5 = 0;
          v8 = v33;
        }
        else
        {
          v11 = v17;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v10);
    if ((v29 == 0) | v5 & 1)
    {
      v6 = v31;
      v4 = v32;
      v7 = v30;
    }
    else
    {
      v6 = v31;
      v4 = v32;
      v7 = v30;
      if (*v29)
      {
        v5 = 0;
      }
      else
      {
        v11 = objc_retainAutorelease(v11);
        v5 = 0;
        *v29 = v11;
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v5 & 1;
}

- (BOOL)changePermissionsOfKeychainDirectoryFile:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10000FF4C;
  v13 = sub_10000FF5C;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FF64;
  v8[3] = &unk_1000189C0;
  v8[4] = &v9;
  v8[5] = &v15;
  sub_100010DA8((uint64_t)v5, (uint64_t)v8);
  if (a4 && !*a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)allowTrustdToReadFilesForMigration:(id *)a3
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;

  v5 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:](self, "changePermissionsOfKeychainDirectoryFile:error:", CFSTR("TrustStore.sqlite3"), a3);
  v6 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:](self, "changePermissionsOfKeychainDirectoryFile:error:", CFSTR("com.apple.security.exception_reset_counter.plist"), a3);
  v7 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:](self, "changePermissionsOfKeychainDirectoryFile:error:", CFSTR("CTExceptions.plist"), a3);
  v8 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:](self, "changePermissionsOfKeychainDirectoryFile:error:", CFSTR("CARevocation.plist"), a3);
  return -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:](self, "changePermissionsOfKeychainDirectoryFile:error:", CFSTR("TransparentConnectionPins.plist"), a3) & v8 & v7 & v6 & v5;
}

- (void)allowTrustdToWriteAnalyticsFiles
{
  sub_100010DA8((uint64_t)CFSTR("Analytics"), (uint64_t)&stru_100018A20);
}

- (void)deleteSystemDbFiles:(__CFString *)a3
{
  const __CFURL *v4;
  CFStringRef v5;
  const __CFURL *v6;
  CFStringRef v7;
  const __CFURL *v8;
  CFStringRef v9;
  const __CFURL *v10;

  v4 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)a3);
  sub_100010D0C(v4, (uint64_t)&stru_100018A40);
  v5 = CFStringCreateWithFormat(0, 0, CFSTR("%@-shm"), a3);
  v6 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)v5);
  sub_100010D0C(v6, (uint64_t)&stru_100018A60);
  if (v5)
    CFRelease(v5);
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@-wal"), a3);
  v8 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)v7);
  sub_100010D0C(v8, (uint64_t)&stru_100018A80);
  if (v7)
    CFRelease(v7);
  v9 = CFStringCreateWithFormat(0, 0, CFSTR("%@-journal"), a3);
  v10 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)v9);
  sub_100010D0C(v10, (uint64_t)&stru_100018AA0);
  if (v9)
    CFRelease(v9);
}

- (void)deleteSupplementalsAssetsDir
{
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFURL *v7;

  v2 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets/OTAPKIContext.plist"));
  sub_100010D0C(v2, (uint64_t)&stru_100018AC0);
  v3 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets/TrustedCTLogs.plist"));
  sub_100010D0C(v3, (uint64_t)&stru_100018AE0);
  v4 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets/TrustedCTLogs_nonTLS.plist"));
  sub_100010D0C(v4, (uint64_t)&stru_100018B00);
  v5 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets/AnalyticsSamplingRates.plist"));
  sub_100010D0C(v5, (uint64_t)&stru_100018B20);
  v6 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets/AppleCertificateAuthorities.plist"));
  sub_100010D0C(v6, (uint64_t)&stru_100018B40);
  v7 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("SupplementalsAssets"));
  sub_100010D0C(v7, (uint64_t)&stru_100018B60);
}

- (void)deleteOldFiles
{
  const __CFURL *v3;

  -[TrustdFileHelper deleteSystemDbFiles:](self, "deleteSystemDbFiles:", CFSTR("crls/valid.sqlite3"));
  v3 = sub_100010C24(CFSTR("Library/Keychains"), (uint64_t)CFSTR("crls"));
  sub_100010D0C(v3, (uint64_t)&stru_100018B80);
  -[TrustdFileHelper deleteSystemDbFiles:](self, "deleteSystemDbFiles:", CFSTR("pinningrules.sqlite3"));
  -[TrustdFileHelper deleteSupplementalsAssetsDir](self, "deleteSupplementalsAssetsDir");
  sub_100010DA8((uint64_t)CFSTR("caissuercache.sqlite3"), (uint64_t)&stru_100018BA0);
  -[TrustdFileHelper deleteSystemDbFiles:](self, "deleteSystemDbFiles:", CFSTR("ocspcache.sqlite3"));
  sub_100010DA8((uint64_t)CFSTR("PriorMitmRoots.plist"), (uint64_t)&stru_100018BC0);
}

- (void)fixFiles:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  _BOOL8 v5;
  id v6;
  const void *v7;
  NSObject *v8;
  uint8_t v9[8];
  id v10;

  v4 = (void (**)(id, _BOOL8, id))a3;
  -[TrustdFileHelper deleteOldFiles](self, "deleteOldFiles");
  -[TrustdFileHelper allowTrustdToWriteAnalyticsFiles](self, "allowTrustdToWriteAnalyticsFiles");
  v10 = 0;
  v5 = -[TrustdFileHelper allowTrustdToReadFilesForMigration:](self, "allowTrustdToReadFilesForMigration:", &v10);
  v6 = v10;
  if (!v5)
  {
    v7 = sub_100010B28("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to change permissions so trustd can read files for migration", v9, 2u);
    }

  }
  v4[2](v4, v5, v6);

}

@end
