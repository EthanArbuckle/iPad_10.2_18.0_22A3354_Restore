@implementation WFCloudKitAutoShortcutsPreferences

+ (NSString)recordType
{
  return (NSString *)CFSTR("AutoShortcutsPreferences");
}

+ (NSDictionary)properties
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("appDescriptor");
  v2 = *MEMORY[0x1E0CEC4A0];
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("appDescriptorFileRepresentation"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("appName");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("disabledAutoShortcuts");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("disabledAutoShortcutsFileRepresentation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("isSiriEnabled");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  v12[4] = CFSTR("isSpotlightEnabled");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

+ (id)recordIDWithZoneID:(id)a3 identifier:(id)a4
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
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitAutoShortcutsPreferences.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitAutoShortcutsPreferences.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AutoShortcutsPreferences"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v10, v7);

  return v11;
}

+ (BOOL)isAutoShortcutsPreferencesRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("AutoShortcutsPreferences"));

  return v4;
}

+ (id)identifierForRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-"), CFSTR("AutoShortcutsPreferences"));
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

- (WFCloudKitAutoShortcutsPreferences)initWithAutoShortcutsPreferences:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  WFCloudKitAutoShortcutsPreferences *v8;
  WFCloudKitAutoShortcutsPreferences *v9;
  uint64_t v10;
  INAppDescriptor *appDescriptor;
  void *v12;
  uint64_t v13;
  WFFileRepresentation *appDescriptorFileRepresentation;
  uint64_t v15;
  NSString *appName;
  uint64_t v17;
  NSSet *disabledAutoShortcuts;
  void *v19;
  uint64_t v20;
  WFFileRepresentation *disabledAutoShortcutsFileRepresentation;
  uint64_t v22;
  NSData *recordSystemFieldsData;
  WFCloudKitAutoShortcutsPreferences *v24;

  v6 = a3;
  v7 = a4;
  v8 = -[WFCloudKitAutoShortcutsPreferences init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    objc_msgSend(v6, "appDescriptor");
    v10 = objc_claimAutoreleasedReturnValue();
    appDescriptor = v9->_appDescriptor;
    v9->_appDescriptor = (INAppDescriptor *)v10;

    objc_msgSend(v6, "appDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitAutoShortcutsPreferences fileRepresentationFromObject:](v9, "fileRepresentationFromObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    appDescriptorFileRepresentation = v9->_appDescriptorFileRepresentation;
    v9->_appDescriptorFileRepresentation = (WFFileRepresentation *)v13;

    objc_msgSend(v6, "appName");
    v15 = objc_claimAutoreleasedReturnValue();
    appName = v9->_appName;
    v9->_appName = (NSString *)v15;

    v9->_isSiriEnabled = objc_msgSend(v6, "isSiriEnabled");
    v9->_isSpotlightEnabled = objc_msgSend(v6, "isSpotlightEnabled");
    objc_msgSend(v6, "disabledAutoShortcuts");
    v17 = objc_claimAutoreleasedReturnValue();
    disabledAutoShortcuts = v9->_disabledAutoShortcuts;
    v9->_disabledAutoShortcuts = (NSSet *)v17;

    objc_msgSend(v6, "disabledAutoShortcuts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitAutoShortcutsPreferences fileRepresentationFromObject:](v9, "fileRepresentationFromObject:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    disabledAutoShortcutsFileRepresentation = v9->_disabledAutoShortcutsFileRepresentation;
    v9->_disabledAutoShortcutsFileRepresentation = (WFFileRepresentation *)v20;

    objc_msgSend(v6, "cloudKitMetadata");
    v22 = objc_claimAutoreleasedReturnValue();
    recordSystemFieldsData = v9->_recordSystemFieldsData;
    v9->_recordSystemFieldsData = (NSData *)v22;

    v24 = v9;
  }

  return v9;
}

- (id)dataFromObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

- (id)fileRepresentationFromObject:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  -[WFCloudKitAutoShortcutsPreferences dataFromObject:error:](self, "dataFromObject:error:", a3, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    getWFDatabaseLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFCloudKitAutoShortcutsPreferences fileRepresentationFromObject:]";
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Error converting object to data: %{public}@", buf, 0x16u);
    }

  }
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileWithData:ofType:proposedFilename:", v3, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INAppDescriptor)appDescriptor
{
  INAppDescriptor *appDescriptor;
  void *v4;
  void *v5;
  INAppDescriptor *v6;
  INAppDescriptor *v7;

  appDescriptor = self->_appDescriptor;
  if (!appDescriptor)
  {
    -[WFCloudKitAutoShortcutsPreferences appDescriptorFileRepresentation](self, "appDescriptorFileRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFDatabase appDescriptorFromData:](WFDatabase, "appDescriptorFromData:", v5);
    v6 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();
    v7 = self->_appDescriptor;
    self->_appDescriptor = v6;

    appDescriptor = self->_appDescriptor;
  }
  return appDescriptor;
}

- (NSSet)disabledAutoShortcuts
{
  NSSet *disabledAutoShortcuts;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  disabledAutoShortcuts = self->_disabledAutoShortcuts;
  if (!disabledAutoShortcuts)
  {
    -[WFCloudKitAutoShortcutsPreferences disabledAutoShortcutsFileRepresentation](self, "disabledAutoShortcutsFileRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFDatabase disabledAutoShortcutsFromData:](WFDatabase, "disabledAutoShortcutsFromData:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_disabledAutoShortcuts;
    self->_disabledAutoShortcuts = v6;

    disabledAutoShortcuts = self->_disabledAutoShortcuts;
  }
  return disabledAutoShortcuts;
}

- (id)fileRepresentations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WFCloudKitAutoShortcutsPreferences appDescriptorFileRepresentation](self, "appDescriptorFileRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFCloudKitAutoShortcutsPreferences appDescriptorFileRepresentation](self, "appDescriptorFileRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[WFCloudKitAutoShortcutsPreferences disabledAutoShortcutsFileRepresentation](self, "disabledAutoShortcutsFileRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFCloudKitAutoShortcutsPreferences disabledAutoShortcutsFileRepresentation](self, "disabledAutoShortcutsFileRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (void)setAppDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptor, a3);
}

- (void)setDisabledAutoShortcuts:(id)a3
{
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, a3);
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (void)setRecordSystemFieldsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFFileRepresentation)appDescriptorFileRepresentation
{
  return self->_appDescriptorFileRepresentation;
}

- (void)setAppDescriptorFileRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptorFileRepresentation, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (BOOL)isSiriEnabled
{
  return self->_isSiriEnabled;
}

- (void)setIsSiriEnabled:(BOOL)a3
{
  self->_isSiriEnabled = a3;
}

- (BOOL)isSpotlightEnabled
{
  return self->_isSpotlightEnabled;
}

- (void)setIsSpotlightEnabled:(BOOL)a3
{
  self->_isSpotlightEnabled = a3;
}

- (WFFileRepresentation)disabledAutoShortcutsFileRepresentation
{
  return self->_disabledAutoShortcutsFileRepresentation;
}

- (void)setDisabledAutoShortcutsFileRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_disabledAutoShortcutsFileRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledAutoShortcutsFileRepresentation, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appDescriptorFileRepresentation, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
