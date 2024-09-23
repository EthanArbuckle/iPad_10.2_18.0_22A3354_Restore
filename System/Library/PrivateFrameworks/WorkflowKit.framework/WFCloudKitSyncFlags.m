@implementation WFCloudKitSyncFlags

- (WFCloudKitSyncFlags)initWithZoneID:(id)a3
{
  id v5;
  WFCloudKitSyncFlags *v6;
  uint64_t v7;
  CKRecordID *identifier;
  WFCloudKitSyncFlags *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitSyncFlags.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFCloudKitSyncFlags;
  v6 = -[WFCloudKitSyncFlags init](&v12, sel_init);
  if (v6)
  {
    +[WFCloudKitSyncFlags recordIDWithZoneID:](WFCloudKitSyncFlags, "recordIDWithZoneID:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (CKRecordID *)v7;

    v9 = v6;
  }

  return v6;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (void)setRecordSystemFieldsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)migratedVoiceShortcuts
{
  return self->_migratedVoiceShortcuts;
}

- (void)setMigratedVoiceShortcuts:(BOOL)a3
{
  self->_migratedVoiceShortcuts = a3;
}

- (int64_t)defaultShortcutsVersion
{
  return self->_defaultShortcutsVersion;
}

- (void)setDefaultShortcutsVersion:(int64_t)a3
{
  self->_defaultShortcutsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("ShortcutFlags");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("migratedVoiceShortcuts");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("defaultShortcutsVersion");
  v7[0] = v2;
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (id)recordIDWithZoneID:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitSyncFlags.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("ShortcutFlags"), v5);

  return v6;
}

+ (BOOL)isCloudKitSyncFlagsRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutFlags"));

  return v4;
}

@end
