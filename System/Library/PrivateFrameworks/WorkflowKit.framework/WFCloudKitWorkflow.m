@implementation WFCloudKitWorkflow

+ (int64_t)latestEncryptedSchemaVersion
{
  return +[WFCloudKitSyncSession isWalrusEnabled](WFCloudKitSyncSession, "isWalrusEnabled");
}

+ (NSString)recordType
{
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    return (NSString *)CFSTR("Shortcut_v2");
  else
    return (NSString *)CFSTR("Shortcut");
}

+ (NSDictionary)properties
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
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[13];
  _QWORD v20[15];

  v20[13] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("subtitle");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("workflowSubtitle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("associatedAppBundleIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  v19[2] = CFSTR("source");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("galleryIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("lastSavedOnDeviceName");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = CFSTR("serializedData");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("serializedDataFile"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v4;
  v19[6] = CFSTR("quarantine");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("serializedQuarantineData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v5;
  v19[7] = CFSTR("cachedSyncHash");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v6;
  v19[8] = CFSTR("accessResourcePermissionsData");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("serializedAccessResourcePerWorkflowStateData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v7;
  v19[9] = CFSTR("smartPromptsData");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("serializedSmartPromptsPerWorkflowStateData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v8;
  v19[10] = CFSTR("name");
  objc_msgSend(a1, "nameProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v9;
  v19[11] = CFSTR("encryptedSchemaVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v10;
  v19[12] = CFSTR("encryptedName");
  objc_msgSend(a1, "encryptedNameProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
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

+ (id)recordIDWithZoneID:(id)a3 workflowID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0C95070];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithRecordName:zoneID:", v6, v7);

  return v8;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  NSDate *v7;
  NSDate *v8;
  NSDate *createdAt;
  NSDate *modifiedAt;
  NSDate *v11;

  v7 = (NSDate *)a3;
  v8 = (NSDate *)a4;
  createdAt = self->_createdAt;
  self->_createdAt = v7;
  v11 = v7;

  modifiedAt = self->_modifiedAt;
  self->_modifiedAt = v8;

}

- (WFCloudKitWorkflow)initWithRecord:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  WFCloudKitWorkflow *v9;
  WFCloudKitWorkflow *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *workflowSubtitle;
  uint64_t v15;
  NSString *associatedAppBundleIdentifier;
  uint64_t v17;
  NSString *source;
  uint64_t v19;
  NSString *galleryIdentifier;
  void *v21;
  void *v22;
  uint64_t v23;
  WFFileRepresentation *serializedDataFile;
  void *v25;
  uint64_t v26;
  NSData *serializedQuarantineData;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSData *serializedAccessResourcePerWorkflowStateData;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSData *serializedSmartPromptsPerWorkflowStateData;
  uint64_t v40;
  NSDate *createdAt;
  uint64_t v42;
  NSDate *modifiedAt;
  uint64_t v44;
  NSString *lastSavedOnDeviceName;
  void *v46;
  uint64_t v47;
  NSData *v48;
  void *v49;
  uint64_t v50;
  NSData *recordSystemFieldsData;
  WFCloudKitWorkflow *v52;

  v7 = a3;
  v8 = a4;
  v9 = -[WFCloudKitWorkflow init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedRecord, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    objc_msgSend(v7, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_msgSend(v7, "workflowSubtitle");
    v13 = objc_claimAutoreleasedReturnValue();
    workflowSubtitle = v10->_workflowSubtitle;
    v10->_workflowSubtitle = (NSString *)v13;

    objc_msgSend(v7, "associatedAppBundleIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    associatedAppBundleIdentifier = v10->_associatedAppBundleIdentifier;
    v10->_associatedAppBundleIdentifier = (NSString *)v15;

    objc_msgSend(v7, "source");
    v17 = objc_claimAutoreleasedReturnValue();
    source = v10->_source;
    v10->_source = (NSString *)v17;

    objc_msgSend(v7, "galleryIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    galleryIdentifier = v10->_galleryIdentifier;
    v10->_galleryIdentifier = (NSString *)v19;

    objc_msgSend(v7, "fileRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setName:", v22);

    objc_msgSend(v21, "writeToDiskWithError:", 0);
    v23 = objc_claimAutoreleasedReturnValue();
    serializedDataFile = v10->_serializedDataFile;
    v10->_serializedDataFile = (WFFileRepresentation *)v23;

    objc_msgSend(v7, "quarantine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serializedData");
    v26 = objc_claimAutoreleasedReturnValue();
    serializedQuarantineData = v10->_serializedQuarantineData;
    v10->_serializedQuarantineData = (NSData *)v26;

    v28 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v7, "accessResourcePerWorkflowStates");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", CFSTR("dictionaryRepresentation"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dataWithPropertyList:format:options:error:", v31, 200, 0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    serializedAccessResourcePerWorkflowStateData = v10->_serializedAccessResourcePerWorkflowStateData;
    v10->_serializedAccessResourcePerWorkflowStateData = (NSData *)v32;

    v34 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v7, "smartPromptPerWorkflowStates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "valueForKey:", CFSTR("dictionaryRepresentation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dataWithPropertyList:format:options:error:", v37, 200, 0, 0);
    v38 = objc_claimAutoreleasedReturnValue();
    serializedSmartPromptsPerWorkflowStateData = v10->_serializedSmartPromptsPerWorkflowStateData;
    v10->_serializedSmartPromptsPerWorkflowStateData = (NSData *)v38;

    objc_msgSend(v7, "creationDate");
    v40 = objc_claimAutoreleasedReturnValue();
    createdAt = v10->_createdAt;
    v10->_createdAt = (NSDate *)v40;

    objc_msgSend(v7, "modificationDate");
    v42 = objc_claimAutoreleasedReturnValue();
    modifiedAt = v10->_modifiedAt;
    v10->_modifiedAt = (NSDate *)v42;

    objc_msgSend(v7, "lastSavedOnDeviceName");
    v44 = objc_claimAutoreleasedReturnValue();
    lastSavedOnDeviceName = v10->_lastSavedOnDeviceName;
    v10->_lastSavedOnDeviceName = (NSString *)v44;

    objc_msgSend(v7, "quarantine");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "serializedData");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v10->_serializedQuarantineData;
    v10->_serializedQuarantineData = (NSData *)v47;

    objc_msgSend(v7, "cloudKitRecordMetadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    recordSystemFieldsData = v10->_recordSystemFieldsData;
    v10->_recordSystemFieldsData = (NSData *)v50;

    v10->_cachedSyncHash = objc_msgSend(v7, "syncHash");
    v10->_encryptedSchemaVersion = objc_msgSend(v7, "wantedEncryptedSchemaVersion");
    v52 = v10;

  }
  return v10;
}

- (id)recordRepresentationWithError:(id *)a3
{
  WFWorkflowRecord **p_cachedRecord;
  WFWorkflowRecord *cachedRecord;
  WFWorkflowRecord *v7;
  WFWorkflowRecord *v8;
  void *v9;
  WFWorkflowFileDescriptor *v10;
  void *v11;
  void *v12;
  WFWorkflowFileDescriptor *v13;
  WFWorkflowFile *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFWorkflowQuarantine *v24;
  void *v25;
  WFWorkflowQuarantine *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  p_cachedRecord = &self->_cachedRecord;
  cachedRecord = self->_cachedRecord;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (WFWorkflowRecord *)objc_claimAutoreleasedReturnValue();

  if (cachedRecord == v7)
    goto LABEL_16;
  if (cachedRecord)
  {
    cachedRecord = cachedRecord;
    v8 = cachedRecord;
    goto LABEL_17;
  }
  -[WFCloudKitWorkflow serializedDataFile](self, "serializedDataFile");
  cachedRecord = (WFWorkflowRecord *)objc_claimAutoreleasedReturnValue();
  if (!cachedRecord)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  -[WFCloudKitWorkflow name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_15:
    cachedRecord = 0;
    goto LABEL_16;
  }
  v10 = [WFWorkflowFileDescriptor alloc];
  -[WFCloudKitWorkflow serializedDataFile](self, "serializedDataFile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWorkflow name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFWorkflowFileDescriptor initWithFile:name:](v10, "initWithFile:name:", v11, v12);

  v14 = -[WFWorkflowFile initWithDescriptor:performMigration:error:]([WFWorkflowFile alloc], "initWithDescriptor:performMigration:error:", v13, 0, a3);
  -[WFWorkflowFile recordRepresentationWithError:](v14, "recordRepresentationWithError:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {

    goto LABEL_15;
  }
  -[WFCloudKitWorkflow name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", v16);

  -[WFCloudKitWorkflow createdAt](self, "createdAt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCreationDate:", v17);

  -[WFCloudKitWorkflow modifiedAt](self, "modifiedAt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setModificationDate:", v18);

  -[WFCloudKitWorkflow workflowSubtitle](self, "workflowSubtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWorkflowSubtitle:", v19);

  -[WFCloudKitWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAssociatedAppBundleIdentifier:", v20);

  -[WFCloudKitWorkflow source](self, "source");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSource:", v21);

  -[WFCloudKitWorkflow galleryIdentifier](self, "galleryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setGalleryIdentifier:", v22);

  -[WFCloudKitWorkflow serializedQuarantineData](self, "serializedQuarantineData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [WFWorkflowQuarantine alloc];
    -[WFCloudKitWorkflow serializedQuarantineData](self, "serializedQuarantineData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[WFWorkflowQuarantine initWithSerializedData:](v24, "initWithSerializedData:", v25);
    objc_msgSend(v15, "setQuarantine:", v26);

  }
  -[WFCloudKitWorkflow serializedAccessResourcePerWorkflowStateData](self, "serializedAccessResourcePerWorkflowStateData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C9AA60];
  if (v27)
  {
    v29 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCloudKitWorkflow serializedAccessResourcePerWorkflowStateData](self, "serializedAccessResourcePerWorkflowStateData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "propertyListWithData:options:format:error:", v30, 0, 0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = (void *)v31;
    else
      v33 = v28;
    v34 = v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v34, "if_compactMap:", &__block_literal_global_23110);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessResourcePerWorkflowStates:", v37);

  }
  else
  {
    v36 = (void *)objc_opt_new();
    objc_msgSend(v15, "setAccessResourcePerWorkflowStates:", v36);
  }

  -[WFCloudKitWorkflow serializedSmartPromptsPerWorkflowStateData](self, "serializedSmartPromptsPerWorkflowStateData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCloudKitWorkflow serializedSmartPromptsPerWorkflowStateData](self, "serializedSmartPromptsPerWorkflowStateData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "propertyListWithData:options:format:error:", v41, 0, 0, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if (v42)
      v44 = (void *)v42;
    else
      v44 = v28;
    v45 = v44;

    v46 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v45, "if_compactMap:", &__block_literal_global_166_23111);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setWithArray:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSmartPromptPerWorkflowStates:", v48);

  }
  else
  {
    v47 = (void *)objc_opt_new();
    objc_msgSend(v15, "setSmartPromptPerWorkflowStates:", v47);
  }

  -[WFCloudKitWorkflow lastSavedOnDeviceName](self, "lastSavedOnDeviceName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLastSavedOnDeviceName:", v49);

  -[WFCloudKitWorkflow recordSystemFieldsData](self, "recordSystemFieldsData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCloudKitRecordMetadata:", v50);

  objc_msgSend(v15, "setSyncHash:", -[WFCloudKitWorkflow cachedSyncHash](self, "cachedSyncHash"));
  objc_msgSend(v15, "setWantedEncryptedSchemaVersion:", -[WFCloudKitWorkflow encryptedSchemaVersion](self, "encryptedSchemaVersion"));
  objc_msgSend(v15, "setStorageIdentifier:", 0);
  objc_storeStrong((id *)p_cachedRecord, v15);

  v8 = v15;
  cachedRecord = self->_cachedRecord;
  self->_cachedRecord = v8;
LABEL_17:

  return v8;
}

- (BOOL)isValidForSyncing
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFCloudKitWorkflow name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFCloudKitWorkflow serializedDataFile](self, "serializedDataFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)modifiedAt
{
  return self->_modifiedAt;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)workflowSubtitle
{
  return self->_workflowSubtitle;
}

- (void)setWorkflowSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (WFFileRepresentation)serializedDataFile
{
  return self->_serializedDataFile;
}

- (void)setSerializedDataFile:(id)a3
{
  objc_storeStrong((id *)&self->_serializedDataFile, a3);
}

- (NSData)serializedQuarantineData
{
  return self->_serializedQuarantineData;
}

- (void)setSerializedQuarantineData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)serializedAccessResourcePerWorkflowStateData
{
  return self->_serializedAccessResourcePerWorkflowStateData;
}

- (void)setSerializedAccessResourcePerWorkflowStateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)lastSavedOnDeviceName
{
  return self->_lastSavedOnDeviceName;
}

- (void)setLastSavedOnDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)serializedSmartPromptsPerWorkflowStateData
{
  return self->_serializedSmartPromptsPerWorkflowStateData;
}

- (void)setSerializedSmartPromptsPerWorkflowStateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)cachedSyncHash
{
  return self->_cachedSyncHash;
}

- (void)setCachedSyncHash:(int64_t)a3
{
  self->_cachedSyncHash = a3;
}

- (int64_t)encryptedSchemaVersion
{
  return self->_encryptedSchemaVersion;
}

- (void)setEncryptedSchemaVersion:(int64_t)a3
{
  self->_encryptedSchemaVersion = a3;
}

- (WFWorkflowRecord)cachedRecord
{
  return self->_cachedRecord;
}

- (void)setCachedRecord:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecord, 0);
  objc_storeStrong((id *)&self->_serializedSmartPromptsPerWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_lastSavedOnDeviceName, 0);
  objc_storeStrong((id *)&self->_serializedAccessResourcePerWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_serializedQuarantineData, 0);
  objc_storeStrong((id *)&self->_serializedDataFile, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowSubtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

WFSerializedSmartPromptPerWorkflowState *__52__WFCloudKitWorkflow_recordRepresentationWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFSerializedSmartPromptPerWorkflowState *v3;

  v2 = a2;
  v3 = -[WFSerializedSmartPromptPerWorkflowState initWithDictionary:]([WFSerializedSmartPromptPerWorkflowState alloc], "initWithDictionary:", v2);

  return v3;
}

WFSerializedAccessResourcePerWorkflowState *__52__WFCloudKitWorkflow_recordRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFSerializedAccessResourcePerWorkflowState *v3;

  v2 = a2;
  v3 = -[WFSerializedAccessResourcePerWorkflowState initWithDictionary:]([WFSerializedAccessResourcePerWorkflowState alloc], "initWithDictionary:", v2);

  return v3;
}

@end
