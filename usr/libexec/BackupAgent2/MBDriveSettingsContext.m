@implementation MBDriveSettingsContext

+ (id)defaultSettingsContext
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  MBDriveSettingsContext *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  void *v12;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v10));
  v3 = v10;
  v5 = v3;
  if (v2)
  {
    v6 = -[MBDriveSettingsContext initWithPersona:]([MBDriveSettingsContext alloc], "initWithPersona:", v2);
  }
  else
  {
    v7 = MBGetDefaultLog(v3, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Failed to fetch personal persona: %@", buf, 0xCu);
      _MBLog(CFSTR("FAULT"), "Failed to fetch personal persona: %@", v5);
    }

    v6 = 0;
  }

  return v6;
}

- (MBDriveSettingsContext)initWithPersona:(id)a3
{
  MBDriveSettingsContext *v3;
  uint64_t v4;
  uint64_t v5;
  NSString *targetDeviceClass;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *options;
  MBDriveEncryptionManager *v11;
  MBDriveEncryptionManager *encryptionManager;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *deviceCacheDir;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MBDriveSettingsContext;
  v3 = -[MBSettingsContext init](&v20, "init", a3);
  if (v3)
  {
    v4 = MBDeviceClass();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    targetDeviceClass = v3->_targetDeviceClass;
    v3->_targetDeviceClass = (NSString *)v5;

    v7 = MBDefaultOptions();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    options = v3->_options;
    v3->_options = v9;

    v11 = -[MBDriveEncryptionManager initWithSettingsContext:]([MBDriveEncryptionManager alloc], "initWithSettingsContext:", v3);
    encryptionManager = v3->_encryptionManager;
    v3->_encryptionManager = v11;

    v15 = MBGetCacheDir(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    deviceCacheDir = v3->_deviceCacheDir;
    v3->_deviceCacheDir = (NSString *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3->_options, "objectForKeyedSubscript:", CFSTR("RestorePreserveSettings")));
    -[MBSettingsContext setShouldPreserveSettings:](v3, "setShouldPreserveSettings:", objc_msgSend(v18, "BOOLValue"));

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MBDriveSettingsContext;
  v5 = -[MBSettingsContext copyWithZone:](&v9, "copyWithZone:");
  objc_msgSend(v5, "setProtocolVersion:", self->_protocolVersion);
  objc_msgSend(v5, "setTargetDeviceClass:", self->_targetDeviceClass);
  objc_msgSend(v5, "setSourceIdentifier:", self->_sourceIdentifier);
  objc_msgSend(v5, "setTargetIdentifier:", self->_targetIdentifier);
  v6 = -[NSSet mutableCopyWithZone:](self->_applicationIDs, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setApplicationIDs:", v6);

  v7 = -[NSMutableDictionary mutableCopyWithZone:](self->_options, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setOptions:", v7);

  objc_msgSend(v5, "setDrive:", self->_drive);
  objc_msgSend(v5, "setEncryptionManager:", self->_encryptionManager);
  objc_msgSend(v5, "setDeviceCacheDir:", self->_deviceCacheDir);
  return v5;
}

- (BOOL)shouldNotifySpringBoard
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("RestoreShouldReboot")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldCopyBackup
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("RestoreDontCopyBackup")));
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

- (BOOL)shouldRestoreSystemFiles
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("RestoreSystemFiles")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldRemoveItemsNotRestored
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("RemoveItemsNotRestored")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (NSString)password
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("Password"));
}

- (NSString)driveBackupDir
{
  NSString *sourceIdentifier;

  sourceIdentifier = self->_sourceIdentifier;
  if (!sourceIdentifier)
    sourceIdentifier = self->_targetIdentifier;
  return sourceIdentifier;
}

- (NSString)driveBackupStatusPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Status.plist")));

  return (NSString *)v3;
}

- (NSString)driveBackupPropertiesPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.plist")));

  return (NSString *)v3;
}

- (NSString)driveBackupDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.mbdb")));

  return (NSString *)v3;
}

- (NSString)driveBackupDatabaseIndexPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.mbdx")));

  return (NSString *)v3;
}

- (NSString)driveBackupManifestDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.db")));

  return (NSString *)v3;
}

- (NSString)driveBackupInfoPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Info.plist")));

  return (NSString *)v3;
}

- (NSString)driveSnapshotDir
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveBackupDir](self, "driveBackupDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Snapshot")));

  return (NSString *)v3;
}

- (NSString)driveSnapshotPropertiesPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotDir](self, "driveSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.plist")));

  return (NSString *)v3;
}

- (NSString)driveSnapshotDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotDir](self, "driveSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.mbdb")));

  return (NSString *)v3;
}

- (NSString)driveSnapshotDatabaseIndexPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotDir](self, "driveSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.mbdx")));

  return (NSString *)v3;
}

- (NSString)driveSnapshotManifestDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext driveSnapshotDir](self, "driveSnapshotDir"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Manifest.db")));

  return (NSString *)v3;
}

- (BOOL)shouldRestoreAppWithID:(id)a3
{
  NSSet *applicationIDs;

  applicationIDs = self->_applicationIDs;
  if (applicationIDs)
    return -[NSSet containsObject:](applicationIDs, "containsObject:", a3);
  else
    return 1;
}

- (void)updatePassword:(id)a3
{
  NSMutableDictionary *options;

  options = self->_options;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](options, "setObject:forKeyedSubscript:", a3, CFSTR("Password"));
  else
    -[NSMutableDictionary removeObjectForKey:](options, "removeObjectForKey:", CFSTR("Password"));
}

- (void)log
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;

  v48.receiver = self;
  v48.super_class = (Class)MBDriveSettingsContext;
  v3 = -[MBSettingsContext log](&v48, "log");
  v5 = MBGetDefaultLog(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext targetDeviceClass](self, "targetDeviceClass"));
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TargetDeviceClass: %@", buf, 0xCu);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext targetDeviceClass](self, "targetDeviceClass"));
    _MBLog(CFSTR("INFO"), "TargetDeviceClass: %@", v8);

  }
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[MBDriveSettingsContext protocolVersion](self, "protocolVersion");
    *(_DWORD *)buf = 134217984;
    v50 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ProtocolVersion: %0.1f", buf, 0xCu);
    -[MBDriveSettingsContext protocolVersion](self, "protocolVersion");
    _MBLog(CFSTR("INFO"), "ProtocolVersion: %0.1f", v14);
  }

  v17 = MBGetDefaultLog(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext sourceIdentifier](self, "sourceIdentifier"));
    *(_DWORD *)buf = 138412290;
    v50 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "SourceIdentifier: %@", buf, 0xCu);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext sourceIdentifier](self, "sourceIdentifier"));
    _MBLog(CFSTR("INFO"), "SourceIdentifier: %@", v20);

  }
  v23 = MBGetDefaultLog(v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext targetIdentifier](self, "targetIdentifier"));
    *(_DWORD *)buf = 138412290;
    v50 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "TargetIdentifier: %@", buf, 0xCu);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext targetIdentifier](self, "targetIdentifier"));
    _MBLog(CFSTR("INFO"), "TargetIdentifier: %@", v26);

  }
  v29 = MBGetDefaultLog(v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext applicationIDs](self, "applicationIDs"));
    v32 = MBStringWithSet();
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138412290;
    v50 = v33;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "ApplicationIDs: %@", buf, 0xCu);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext applicationIDs](self, "applicationIDs"));
    v35 = MBStringWithSet();
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    _MBLog(CFSTR("INFO"), "ApplicationIDs: %@", v36);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBDriveSettingsContext options](self, "options"));
  v38 = objc_msgSend(v37, "mutableCopy");

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Password")));
  if (v39)
    v40 = objc_msgSend(v38, "setObject:forKeyedSubscript:", CFSTR("********"), CFSTR("Password"));
  v42 = MBGetDefaultLog(v40, v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v44 = MBStringWithDictionary(v38);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    *(_DWORD *)buf = 138412290;
    v50 = v45;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Options: %@", buf, 0xCu);

    v46 = MBStringWithDictionary(v38);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    _MBLog(CFSTR("INFO"), "Options: %@", v47);

  }
}

- (double)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(double)a3
{
  self->_protocolVersion = a3;
}

- (NSString)targetDeviceClass
{
  return self->_targetDeviceClass;
}

- (void)setTargetDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_targetDeviceClass, a3);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetIdentifier, a3);
}

- (NSSet)applicationIDs
{
  return self->_applicationIDs;
}

- (void)setApplicationIDs:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIDs, a3);
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (MBDrive)drive
{
  return self->_drive;
}

- (void)setDrive:(id)a3
{
  objc_storeStrong((id *)&self->_drive, a3);
}

- (MBDriveEncryptionManager)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionManager, a3);
}

- (MBKeyBag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
  objc_storeStrong((id *)&self->_keybag, a3);
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (BOOL)isDeviceTransfer
{
  return self->_isDeviceTransfer;
}

- (void)setIsDeviceTransfer:(BOOL)a3
{
  self->_isDeviceTransfer = a3;
}

- (NSString)deviceCacheDir
{
  return self->_deviceCacheDir;
}

- (void)setDeviceCacheDir:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCacheDir, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCacheDir, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_drive, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_applicationIDs, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_targetDeviceClass, 0);
  objc_storeStrong((id *)&self->_deviceTemporaryDir, 0);
}

@end
