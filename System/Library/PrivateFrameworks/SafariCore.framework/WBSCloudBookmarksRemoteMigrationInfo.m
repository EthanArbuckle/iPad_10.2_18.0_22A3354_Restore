@implementation WBSCloudBookmarksRemoteMigrationInfo

- (WBSCloudBookmarksRemoteMigrationInfo)initWithMigrationState:(int64_t)a3 migratorDeviceIdentifier:(id)a4 serverModificationDate:(id)a5
{
  id v8;
  id v9;
  WBSCloudBookmarksRemoteMigrationInfo *v10;
  WBSCloudBookmarksRemoteMigrationInfo *v11;
  uint64_t v12;
  NSString *migratorDeviceIdentifier;
  WBSCloudBookmarksRemoteMigrationInfo *v14;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSCloudBookmarksRemoteMigrationInfo;
  v10 = -[WBSCloudBookmarksRemoteMigrationInfo init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_migrationState = a3;
    v12 = objc_msgSend(v8, "copy");
    migratorDeviceIdentifier = v11->_migratorDeviceIdentifier;
    v11->_migratorDeviceIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_serverModificationDate, a5);
    v14 = v11;
  }

  return v11;
}

- (WBSCloudBookmarksRemoteMigrationInfo)init
{

  return 0;
}

- (int64_t)migrationState
{
  return self->_migrationState;
}

- (NSString)migratorDeviceIdentifier
{
  return self->_migratorDeviceIdentifier;
}

- (NSDate)serverModificationDate
{
  return self->_serverModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverModificationDate, 0);
  objc_storeStrong((id *)&self->_migratorDeviceIdentifier, 0);
}

@end
