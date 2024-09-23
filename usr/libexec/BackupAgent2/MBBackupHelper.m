@implementation MBBackupHelper

+ (id)driveReadError:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("MBErrorDomain"));

  if (!v8)
  {
    v14 = MBGetDefaultLog(v9, v10);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      *(_DWORD *)buf = 138412546;
      v23 = CFSTR("MBErrorDomain");
      v24 = 2112;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Drive returned error not in domain \"%@\": \"%@\", buf, 0x16u);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      _MBLog(CFSTR("DEFAULT"), "Drive returned error not in domain \"%@\": \"%@\", CFSTR("MBErrorDomain"), v17);

    }
    goto LABEL_10;
  }
  v11 = (uint64_t)objc_msgSend(v5, "code");
  v13 = 103;
  if (v11 <= 10)
  {
    if (v11 == 2)
      goto LABEL_14;
    if (v11 != 4)
    {
LABEL_15:
      v20 = MBGetDefaultLog(v11, v12);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = (const __CFString *)objc_msgSend(v5, "code");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Drive returned unexpected error code: %{MobileBackup:MBError.code}ld", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Drive returned unexpected error code: %{MobileBackup:MBError.code}ld", objc_msgSend(v5, "code"));
      }

LABEL_10:
      v13 = 103;
      goto LABEL_14;
    }
LABEL_13:
    v13 = 205;
    goto LABEL_14;
  }
  if ((unint64_t)(v11 - 11) < 2)
    goto LABEL_13;
  if (v11 != 100)
  {
    if (v11 == 203)
    {
      v13 = 203;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_14:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v13, v5, CFSTR("%@"), v6));

  return v18;
}

+ (id)driveWriteError:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("MBErrorDomain"));

  if (!v8)
  {
    v16 = MBGetDefaultLog(v9, v10);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      *(_DWORD *)buf = 138412546;
      v23 = CFSTR("MBErrorDomain");
      v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Drive returned error not in domain \"%@\": \"%@\", buf, 0x16u);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      _MBLog(CFSTR("DEFAULT"), "Drive returned error not in domain \"%@\": \"%@\", CFSTR("MBErrorDomain"), v19);

    }
    goto LABEL_11;
  }
  v11 = (char *)objc_msgSend(v5, "code");
  if ((unint64_t)(v11 - 3) < 2)
  {
    v13 = 205;
    goto LABEL_13;
  }
  v13 = 104;
  if (v11 != (char *)2 && v11 != (char *)100)
  {
    v14 = MBGetDefaultLog(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = (const __CFString *)objc_msgSend(v5, "code");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Drive returned unexpected error code: %{MobileBackup:MBError.code}ld", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Drive returned unexpected error code: %{MobileBackup:MBError.code}ld", objc_msgSend(v5, "code"));
    }

LABEL_11:
    v13 = 104;
  }
LABEL_13:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v13, v5, CFSTR("%@"), v6));

  return v20;
}

+ (id)errorForException:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v5 = (uint64_t)objc_msgSend(v4, "code");

  if (v5 <= 10)
  {
    v8 = 1;
    if (v5 == 1 || v5 == 10)
      goto LABEL_12;
  }
  else
  {
    if ((unint64_t)(v5 - 11) < 2)
    {
      v8 = 205;
      goto LABEL_12;
    }
    if (v5 == 100)
    {
      v8 = 102;
      goto LABEL_12;
    }
  }
  v9 = MBGetDefaultLog(v6, v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v11, "code");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected error code from exception: %{MobileBackup:MBError.code}ld", buf, 0xCu);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    _MBLog(CFSTR("DEFAULT"), "Unexpected error code from exception: %{MobileBackup:MBError.code}ld", objc_msgSend(v12, "code"));

  }
  v8 = 1;
LABEL_12:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:description:](MBError, "errorWithCode:description:", v8, v14));

  return v15;
}

- (MBBackupHelper)initWithSettingsContext:(id)a3 domainManager:(id)a4
{
  id v7;
  id v8;
  MBBackupHelper *v9;
  MBBackupHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBBackupHelper;
  v9 = -[MBBackupHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settingsContext, a3);
    objc_storeStrong((id *)&v10->_domainManager, a4);
  }

  return v10;
}

- (id)readStatusWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v34;
  uint8_t buf[4];
  void *v36;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading status", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading status");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupStatusPath](self->_settingsContext, "driveBackupStatusPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBStatus statusWithDrive:path:error:](MBStatus, "statusWithDrive:path:error:", v7, v8, a3));

  if (v9)
  {
    v10 = objc_msgSend(v9, "isVersionAmbiguous");
    v11 = (int)v10;
    v13 = MBGetDefaultLog(v10, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Status version is ambiguous", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "Status version is ambiguous");
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupPropertiesPath](self->_settingsContext, "driveBackupPropertiesPath"));
      v34 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "propertyListAtPath:options:error:", v17, 0, &v34));
      v19 = v34;

      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Version")));
        v22 = MBGetDefaultLog(v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Properties version is %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Properties version is %@", v20);
        }

        if (!v20)
        {
          v26 = MBGetDefaultLog(v24, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Overwriting status version to 1.0", buf, 2u);
            _MBLog(CFSTR("DEFAULT"), "Overwriting status version to 1.0");
          }

          objc_msgSend(v9, "setVersion:", 1.0);
        }
        v28 = v9;

      }
      else
      {
        v29 = +[MBError isError:withCode:](MBError, "isError:withCode:", v19, 4);
        if ((_DWORD)v29)
        {
          v31 = MBGetDefaultLog(v29, v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No manifest properties found", buf, 2u);
            _MBLog(CFSTR("DEFAULT"), "No manifest properties found");
          }

          v28 = v9;
        }
        else
        {
          v28 = 0;
          if (a3)
            *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v19, CFSTR("Error reading backup properties")));
        }
      }

    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Backup status: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Backup status: %@", v9);
      }

      v28 = v9;
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v28 = 0;
  }

  return v28;
}

- (id)readBackupPropertiesWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v17;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading backup properties", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading backup properties");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupPropertiesPath](self->_settingsContext, "driveBackupPropertiesPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveProperties propertiesWithDrive:path:error:](MBDriveProperties, "propertiesWithDrive:path:error:", v7, v8, a3));

  if (v9)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Backup properties: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Backup properties: %@", v9);
    }

    v14 = v9;
  }
  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading backup properties")));
  }

  return v9;
}

- (id)readBackupDatabaseWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v17;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading backup database", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading backup database");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDatabasePath](self->_settingsContext, "driveBackupDatabasePath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBDatabase databaseWithDrive:path:domainManager:error:](MBDatabase, "databaseWithDrive:path:domainManager:error:", v7, v8, self->_domainManager, a3));

  if (v9)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Backup database: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Backup database: %@", v9);
    }

    v14 = v9;
  }
  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading backup database")));
  }

  return v9;
}

- (id)readBackupManifestWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  MBDomainManager *domainManager;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  id v44;
  id v45;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupPropertiesWithError:](self, "readBackupPropertiesWithError:"));
  v6 = v5;
  if (!v5)
    goto LABEL_45;
  if (objc_msgSend(v5, "hasManifestDB"))
  {
    v7 = objc_msgSend(v6, "encrypted");
    if (!(_DWORD)v7)
    {
LABEL_11:
      v21 = MBGetDefaultLog(v7, v8);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Fetching new format backup manifest", buf, 2u);
        _MBLog(CFSTR("INFO"), "Fetching new format backup manifest");
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupManifestDatabasePath](self->_settingsContext, "driveBackupManifestDatabasePath"));
      domainManager = self->_domainManager;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MBManifestDB manifestDBWithDrive:sourcePath:properties:domainManager:keybag:error:](MBManifestDB, "manifestDBWithDrive:sourcePath:properties:domainManager:keybag:error:", v23, v24, v6, domainManager, v26, a3));

      if (!v27)
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading backup manifest database")));
        goto LABEL_20;
      }
      if (objc_msgSend(v27, "openWithError:", a3))
      {
        v28 = v27;
LABEL_20:

        goto LABEL_46;
      }

LABEL_45:
      v27 = 0;
      goto LABEL_46;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));

    if (v9)
    {
LABEL_5:
      v7 = (id)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));
      if (!v7)
        goto LABEL_11;
      v12 = v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));
      v14 = objc_msgSend(v13, "isUnlocked");

      if ((v14 & 1) != 0)
        goto LABEL_11;
      v15 = MBGetDefaultLog(v7, v8);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Unlocking backup keybag from manifest", buf, 2u);
        _MBLog(CFSTR("INFO"), "Unlocking backup keybag from manifest");
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext password](self->_settingsContext, "password"));
      v44 = 0;
      v19 = objc_msgSend(v17, "unlockWithPassword:error:", v18, &v44);
      v20 = v44;

      if ((v19 & 1) != 0)
      {

        goto LABEL_11;
      }
      if (+[MBError isError:withCode:](MBError, "isError:withCode:", v20, 207))
      {
        if (a3)
        {
          v39 = CFSTR("Invalid password when restoring encrypted backup");
          v40 = 207;
LABEL_37:
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v40, v20, v39));
        }
      }
      else if (a3)
      {
        v39 = CFSTR("Error decoding keybag");
        v40 = 1;
        goto LABEL_37;
      }

      goto LABEL_45;
    }
    v31 = MBGetDefaultLog(v10, v11);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Decoding and unlocking backup keybag from manifest", buf, 2u);
      _MBLog(CFSTR("INFO"), "Decoding and unlocking backup keybag from manifest");
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keybagData"));
    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext password](self->_settingsContext, "password"));
      v45 = 0;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag unlockedKeyBagWithData:password:error:](MBKeyBag, "unlockedKeyBagWithData:password:error:", v33, v34, &v45));
      v36 = v45;
      -[MBDriveSettingsContext setKeybag:](self->_settingsContext, "setKeybag:", v35);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext keybag](self->_settingsContext, "keybag"));
      if (v37)
      {

        goto LABEL_5;
      }
      if (+[MBError isError:withCode:](MBError, "isError:withCode:", v36, 207))
      {
        if (a3)
        {
          v41 = CFSTR("Invalid password when restoring encrypted backup");
          v42 = 207;
LABEL_42:
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v42, v36, v41));
          goto LABEL_43;
        }
      }
      else if (a3)
      {
        v41 = CFSTR("Error decoding keybag");
        v42 = 1;
        goto LABEL_42;
      }
    }
    else
    {
      if (a3)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("No keybag in manifest")));
        v36 = 0;
LABEL_43:
        *a3 = v38;
        goto LABEL_44;
      }
      v36 = 0;
    }
LABEL_44:

    goto LABEL_45;
  }
  v29 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readBackupDatabaseWithError:](self, "readBackupDatabaseWithError:", a3));
  if (!v29)
    goto LABEL_45;
  v30 = (void *)v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MBManifest manifestWithProperties:database:databaseIndex:](MBManifest, "manifestWithProperties:database:databaseIndex:", v6, v29, 0));

LABEL_46:
  return v27;
}

- (id)readSnapshotPropertiesWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v17;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading snapshot properties", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading snapshot properties");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotPropertiesPath](self->_settingsContext, "driveSnapshotPropertiesPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveProperties propertiesWithDrive:path:error:](MBDriveProperties, "propertiesWithDrive:path:error:", v7, v8, a3));

  if (v9)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Snapshot properties: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Snapshot properties: %@", v9);
    }

    v14 = v9;
  }
  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading snapshot properties")));
  }

  return v9;
}

- (id)readSnapshotDatabaseWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v17;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading snapshot database", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading snapshot database");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotDatabasePath](self->_settingsContext, "driveSnapshotDatabasePath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBDatabase databaseWithDrive:path:domainManager:error:](MBDatabase, "databaseWithDrive:path:domainManager:error:", v7, v8, self->_domainManager, a3));

  if (v9)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Snapshot database: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Snapshot database: %@", v9);
    }

    v14 = v9;
  }
  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading snapshot database")));
  }

  return v9;
}

- (id)readSnapshotManifestDatabaseWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v19;

  v5 = MBGetDefaultLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reading snapshot manifest database", buf, 2u);
    _MBLog(CFSTR("INFO"), "Reading snapshot manifest database");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotPropertiesWithError:](self, "readSnapshotPropertiesWithError:", a3));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotManifestDatabasePath](self->_settingsContext, "driveSnapshotManifestDatabasePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBManifestDB manifestDBWithDrive:sourcePath:properties:domainManager:error:](MBManifestDB, "manifestDBWithDrive:sourcePath:properties:domainManager:error:", v8, v9, v7, self->_domainManager, a3));

    if (v10)
    {
      v13 = MBGetDefaultLog(v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Snapshot manifest database: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Snapshot manifest database: %@", v10);
      }

      if (!objc_msgSend(v10, "openWithError:", a3))
      {
        v16 = 0;
        goto LABEL_14;
      }
      v15 = v10;
    }
    else
    {
      v16 = 0;
      if (!a3)
      {
LABEL_14:

        goto LABEL_15;
      }
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading snapshot manifest database")));
    }
    v16 = v10;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (id)readSnapshotManifestWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint8_t v18[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotPropertiesWithError:](self, "readSnapshotPropertiesWithError:"));
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  v7 = objc_msgSend(v5, "hasManifestDB");
  if ((_DWORD)v7)
  {
    v9 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetching new format snapshot manifest", v18, 2u);
      _MBLog(CFSTR("INFO"), "Fetching new format snapshot manifest");
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext drive](self->_settingsContext, "drive"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotManifestDatabasePath](self->_settingsContext, "driveSnapshotManifestDatabasePath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBManifestDB manifestDBWithDrive:sourcePath:properties:domainManager:error:](MBManifestDB, "manifestDBWithDrive:sourcePath:properties:domainManager:error:", v11, v12, v6, self->_domainManager, a3));

    if (!v13)
    {
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", *a3, CFSTR("Error reading snapshot manifest database")));
      goto LABEL_12;
    }
    if (objc_msgSend(v13, "openWithError:", a3))
    {
      v14 = v13;
LABEL_12:

      goto LABEL_15;
    }

LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v15 = objc_claimAutoreleasedReturnValue(-[MBBackupHelper readSnapshotDatabaseWithError:](self, "readSnapshotDatabaseWithError:", a3));
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBManifest manifestWithProperties:database:databaseIndex:](MBManifest, "manifestWithProperties:database:databaseIndex:", v6, v15, 0));

LABEL_15:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
}

@end
