@implementation MBDriveEncryptionManager

+ (MBDriveEncryptionManager)encryptionManagerWithSettingsContext:(id)a3
{
  return -[MBDriveEncryptionManager initWithSettingsContext:]([MBDriveEncryptionManager alloc], "initWithSettingsContext:", a3);
}

- (MBDriveEncryptionManager)initWithSettingsContext:(id)a3
{
  MBDriveEncryptionManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDriveEncryptionManager;
  v4 = -[MBDriveEncryptionManager init](&v6, "init");
  if (v4)
    v4->_settingsContext = (MBDriveSettingsContext *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDriveEncryptionManager;
  -[MBDriveEncryptionManager dealloc](&v3, "dealloc");
}

- (BOOL)_changeBackupKeyBagPasswordInProperties:(id)a3 fromPassword:(id)a4 toPassword:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  MBKeyBag *v14;
  uint64_t v15;
  MBKeyBag *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  MBError *v20;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v10 = objc_msgSend(a3, "keybagData");
  if (v10)
  {
    v12 = v10;
    v13 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Decoding backup keybag", buf, 2u);
      _MBLog(CFSTR("INFO"), "Decoding backup keybag");
    }
    v14 = +[MBKeyBag keybagWithData:error:](MBKeyBag, "keybagWithData:error:", v12, a6);
    if (v14)
    {
      v16 = v14;
      v17 = MBGetDefaultLog(v14, v15);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Changing backup keybag password", v23, 2u);
        _MBLog(CFSTR("INFO"), "Changing backup keybag password");
      }
      v14 = (MBKeyBag *)-[MBKeyBag changePasswordFrom:toPassword:error:](v16, "changePasswordFrom:toPassword:error:", a4, a5, a6);
      if ((_DWORD)v14)
      {
        v19 = MBGetDefaultLog(v14, v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Encoding backup keybag", v22, 2u);
          _MBLog(CFSTR("INFO"), "Encoding backup keybag");
        }
        v14 = -[MBKeyBag dataWithError:](v16, "dataWithError:", a6);
        if (v14)
        {
          objc_msgSend(a3, "setKeybagData:", v14);
          LOBYTE(v14) = 1;
        }
      }
    }
  }
  else if (a6)
  {
    v20 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("No backup keybag data in encrypted backup properties"));
    LOBYTE(v14) = 0;
    *a6 = v20;
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return (char)v14;
}

- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5
{
  LAContext *v9;
  LAContext *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSObject *v13;
  dispatch_time_t v14;
  intptr_t v15;
  uint64_t v16;
  NSObject *v17;
  MBError *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  MBDriveProperties *v37;
  MBDriveProperties *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  unsigned int v46;
  unsigned __int8 v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  MBDriveProperties *v52;
  MBDriveProperties *v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  NSObject *v70;
  _QWORD v72[6];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  void *v77;
  uint8_t buf[4];
  uint64_t v79;

  v77 = 0;
  v9 = objc_opt_new(LAContext);
  if (!v9)
    sub_1000887B0();
  v10 = v9;
  v11 = objc_opt_new(NSMutableDictionary);
  if (!v11)
    sub_1000887D8();
  v12 = v11;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v13 = dispatch_semaphore_create(0);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100062774;
  v72[3] = &unk_1000D9F28;
  v72[4] = v13;
  v72[5] = &v73;
  -[LAContext evaluatePolicy:options:reply:](v10, "evaluatePolicy:options:reply:", 1013, v12, v72);
  v14 = dispatch_time(0, 1800000000000);
  v15 = dispatch_semaphore_wait(v13, v14);
  if (!v15)
  {

    if (!*((_BYTE *)v74 + 24))
    {
      if (a5)
      {
        v18 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Device locked"));
        goto LABEL_8;
      }
      goto LABEL_91;
    }
    v22 = MBGetDefaultLog(v20, v21);
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if ((_DWORD)v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Changing backup password", buf, 2u);
      v23 = _MBLog(CFSTR("INFO"), "Changing backup password");
    }
    v25 = a3 == 0;
    if (!a3)
    {
      v26 = MBGetDefaultLog(v23, v24);
      v23 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "oldPassword is NULL", buf, 2u);
        v23 = _MBLog(CFSTR("DEFAULT"), "oldPassword is NULL");
      }
    }
    if (!a4)
    {
      v27 = MBGetDefaultLog(v23, v24);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "newPassword is NULL", buf, 2u);
        _MBLog(CFSTR("DEFAULT"), "newPassword is NULL");
      }
    }
    v28 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v77);
    if (v28)
    {
      v29 = objc_msgSend(a3, "isEqualToString:", v28);
      if (!(_DWORD)v29)
      {
        v45 = MBGetDefaultLog(v29, v30);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Passwords don't match", buf, 2u);
          _MBLog(CFSTR("INFO"), "Passwords don't match");
        }
        v46 = !-[MBDriveEncryptionManager setWillEncryptInLockdown:error:](self, "setWillEncryptInLockdown:error:", 1, a5);
        if (!a5)
          LOBYTE(v46) = 1;
        if ((v46 & 1) == 0)
        {
          v18 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 207, CFSTR("Invalid password"));
          goto LABEL_8;
        }
        goto LABEL_91;
      }
      v31 = MBGetDefaultLog(v29, v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Password matches", buf, 2u);
        _MBLog(CFSTR("INFO"), "Password matches");
      }
      if (!a4)
      {
        if (!-[MBDriveEncryptionManager setWillEncryptInLockdown:error:](self, "setWillEncryptInLockdown:error:", 0, a5))goto LABEL_91;
        v47 = +[MBKeychainManager removeLocalBackupPasswordAndReturnError:](MBKeychainManager, "removeLocalBackupPasswordAndReturnError:", a5);
        goto LABEL_52;
      }
      if (!+[MBKeychainManager updateLocalBackupPassword:error:](MBKeychainManager, "updateLocalBackupPassword:error:", a4, a5))goto LABEL_91;
      v25 = 0;
      v19 = 0;
      if (!-[MBDriveEncryptionManager setWillEncryptInLockdown:error:](self, "setWillEncryptInLockdown:error:", 1, a5))goto LABEL_92;
    }
    else
    {
      v32 = +[MBError isError:withCode:](MBError, "isError:withCode:", v77, 4);
      if (!(_DWORD)v32)
        goto LABEL_89;
      v34 = MBGetDefaultLog(v32, v33);
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if ((_DWORD)v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "No password is currently set", buf, 2u);
        v35 = _MBLog(CFSTR("INFO"), "No password is currently set");
      }
      if (!a4)
      {
        v48 = MBGetDefaultLog(v35, v36);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "No password given to add either", buf, 2u);
          _MBLog(CFSTR("INFO"), "No password given to add either");
        }
        v47 = -[MBDriveEncryptionManager setWillEncryptInLockdown:error:](self, "setWillEncryptInLockdown:error:", 0, a5);
LABEL_52:
        if ((v47 & 1) != 0)
        {
LABEL_53:
          v19 = 1;
          goto LABEL_92;
        }
LABEL_91:
        v19 = 0;
        goto LABEL_92;
      }
      if (!+[MBKeychainManager addLocalBackupPassword:error:](MBKeychainManager, "addLocalBackupPassword:error:", a4, a5)|| !-[MBDriveEncryptionManager setWillEncryptInLockdown:error:](self, "setWillEncryptInLockdown:error:", 1, a5))
      {
        goto LABEL_91;
      }
    }
    v37 = +[MBDriveProperties propertiesWithDrive:path:error:](MBDriveProperties, "propertiesWithDrive:path:error:", -[MBDriveSettingsContext drive](self->_settingsContext, "drive"), -[MBDriveSettingsContext driveSnapshotPropertiesPath](self->_settingsContext, "driveSnapshotPropertiesPath"), &v77);
    v38 = v37;
    if (v37)
    {
      v39 = -[MBDriveProperties encrypted](v37, "encrypted");
      if (!(_DWORD)v39)
      {
        v60 = MBGetDefaultLog(v39, v40);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Snapshot not encrypted", buf, 2u);
          _MBLog(CFSTR("INFO"), "Snapshot not encrypted");
        }
        goto LABEL_53;
      }
      v41 = MBGetDefaultLog(v39, v40);
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
      if ((_DWORD)v42)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Changing snapshot properties password", buf, 2u);
        v42 = _MBLog(CFSTR("INFO"), "Changing snapshot properties password");
      }
      if (v25)
      {
        v44 = MBGetDefaultLog(v42, v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Skipping change snapshot properties password - oldPassword is NULL", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Skipping change snapshot properties password - oldPassword is NULL");
        }
        goto LABEL_53;
      }
      if (-[MBDriveEncryptionManager _changeBackupKeyBagPasswordInProperties:fromPassword:toPassword:error:](self, "_changeBackupKeyBagPasswordInProperties:fromPassword:toPassword:error:", v38, a3, a4, &v77))
      {
        v47 = -[MBDrive uploadPropertyList:toPath:options:error:](-[MBDriveSettingsContext drive](self->_settingsContext, "drive"), "uploadPropertyList:toPath:options:error:", -[MBDriveProperties propertyList](v38, "propertyList"), -[MBDriveSettingsContext driveSnapshotPropertiesPath](self->_settingsContext, "driveSnapshotPropertiesPath"), 0, &v77);
        goto LABEL_52;
      }
      v61 = +[MBError isError:withCode:](MBError, "isError:withCode:", v77, 207);
      if ((_DWORD)v61)
      {
        v63 = MBGetDefaultLog(v61, v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match snapshot keybag", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Password in keychain doesn't match snapshot keybag");
        }
        goto LABEL_78;
      }
LABEL_89:
      if (a5)
      {
        v19 = 0;
        *a5 = v77;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    v49 = +[MBError isError:withCode:](MBError, "isError:withCode:", v77, 4);
    if (!(_DWORD)v49)
    {
      if (a5)
      {
        v18 = +[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v77, CFSTR("Error reading snapshot manifest properties"));
        goto LABEL_8;
      }
      goto LABEL_91;
    }
    v51 = MBGetDefaultLog(v49, v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "No snapshot properties found", buf, 2u);
      _MBLog(CFSTR("INFO"), "No snapshot properties found");
    }
    v52 = +[MBDriveProperties propertiesWithDrive:path:error:](MBDriveProperties, "propertiesWithDrive:path:error:", -[MBDriveSettingsContext drive](self->_settingsContext, "drive"), -[MBDriveSettingsContext driveBackupPropertiesPath](self->_settingsContext, "driveBackupPropertiesPath"), &v77);
    v53 = v52;
    if (v52)
    {
      v54 = -[MBDriveProperties encrypted](v52, "encrypted");
      if (!(_DWORD)v54)
      {
        v67 = MBGetDefaultLog(v54, v55);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Backup not encrypted", buf, 2u);
          _MBLog(CFSTR("INFO"), "Backup not encrypted");
        }
        goto LABEL_78;
      }
      v56 = MBGetDefaultLog(v54, v55);
      v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
      if ((_DWORD)v57)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Changing backup properties password", buf, 2u);
        v57 = _MBLog(CFSTR("INFO"), "Changing backup properties password");
      }
      if (v25)
      {
        v59 = MBGetDefaultLog(v57, v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Skipping change backup properties password - oldPassword is NULL", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Skipping change backup properties password - oldPassword is NULL");
        }
        goto LABEL_78;
      }
      if (!-[MBDriveEncryptionManager _changeBackupKeyBagPasswordInProperties:fromPassword:toPassword:error:](self, "_changeBackupKeyBagPasswordInProperties:fromPassword:toPassword:error:", v53, a3, a4, &v77))
      {
        v68 = +[MBError isError:withCode:](MBError, "isError:withCode:", v77, 207);
        if ((_DWORD)v68)
        {
          v70 = MBGetDefaultLog(v68, v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match backup keybag", buf, 2u);
            _MBLog(CFSTR("DEFAULT"), "Password in keychain doesn't match backup keybag");
          }
          goto LABEL_78;
        }
        goto LABEL_89;
      }
      if (!-[MBDrive uploadPropertyList:toPath:options:error:](-[MBDriveSettingsContext drive](self->_settingsContext, "drive"), "uploadPropertyList:toPath:options:error:", -[MBDriveProperties propertyList](v53, "propertyList"), -[MBDriveSettingsContext driveBackupPropertiesPath](self->_settingsContext, "driveBackupPropertiesPath"), 0, a5))goto LABEL_91;
    }
    else
    {
      v64 = +[MBError isError:withCode:](MBError, "isError:withCode:", v77, 4);
      if (!(_DWORD)v64)
      {
        if (a5)
        {
          v18 = +[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v77, CFSTR("Error reading backup manifest properties"));
          goto LABEL_8;
        }
        goto LABEL_91;
      }
      v66 = MBGetDefaultLog(v64, v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "No properties found in backup or snapshot", buf, 2u);
        _MBLog(CFSTR("INFO"), "No properties found in backup or snapshot");
      }
    }
LABEL_78:
    v77 = 0;
    goto LABEL_53;
  }
  v17 = MBGetDefaultLog(v15, v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v79 = 30;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Timed out waiting %lld minutes for passcode", buf, 0xCu);
    _MBLog(CFSTR("ERROR"), "Timed out waiting %lld minutes for passcode", 30);
  }
  -[LAContext invalidate](v10, "invalidate");

  if (!a5)
    goto LABEL_91;
  v18 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Device locked - timeout waiting for passcode entry"));
LABEL_8:
  v19 = 0;
  *a5 = v18;
LABEL_92:
  _Block_object_dispose(&v73, 8);
  return v19;
}

- (BOOL)setPasswordInKeychain:(id)a3 error:(id *)a4
{
  BOOL result;
  void *v7;

  v7 = 0;
  if (+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v7))
  {
    if (a3)
      return +[MBKeychainManager updateLocalBackupPassword:error:](MBKeychainManager, "updateLocalBackupPassword:error:", a3, a4);
    else
      return +[MBKeychainManager removeLocalBackupPasswordAndReturnError:](MBKeychainManager, "removeLocalBackupPasswordAndReturnError:", a4);
  }
  else if (+[MBError isError:withCode:](MBError, "isError:withCode:", v7, 4))
  {
    if (a3)
      return +[MBKeychainManager addLocalBackupPassword:error:](MBKeychainManager, "addLocalBackupPassword:error:", a3, a4);
    else
      return 1;
  }
  else
  {
    result = 0;
    if (a4)
      *a4 = v7;
  }
  return result;
}

- (BOOL)makeLockdownAndKeychainConsistentWithError:(id *)a3
{
  NSObject *v5;
  MBDriveEncryptionManager *v6;
  uint64_t v7;
  BOOL result;
  uint8_t v9[8];
  void *v10;

  v10 = 0;
  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Making lockdown and keychain consistent", v9, 2u);
    _MBLog(CFSTR("INFO"), "Making lockdown and keychain consistent");
  }
  if (+[MBKeychainManager fetchLocalBackupPasswordAndReturnError:](MBKeychainManager, "fetchLocalBackupPasswordAndReturnError:", &v10))
  {
    v6 = self;
    v7 = 1;
    return -[MBDriveEncryptionManager setWillEncryptInLockdown:error:](v6, "setWillEncryptInLockdown:error:", v7, a3);
  }
  if (+[MBError isError:withCode:](MBError, "isError:withCode:", v10, 4))
  {
    v6 = self;
    v7 = 0;
    return -[MBDriveEncryptionManager setWillEncryptInLockdown:error:](v6, "setWillEncryptInLockdown:error:", v7, a3);
  }
  result = 0;
  if (a3)
    *a3 = v10;
  return result;
}

- (BOOL)setWillEncryptInLockdown:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v6;
  id v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint8_t buf[4];
  _BOOL4 v14;

  v5 = a3;
  v6 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting WillEncrypt=%d in lockdown", buf, 8u);
    _MBLog(CFSTR("INFO"), "Setting WillEncrypt=%d in lockdown", v5);
  }
  v7 = +[MBLockdown connect](MBLockdown, "connect");
  if (!v5)
  {
    v8 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    if (objc_msgSend(v8, "effectiveBoolValueForSetting:", MCFeatureEncryptedBackupRequired) == 1)
    {
      if (a4)
      {
        v9 = CFSTR("Cannot remove iTunes Backup Encryption - Encrypted Backup MDM setting present on device");
        v10 = 22;
LABEL_11:
        v11 = 0;
        *a4 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v10, v9);
        return v11;
      }
      return 0;
    }
  }
  if (!v7)
  {
    if (a4)
    {
      v9 = CFSTR("Error connecting to lockdown");
      v10 = 1;
      goto LABEL_11;
    }
    return 0;
  }
  v11 = objc_msgSend(v7, "setObject:forDomain:andKey:withError:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5), CFSTR("com.apple.mobile.backup"), CFSTR("WillEncrypt"), a4);
  objc_msgSend(v7, "disconnect");
  return v11;
}

- (MBDriveSettingsContext)settingsContext
{
  return self->_settingsContext;
}

@end
