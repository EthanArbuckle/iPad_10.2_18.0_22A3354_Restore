@implementation WFWorkflowCollectionRecord

- (int64_t)computedSyncHash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __int16 v8;
  id v9;
  id v10;
  id v11;
  int64_t v12;
  __int16 v14;

  v3 = (void *)objc_opt_new();
  -[WFWorkflowCollectionRecord name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFWorkflowCollectionRecord name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  }
  -[WFWorkflowCollectionRecord icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "glyphCharacter");

  v14 = v8;
  v9 = (id)objc_msgSend(v3, "combineBytes:size:", &v14, 2);
  v10 = (id)objc_msgSend(v3, "combineBool:", -[WFWorkflowCollectionRecord isDeleted](self, "isDeleted"));
  if (-[WFWorkflowCollectionRecord wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion") >= 1)
    v11 = (id)objc_msgSend(v3, "combineInteger:", -[WFWorkflowCollectionRecord wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion"));
  v12 = objc_msgSend(v3, "finalize");

  return v12;
}

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[WFWorkflowCollectionRecord isFolder](self, "isFolder"))
  {
    v7 = -[WFWorkflowCollectionRecord wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion");
    v8 = +[WFCloudKitFolder latestEncryptedSchemaVersion](WFCloudKitFolder, "latestEncryptedSchemaVersion");
    if (v7 != v8)
    {
      v9 = v8;
      getWFWalrusLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[WFWorkflowCollectionRecord name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v16 = "-[WFWorkflowCollectionRecord saveChangesToStorage:error:]";
        v17 = 2112;
        v18 = v11;
        v19 = 2048;
        v20 = v7;
        v21 = 2048;
        v22 = v9;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Saving %@ to storage, but Walrus version is wrong; fixing <old: %lld, new: %lld>",
          buf,
          0x2Au);

      }
      -[WFWorkflowCollectionRecord setWantedEncryptedSchemaVersion:](self, "setWantedEncryptedSchemaVersion:", v9);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowCollectionRecord;
  v12 = -[WFRecord saveChangesToStorage:error:](&v14, sel_saveChangesToStorage_error_, v6, a4);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return self->_wantedEncryptedSchemaVersion;
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
  self->_wantedEncryptedSchemaVersion = a3;
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return self->_lastSyncedEncryptedSchemaVersion;
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
  self->_lastSyncedEncryptedSchemaVersion = a3;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (BOOL)isFolder
{
  return self->_folder;
}

- (NSOrderedSet)lastRemoteCollectionOrdering
{
  return self->_lastRemoteCollectionOrdering;
}

- (void)setLastRemoteCollectionOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSOrderedSet)lastRemoteCollectionOrderingSubset
{
  return self->_lastRemoteCollectionOrderingSubset;
}

- (void)setLastRemoteCollectionOrderingSubset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSOrderedSet)collectionOrdering
{
  return self->_collectionOrdering;
}

- (void)setCollectionOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSOrderedSet)lastRemoteShortcutOrdering
{
  return self->_lastRemoteShortcutOrdering;
}

- (void)setLastRemoteShortcutOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSOrderedSet)lastRemoteShortcutOrderingSubset
{
  return self->_lastRemoteShortcutOrderingSubset;
}

- (void)setLastRemoteShortcutOrderingSubset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSOrderedSet)shortcutOrdering
{
  return self->_shortcutOrdering;
}

- (void)setShortcutOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)cloudKitFolderRecordMetadata
{
  return self->_cloudKitFolderRecordMetadata;
}

- (void)setCloudKitFolderRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSData)cloudKitOrderingRecordMetadata
{
  return self->_cloudKitOrderingRecordMetadata;
}

- (void)setCloudKitOrderingRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitOrderingRecordMetadata, 0);
  objc_storeStrong((id *)&self->_cloudKitFolderRecordMetadata, 0);
  objc_storeStrong((id *)&self->_shortcutOrdering, 0);
  objc_storeStrong((id *)&self->_lastRemoteShortcutOrderingSubset, 0);
  objc_storeStrong((id *)&self->_lastRemoteShortcutOrdering, 0);
  objc_storeStrong((id *)&self->_collectionOrdering, 0);
  objc_storeStrong((id *)&self->_lastRemoteCollectionOrderingSubset, 0);
  objc_storeStrong((id *)&self->_lastRemoteCollectionOrdering, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
