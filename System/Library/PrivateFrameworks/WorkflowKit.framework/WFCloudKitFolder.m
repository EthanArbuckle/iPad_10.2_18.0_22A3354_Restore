@implementation WFCloudKitFolder

+ (int64_t)latestEncryptedSchemaVersion
{
  return +[WFCloudKitSyncSession isWalrusEnabled](WFCloudKitSyncSession, "isWalrusEnabled");
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("ShortcutFolder");
}

+ (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("icon");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("name");
  objc_msgSend(a1, "nameProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("encryptedSchemaVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("encryptedName");
  objc_msgSend(a1, "encryptedNameProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

+ (id)nameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled](WFCloudKitSyncSession, "isWalrusEnabled"))
    +[WFCloudKitItemProperty objectPropertyWithName:constantValue:](WFCloudKitItemProperty, "objectPropertyWithName:constantValue:", CFSTR("name"), 0);
  else
    +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("name"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)encryptedNameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled](WFCloudKitSyncSession, "isWalrusEnabled"))
    +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:", CFSTR("name"), 0, 1);
  else
    +[WFCloudKitItemProperty objectPropertyWithName:constantValue:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:constantValue:encrypted:", CFSTR("name"), 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitFolder.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitFolder.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("WFFolder"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v10, v7);

  return v11;
}

+ (BOOL)isFolderRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("WFFolder"));

  return v4;
}

+ (id)collectionIdentifierForRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-"), CFSTR("WFFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", v4))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WFCloudKitFolder)initWithCollectionRecord:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  WFCloudKitFolder *v8;
  WFCloudKitFolder *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  WFCloudKitFolder *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[WFCloudKitFolder init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    objc_msgSend(v6, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_msgSend(v6, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_icon = objc_msgSend(v12, "glyphCharacter");

    v9->_encryptedSchemaVersion = objc_msgSend(v6, "wantedEncryptedSchemaVersion");
    v13 = v9;
  }

  return v9;
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)icon
{
  return self->_icon;
}

- (void)setIcon:(unsigned __int16)a3
{
  self->_icon = a3;
}

- (int64_t)encryptedSchemaVersion
{
  return self->_encryptedSchemaVersion;
}

- (void)setEncryptedSchemaVersion:(int64_t)a3
{
  self->_encryptedSchemaVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
