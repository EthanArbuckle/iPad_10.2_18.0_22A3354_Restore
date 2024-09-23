@implementation REMAccountStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daConstraintsDescriptionPath, 0);
  objc_storeStrong((id *)&self->_personIDSalt, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_smartListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_listIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_templatesManualOrdering, 0);
  objc_storeStrong((id *)&self->_pinnedListsManualOrdering, 0);
  objc_storeStrong((id *)&self->_listIDsMergeableOrderingData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_listIDsMergeableOrdering, 0);
  objc_storeStrong((id *)&self->_accountTypeHost, 0);
}

- (id)accountTypeHost
{
  REMAccountTypeHost *accountTypeHost;
  uint64_t v4;
  REMAccountTypeHost *v5;
  REMAccountTypeHost *v6;

  accountTypeHost = self->_accountTypeHost;
  if (!accountTypeHost
    || (v4 = -[REMAccountTypeHost _accountType](accountTypeHost, "_accountType"),
        v4 != -[REMAccountStorage type](self, "type")))
  {
    v5 = -[REMAccountTypeHost initWithType:]([REMAccountTypeHost alloc], "initWithType:", -[REMAccountStorage type](self, "type"));
    v6 = self->_accountTypeHost;
    self->_accountTypeHost = v5;

  }
  return self->_accountTypeHost;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration)
    self->_storeGeneration = a3;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDAccount");
}

- (REMAccountStorage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  REMAccountStorage *v19;
  REMAccountStorage *v20;
  void *v21;
  void *v22;
  NSData *listIDsMergeableOrderingData;
  NSObject *v24;
  void *v25;
  REMAccountStorage *v26;
  REMCRMergeableOrderedSet *listIDsMergeableOrdering;
  uint64_t v28;
  void *v29;
  void *v30;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  _BOOL4 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daSyncToken"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daPushKey"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v6 >= 8)
  {
    v7 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMAccountStorage initWithCoder:].cold.2();

    v6 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v8 = objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("markedForRemoval"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedListsManualOrdering"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templatesManualOrdering"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("listIDsToUndelete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("smartListIDsToUndelete"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)v8;
  v18 = (void *)v5;
  if (v6 && v5 && v8)
  {
    v19 = -[REMAccountStorage initWithObjectID:type:name:nullableListIDsMergeableOrdering:](self, "initWithObjectID:type:name:nullableListIDsMergeableOrdering:", v5, v6, v8, 0);
    v20 = v19;
    v21 = (void *)v44;
    if (v19)
    {
      v41 = (void *)v8;
      -[REMAccountStorage setExternalIdentifier:](v19, "setExternalIdentifier:", v44);
      -[REMAccountStorage setExternalModificationTag:](v20, "setExternalModificationTag:", v50);
      -[REMAccountStorage setDaSyncToken:](v20, "setDaSyncToken:", v49);
      -[REMAccountStorage setDaPushKey:](v20, "setDaPushKey:", v48);
      -[REMAccountStorage setMarkedForRemoval:](v20, "setMarkedForRemoval:", v42);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listIDsMergeableOrdering"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v22;
      if (v22)
      {
        objc_storeStrong((id *)&v20->_listIDsMergeableOrdering, v22);
        listIDsMergeableOrderingData = v20->_listIDsMergeableOrderingData;
        v20->_listIDsMergeableOrderingData = 0;
      }
      else
      {
        listIDsMergeableOrdering = v20->_listIDsMergeableOrdering;
        v20->_listIDsMergeableOrdering = 0;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listIDsMergeableOrderingData"));
        v28 = objc_claimAutoreleasedReturnValue();
        listIDsMergeableOrderingData = v20->_listIDsMergeableOrderingData;
        v20->_listIDsMergeableOrderingData = (NSData *)v28;
      }

      if (!v20->_listIDsMergeableOrdering && !v20->_listIDsMergeableOrderingData)
      {
        +[REMLogStore utility](REMLogStore, "utility");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          -[REMAccountStorage initWithCoder:].cold.1();

        v21 = (void *)v44;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v29;
      if (v30)
      {
        objc_storeStrong((id *)&v20->_resolutionTokenMap, v30);
        resolutionTokenMapData = v20->_resolutionTokenMapData;
        v20->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v20->_resolutionTokenMap;
        v20->_resolutionTokenMap = 0;

        v33 = v29;
        resolutionTokenMapData = v20->_resolutionTokenMapData;
        v20->_resolutionTokenMapData = v33;
      }

      -[REMAccountStorage setPinnedListsManualOrdering:](v20, "setPinnedListsManualOrdering:", v47);
      -[REMAccountStorage setTemplatesManualOrdering:](v20, "setTemplatesManualOrdering:", v46);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage setListIDsToUndelete:](v20, "setListIDsToUndelete:", v34);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage setSmartListIDsToUndelete:](v20, "setSmartListIDsToUndelete:", v35);

      -[REMAccountStorage setListsDADisplayOrderChanged:](v20, "setListsDADisplayOrderChanged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("listsDADisplayOrderChanged")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage setPersonID:](v20, "setPersonID:", v36);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personIDSalt"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage setPersonIDSalt:](v20, "setPersonIDSalt:", v37);

      -[REMAccountStorage setInactive:](v20, "setInactive:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inactive")));
      -[REMAccountStorage setDidChooseToMigrate:](v20, "setDidChooseToMigrate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didChooseToMigrate")));
      -[REMAccountStorage setDidChooseToMigrateLocally:](v20, "setDidChooseToMigrateLocally:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didChooseToMigrateLocally")));
      -[REMAccountStorage setDidFinishMigration:](v20, "setDidFinishMigration:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didFinishMigration")));
      -[REMAccountStorage setPersistenceCloudSchemaVersion:](v20, "setPersistenceCloudSchemaVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("persistenceCloudSchemaVersion")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daConstraintsDescriptionPath"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage setDaConstraintsDescriptionPath:](v20, "setDaConstraintsDescriptionPath:", v38);

      -[REMAccountStorage setDaAllowsCalendarAddDeleteModify:](v20, "setDaAllowsCalendarAddDeleteModify:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daAllowsCalendarAddDeleteModify")));
      -[REMAccountStorage setDaSupportsSharedCalendars:](v20, "setDaSupportsSharedCalendars:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daSupportsSharedCalendars")));
      -[REMAccountStorage setDaWasMigrated:](v20, "setDaWasMigrated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daWasMigrated")));
      -[REMAccountStorage setMinimumSupportedVersion:](v20, "setMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedVersion")));
      -[REMAccountStorage setEffectiveMinimumSupportedVersion:](v20, "setEffectiveMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveMinimumSupportedVersion")));
      -[REMAccountStorage setDebugSyncDisabled:](v20, "setDebugSyncDisabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("debugSyncDisabled")));

      v17 = v41;
    }
    self = v20;
    v26 = self;
  }
  else
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v44;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      v52 = v18;
      v53 = 2048;
      v54 = v6;
      v55 = 2112;
      v56 = v17;
      v57 = 1024;
      v58 = -[REMAccountStorage markedForRemoval](self, "markedForRemoval");
      _os_log_fault_impl(&dword_1B4A39000, v24, OS_LOG_TYPE_FAULT, "Attempted to decode REMAccount missing objectID, type or name {objectID: %{public}@, type: %ld, name: %@, markedForRemoval: %d}", buf, 0x26u);
    }

    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("REMAccount missing required fields"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v25);

    v26 = 0;
  }

  return v26;
}

- (void)setPersonIDSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setPersistenceCloudSchemaVersion:(int64_t)a3
{
  self->_persistenceCloudSchemaVersion = a3;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (void)setInactive:(BOOL)a3
{
  self->_inactive = a3;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (void)setDidFinishMigration:(BOOL)a3
{
  self->_didFinishMigration = a3;
}

- (void)setDidChooseToMigrateLocally:(BOOL)a3
{
  self->_didChooseToMigrateLocally = a3;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  self->_didChooseToMigrate = a3;
}

- (void)setDebugSyncDisabled:(BOOL)a3
{
  self->_debugSyncDisabled = a3;
}

- (void)setDaWasMigrated:(BOOL)a3
{
  self->_daWasMigrated = a3;
}

- (void)setDaSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDaSupportsSharedCalendars:(BOOL)a3
{
  self->_daSupportsSharedCalendars = a3;
}

- (void)setDaPushKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDaConstraintsDescriptionPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setDaAllowsCalendarAddDeleteModify:(BOOL)a3
{
  self->_daAllowsCalendarAddDeleteModify = a3;
}

- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 nullableListIDsMergeableOrdering:(id)a6
{
  id v11;
  id v12;
  id v13;
  REMAccountStorage *v14;
  REMAccountStorage *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSData *v20;
  NSData *listIDsMergeableOrderingData;
  REMManualOrdering *pinnedListsManualOrdering;
  REMManualOrdering *templatesManualOrdering;
  REMResolutionTokenMap *v24;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v26;
  NSData *resolutionTokenMapData;
  uint64_t v28;
  NSSet *listIDsToUndelete;
  uint64_t v30;
  NSSet *smartListIDsToUndelete;
  void *v32;
  char v33;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  objc_super v41;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)REMAccountStorage;
  v14 = -[REMAccountStorage init](&v41, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_objectID, a3);
    v15->_type = a4;
    objc_storeStrong((id *)&v15->_name, a5);
    v15->_lock._os_unfair_lock_opaque = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2;
    v39 = __Block_byref_object_dispose__2;
    v40 = 0;
    os_unfair_lock_lock(&v15->_lock);
    v16 = v13;
    objc_msgSend(v16, "serializedData");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v36[5];
    v36[5] = v17;

    os_unfair_lock_unlock(&v15->_lock);
    v19 = (void *)v36[5];
    if (v19)
    {
      v20 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v20 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    listIDsMergeableOrderingData = v15->_listIDsMergeableOrderingData;
    v15->_listIDsMergeableOrderingData = v20;

    objc_storeStrong((id *)&v15->_listIDsMergeableOrdering, a6);
    pinnedListsManualOrdering = v15->_pinnedListsManualOrdering;
    v15->_pinnedListsManualOrdering = 0;

    templatesManualOrdering = v15->_templatesManualOrdering;
    v15->_templatesManualOrdering = 0;

    v24 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v15->_resolutionTokenMap;
    v15->_resolutionTokenMap = v24;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v26 = objc_claimAutoreleasedReturnValue();
    resolutionTokenMapData = v15->_resolutionTokenMapData;
    v15->_resolutionTokenMapData = (NSData *)v26;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    listIDsToUndelete = v15->_listIDsToUndelete;
    v15->_listIDsToUndelete = (NSSet *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    smartListIDsToUndelete = v15->_smartListIDsToUndelete;
    v15->_smartListIDsToUndelete = (NSSet *)v30;

    v15->_isAddingExtraPrimaryCKAccountForTesting = 0;
    *(_QWORD *)&v15->_listsDADisplayOrderChanged = 0x1000000000000;
    -[REMAccountStorage accountTypeHost](v15, "accountTypeHost");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isCloudKit");

    v15->_daWasMigrated = v33;
    _Block_object_dispose(&v35, 8);

  }
  return v15;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (void)setTemplatesManualOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_templatesManualOrdering, a3);
}

- (void)setSmartListIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_smartListIDsToUndelete, a3);
}

- (void)setPinnedListsManualOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedListsManualOrdering, a3);
}

- (void)setMarkedForRemoval:(BOOL)a3
{
  self->_markedForRemoval = a3;
}

- (void)setListsDADisplayOrderChanged:(BOOL)a3
{
  self->_listsDADisplayOrderChanged = a3;
}

- (void)setListIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_listIDsToUndelete, a3);
}

- (void)setResolutionTokenMapData:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, a3);
}

- (void)setResolutionTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMap, a3);
}

- (void)setListIDsMergeableOrderingData:(id)a3
{
  objc_storeStrong((id *)&self->_listIDsMergeableOrderingData, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v21;
  NSObject *v22;

  v4 = a3;
  if (self->_listIDsMergeableOrdering)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v4, "encodeObject:forKey:", self->_listIDsMergeableOrdering, CFSTR("listIDsMergeableOrdering"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("listIDsMergeableOrderingData"));
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (!self->_listIDsMergeableOrderingData)
    {
      +[REMLogStore utility](REMLogStore, "utility");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[REMAccountStorage encodeWithCoder:].cold.1(self, v22);

    }
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("listIDsMergeableOrdering"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_listIDsMergeableOrderingData, CFSTR("listIDsMergeableOrderingData"));
  }
  -[REMAccountStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMAccountStorage externalIdentifier](self, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("externalIdentifier"));

  -[REMAccountStorage externalModificationTag](self, "externalModificationTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("externalModificationTag"));

  -[REMAccountStorage daSyncToken](self, "daSyncToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("daSyncToken"));

  -[REMAccountStorage daPushKey](self, "daPushKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("daPushKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage type](self, "type"), CFSTR("type"));
  -[REMAccountStorage name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("name"));

  -[REMAccountStorage personID](self, "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("personID"));

  -[REMAccountStorage personIDSalt](self, "personIDSalt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("personIDSalt"));

  -[REMAccountStorage pinnedListsManualOrdering](self, "pinnedListsManualOrdering");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("pinnedListsManualOrdering"));

  -[REMAccountStorage templatesManualOrdering](self, "templatesManualOrdering");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("templatesManualOrdering"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage markedForRemoval](self, "markedForRemoval"), CFSTR("markedForRemoval"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage inactive](self, "inactive"), CFSTR("inactive"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didChooseToMigrate](self, "didChooseToMigrate"), CFSTR("didChooseToMigrate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didChooseToMigrateLocally](self, "didChooseToMigrateLocally"), CFSTR("didChooseToMigrateLocally"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didFinishMigration](self, "didFinishMigration"), CFSTR("didFinishMigration"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage persistenceCloudSchemaVersion](self, "persistenceCloudSchemaVersion"), CFSTR("persistenceCloudSchemaVersion"));
  -[REMAccountStorage daConstraintsDescriptionPath](self, "daConstraintsDescriptionPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("daConstraintsDescriptionPath"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daAllowsCalendarAddDeleteModify](self, "daAllowsCalendarAddDeleteModify"), CFSTR("daAllowsCalendarAddDeleteModify"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daSupportsSharedCalendars](self, "daSupportsSharedCalendars"), CFSTR("daSupportsSharedCalendars"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daWasMigrated](self, "daWasMigrated"), CFSTR("daWasMigrated"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage minimumSupportedVersion](self, "minimumSupportedVersion"), CFSTR("minimumSupportedVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), CFSTR("effectiveMinimumSupportedVersion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage debugSyncDisabled](self, "debugSyncDisabled"), CFSTR("debugSyncDisabled"));
  -[REMAccountStorage listIDsToUndelete](self, "listIDsToUndelete");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("listIDsToUndelete"));

  -[REMAccountStorage smartListIDsToUndelete](self, "smartListIDsToUndelete");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("smartListIDsToUndelete"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage listsDADisplayOrderChanged](self, "listsDADisplayOrderChanged"), CFSTR("listsDADisplayOrderChanged"));
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v4, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMAccountStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("resolutionTokenMapData"));

  }
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (BOOL)didChooseToMigrate
{
  return self->_didChooseToMigrate;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[REMAccountStorage name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMDisplayNameUtils displayNameFromAccountName:](REMDisplayNameUtils, "displayNameFromAccountName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (REMManualOrdering)templatesManualOrdering
{
  return self->_templatesManualOrdering;
}

- (NSSet)smartListIDsToUndelete
{
  return self->_smartListIDsToUndelete;
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (REMManualOrdering)pinnedListsManualOrdering
{
  return self->_pinnedListsManualOrdering;
}

- (NSString)personID
{
  return self->_personID;
}

- (NSData)personIDSalt
{
  return self->_personIDSalt;
}

- (int64_t)persistenceCloudSchemaVersion
{
  return self->_persistenceCloudSchemaVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (BOOL)markedForRemoval
{
  return self->_markedForRemoval;
}

- (BOOL)listsDADisplayOrderChanged
{
  return self->_listsDADisplayOrderChanged;
}

- (NSSet)listIDsToUndelete
{
  return self->_listIDsToUndelete;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (BOOL)didFinishMigration
{
  return self->_didFinishMigration;
}

- (BOOL)didChooseToMigrateLocally
{
  return self->_didChooseToMigrateLocally;
}

- (BOOL)debugSyncDisabled
{
  return self->_debugSyncDisabled;
}

- (BOOL)daWasMigrated
{
  return self->_daWasMigrated;
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (BOOL)daSupportsSharedCalendars
{
  return self->_daSupportsSharedCalendars;
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (NSString)daConstraintsDescriptionPath
{
  return self->_daConstraintsDescriptionPath;
}

- (BOOL)daAllowsCalendarAddDeleteModify
{
  return self->_daAllowsCalendarAddDeleteModify;
}

- (void)setListIDsMergeableOrdering:(id)a3
{
  NSData *listIDsMergeableOrderingData;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_listIDsMergeableOrdering, a3);
  if (v6)
  {
    listIDsMergeableOrderingData = self->_listIDsMergeableOrderingData;
    self->_listIDsMergeableOrderingData = 0;

  }
}

- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  REMCRMergeableOrderedSet *v11;
  void *v12;
  REMCRMergeableOrderedSet *v13;
  REMAccountStorage *v14;

  v8 = a5;
  v9 = a3;
  +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:](REMAccountStorage, "listIDsMergeableOrderingReplicaIDSourceWithAccountID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [REMCRMergeableOrderedSet alloc];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:orderedSet:](v11, "initWithReplicaIDSource:orderedSet:", v10, v12);

  v14 = -[REMAccountStorage initWithObjectID:type:name:listIDsMergeableOrdering:](self, "initWithObjectID:type:name:listIDsMergeableOrdering:", v9, a4, v8, v13);
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMAccountStorage *v4;
  void *v5;
  int64_t v6;
  void *v7;
  REMAccountStorage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = [REMAccountStorage alloc];
  -[REMAccountStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMAccountStorage type](self, "type");
  -[REMAccountStorage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMAccountStorage initWithObjectID:type:name:nullableListIDsMergeableOrdering:](v4, "initWithObjectID:type:name:nullableListIDsMergeableOrdering:", v5, v6, v7, 0);

  v9 = (void *)-[REMCRMergeableOrderedSet copy](self->_listIDsMergeableOrdering, "copy");
  -[REMAccountStorage setListIDsMergeableOrdering:](v8, "setListIDsMergeableOrdering:", v9);

  -[REMAccountStorage setListIDsMergeableOrderingData:](v8, "setListIDsMergeableOrderingData:", self->_listIDsMergeableOrderingData);
  -[REMAccountStorage externalIdentifier](self, "externalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setExternalIdentifier:](v8, "setExternalIdentifier:", v10);

  -[REMAccountStorage externalModificationTag](self, "externalModificationTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setExternalModificationTag:](v8, "setExternalModificationTag:", v11);

  -[REMAccountStorage daSyncToken](self, "daSyncToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setDaSyncToken:](v8, "setDaSyncToken:", v12);

  -[REMAccountStorage daPushKey](self, "daPushKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setDaPushKey:](v8, "setDaPushKey:", v13);

  -[REMAccountStorage pinnedListsManualOrdering](self, "pinnedListsManualOrdering");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[REMAccountStorage setPinnedListsManualOrdering:](v8, "setPinnedListsManualOrdering:", v15);

  -[REMAccountStorage templatesManualOrdering](self, "templatesManualOrdering");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[REMAccountStorage setTemplatesManualOrdering:](v8, "setTemplatesManualOrdering:", v17);

  v18 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v18;

  -[REMAccountStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setResolutionTokenMapData:](v8, "setResolutionTokenMapData:", v20);

  -[REMAccountStorage listIDsToUndelete](self, "listIDsToUndelete");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[REMAccountStorage setListIDsToUndelete:](v8, "setListIDsToUndelete:", v22);

  -[REMAccountStorage smartListIDsToUndelete](self, "smartListIDsToUndelete");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[REMAccountStorage setSmartListIDsToUndelete:](v8, "setSmartListIDsToUndelete:", v24);

  -[REMAccountStorage setListsDADisplayOrderChanged:](v8, "setListsDADisplayOrderChanged:", -[REMAccountStorage listsDADisplayOrderChanged](self, "listsDADisplayOrderChanged"));
  -[REMAccountStorage personID](self, "personID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setPersonID:](v8, "setPersonID:", v25);

  -[REMAccountStorage personIDSalt](self, "personIDSalt");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  -[REMAccountStorage setPersonIDSalt:](v8, "setPersonIDSalt:", v27);

  -[REMAccountStorage setInactive:](v8, "setInactive:", -[REMAccountStorage inactive](self, "inactive"));
  -[REMAccountStorage setDidChooseToMigrate:](v8, "setDidChooseToMigrate:", -[REMAccountStorage didChooseToMigrate](self, "didChooseToMigrate"));
  -[REMAccountStorage setDidChooseToMigrateLocally:](v8, "setDidChooseToMigrateLocally:", -[REMAccountStorage didChooseToMigrateLocally](self, "didChooseToMigrateLocally"));
  -[REMAccountStorage setDidFinishMigration:](v8, "setDidFinishMigration:", -[REMAccountStorage didFinishMigration](self, "didFinishMigration"));
  -[REMAccountStorage setPersistenceCloudSchemaVersion:](v8, "setPersistenceCloudSchemaVersion:", -[REMAccountStorage persistenceCloudSchemaVersion](self, "persistenceCloudSchemaVersion"));
  -[REMAccountStorage daConstraintsDescriptionPath](self, "daConstraintsDescriptionPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage setDaConstraintsDescriptionPath:](v8, "setDaConstraintsDescriptionPath:", v28);

  -[REMAccountStorage setDaAllowsCalendarAddDeleteModify:](v8, "setDaAllowsCalendarAddDeleteModify:", -[REMAccountStorage daAllowsCalendarAddDeleteModify](self, "daAllowsCalendarAddDeleteModify"));
  -[REMAccountStorage setDaSupportsSharedCalendars:](v8, "setDaSupportsSharedCalendars:", -[REMAccountStorage daSupportsSharedCalendars](self, "daSupportsSharedCalendars"));
  -[REMAccountStorage setDaWasMigrated:](v8, "setDaWasMigrated:", -[REMAccountStorage daWasMigrated](self, "daWasMigrated"));
  -[REMAccountStorage setMinimumSupportedVersion:](v8, "setMinimumSupportedVersion:", -[REMAccountStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  -[REMAccountStorage setEffectiveMinimumSupportedVersion:](v8, "setEffectiveMinimumSupportedVersion:", -[REMAccountStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  -[REMAccountStorage setDebugSyncDisabled:](v8, "setDebugSyncDisabled:", -[REMAccountStorage debugSyncDisabled](self, "debugSyncDisabled"));
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[REMAccountStorage type](self, "type");
  -[REMAccountStorage objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type:%ld, %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  unint64_t storeGeneration;
  unint64_t copyGeneration;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  storeGeneration = self->_storeGeneration;
  copyGeneration = self->_copyGeneration;
  v7 = -[REMAccountStorage type](self, "type");
  -[REMAccountStorage name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountStorage objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p[%ld.%ld] type:%ld name:%@ %@>"), v4, self, storeGeneration, copyGeneration, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (BOOL)isEqual:(id)a3
{
  REMAccountStorage *v4;
  REMAccountStorage *v5;
  REMAccountStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int64_t v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  _BOOL4 v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  _BOOL4 v83;
  _BOOL4 v84;
  _BOOL4 v85;
  _BOOL4 v86;
  int64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  _BOOL4 v94;
  _BOOL4 v95;
  _BOOL4 v96;
  int64_t v97;
  int64_t v98;
  _BOOL4 v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  NSObject *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  objc_class *v114;
  void *v115;
  REMCRMergeableOrderedSet *listIDsMergeableOrdering;
  REMCRMergeableOrderedSet *v117;
  objc_class *v118;
  void *v119;
  REMResolutionTokenMap *resolutionTokenMap;
  REMResolutionTokenMap *v121;
  int v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v4 = (REMAccountStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMAccountStorage objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMAccountStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_77;
      }
      -[REMAccountStorage name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage name](v6, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMAccountStorage name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage name](v6, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_77;
      }
      v20 = -[REMAccountStorage type](self, "type");
      if (v20 != -[REMAccountStorage type](v6, "type"))
        goto LABEL_77;
      v21 = -[REMAccountStorage markedForRemoval](self, "markedForRemoval");
      if (v21 != -[REMAccountStorage markedForRemoval](v6, "markedForRemoval"))
        goto LABEL_77;
      -[REMAccountStorage externalIdentifier](self, "externalIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage externalIdentifier](v6, "externalIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v23)
      {

      }
      else
      {
        v24 = (void *)v23;
        -[REMAccountStorage externalIdentifier](self, "externalIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage externalIdentifier](v6, "externalIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if (!v27)
          goto LABEL_77;
      }
      -[REMAccountStorage externalModificationTag](self, "externalModificationTag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage externalModificationTag](v6, "externalModificationTag");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v28 == (void *)v29)
      {

      }
      else
      {
        v30 = (void *)v29;
        -[REMAccountStorage externalModificationTag](self, "externalModificationTag");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage externalModificationTag](v6, "externalModificationTag");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqual:", v32);

        if (!v33)
          goto LABEL_77;
      }
      -[REMAccountStorage daSyncToken](self, "daSyncToken");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage daSyncToken](v6, "daSyncToken");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v34 == (void *)v35)
      {

      }
      else
      {
        v36 = (void *)v35;
        -[REMAccountStorage daSyncToken](self, "daSyncToken");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage daSyncToken](v6, "daSyncToken");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqual:", v38);

        if (!v39)
          goto LABEL_77;
      }
      -[REMAccountStorage daPushKey](self, "daPushKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage daPushKey](v6, "daPushKey");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        -[REMAccountStorage daPushKey](self, "daPushKey");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage daPushKey](v6, "daPushKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_77;
      }
      -[REMAccountStorage pinnedListsManualOrdering](self, "pinnedListsManualOrdering");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage pinnedListsManualOrdering](v6, "pinnedListsManualOrdering");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v46 == (void *)v47)
      {

      }
      else
      {
        v48 = (void *)v47;
        -[REMAccountStorage pinnedListsManualOrdering](self, "pinnedListsManualOrdering");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage pinnedListsManualOrdering](v6, "pinnedListsManualOrdering");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

        if (!v51)
          goto LABEL_77;
      }
      -[REMAccountStorage templatesManualOrdering](self, "templatesManualOrdering");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage templatesManualOrdering](v6, "templatesManualOrdering");
      v53 = objc_claimAutoreleasedReturnValue();
      if (v52 == (void *)v53)
      {

      }
      else
      {
        v54 = (void *)v53;
        -[REMAccountStorage templatesManualOrdering](self, "templatesManualOrdering");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage templatesManualOrdering](v6, "templatesManualOrdering");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v55, "isEqual:", v56);

        if (!v57)
          goto LABEL_77;
      }
      -[REMAccountStorage listIDsToUndelete](self, "listIDsToUndelete");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage listIDsToUndelete](v6, "listIDsToUndelete");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v58 == (void *)v59)
      {

      }
      else
      {
        v60 = (void *)v59;
        -[REMAccountStorage listIDsToUndelete](self, "listIDsToUndelete");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage listIDsToUndelete](v6, "listIDsToUndelete");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v61, "isEqual:", v62);

        if (!v63)
          goto LABEL_77;
      }
      -[REMAccountStorage smartListIDsToUndelete](self, "smartListIDsToUndelete");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountStorage smartListIDsToUndelete](v6, "smartListIDsToUndelete");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v64 == (void *)v65)
      {

      }
      else
      {
        v66 = (void *)v65;
        -[REMAccountStorage smartListIDsToUndelete](self, "smartListIDsToUndelete");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage smartListIDsToUndelete](v6, "smartListIDsToUndelete");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v67, "isEqual:", v68);

        if (!v69)
          goto LABEL_77;
      }
      v70 = -[REMAccountStorage listsDADisplayOrderChanged](self, "listsDADisplayOrderChanged");
      if (v70 == -[REMAccountStorage listsDADisplayOrderChanged](v6, "listsDADisplayOrderChanged"))
      {
        -[REMAccountStorage personID](self, "personID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage personID](v6, "personID");
        v72 = objc_claimAutoreleasedReturnValue();
        if (v71 == (void *)v72)
        {

        }
        else
        {
          v73 = (void *)v72;
          -[REMAccountStorage personID](self, "personID");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMAccountStorage personID](v6, "personID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v74, "isEqual:", v75);

          if (!v76)
            goto LABEL_77;
        }
        -[REMAccountStorage personIDSalt](self, "personIDSalt");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage personIDSalt](v6, "personIDSalt");
        v78 = objc_claimAutoreleasedReturnValue();
        if (v77 == (void *)v78)
        {

        }
        else
        {
          v79 = (void *)v78;
          -[REMAccountStorage personIDSalt](self, "personIDSalt");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMAccountStorage personIDSalt](v6, "personIDSalt");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v80, "isEqual:", v81);

          if (!v82)
            goto LABEL_77;
        }
        v83 = -[REMAccountStorage inactive](self, "inactive");
        if (v83 != -[REMAccountStorage inactive](v6, "inactive"))
          goto LABEL_77;
        v84 = -[REMAccountStorage didChooseToMigrate](self, "didChooseToMigrate");
        if (v84 != -[REMAccountStorage didChooseToMigrate](v6, "didChooseToMigrate"))
          goto LABEL_77;
        v85 = -[REMAccountStorage didChooseToMigrateLocally](self, "didChooseToMigrateLocally");
        if (v85 != -[REMAccountStorage didChooseToMigrateLocally](v6, "didChooseToMigrateLocally"))
          goto LABEL_77;
        v86 = -[REMAccountStorage didFinishMigration](self, "didFinishMigration");
        if (v86 != -[REMAccountStorage didFinishMigration](v6, "didFinishMigration"))
          goto LABEL_77;
        v87 = -[REMAccountStorage persistenceCloudSchemaVersion](self, "persistenceCloudSchemaVersion");
        if (v87 != -[REMAccountStorage persistenceCloudSchemaVersion](v6, "persistenceCloudSchemaVersion"))
          goto LABEL_77;
        -[REMAccountStorage daConstraintsDescriptionPath](self, "daConstraintsDescriptionPath");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage daConstraintsDescriptionPath](v6, "daConstraintsDescriptionPath");
        v89 = objc_claimAutoreleasedReturnValue();
        if (v88 == (void *)v89)
        {

        }
        else
        {
          v90 = (void *)v89;
          -[REMAccountStorage daConstraintsDescriptionPath](self, "daConstraintsDescriptionPath");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMAccountStorage daConstraintsDescriptionPath](v6, "daConstraintsDescriptionPath");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v91, "isEqual:", v92);

          if (!v93)
            goto LABEL_77;
        }
        v94 = -[REMAccountStorage daAllowsCalendarAddDeleteModify](self, "daAllowsCalendarAddDeleteModify");
        if (v94 != -[REMAccountStorage daAllowsCalendarAddDeleteModify](v6, "daAllowsCalendarAddDeleteModify"))
          goto LABEL_77;
        v95 = -[REMAccountStorage daSupportsSharedCalendars](self, "daSupportsSharedCalendars");
        if (v95 != -[REMAccountStorage daSupportsSharedCalendars](v6, "daSupportsSharedCalendars"))
          goto LABEL_77;
        v96 = -[REMAccountStorage daWasMigrated](self, "daWasMigrated");
        if (v96 != -[REMAccountStorage daWasMigrated](v6, "daWasMigrated"))
          goto LABEL_77;
        v97 = -[REMAccountStorage minimumSupportedVersion](self, "minimumSupportedVersion");
        if (v97 != -[REMAccountStorage minimumSupportedVersion](v6, "minimumSupportedVersion"))
          goto LABEL_77;
        v98 = -[REMAccountStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
        if (v98 != -[REMAccountStorage effectiveMinimumSupportedVersion](v6, "effectiveMinimumSupportedVersion"))
          goto LABEL_77;
        v99 = -[REMAccountStorage debugSyncDisabled](self, "debugSyncDisabled");
        if (v99 != -[REMAccountStorage debugSyncDisabled](v6, "debugSyncDisabled"))
          goto LABEL_77;
        if (!self->_listIDsMergeableOrdering || v6->_listIDsMergeableOrdering)
        {
          +[REMLogStore utility](REMLogStore, "utility");
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v114 = (objc_class *)objc_opt_class();
            NSStringFromClass(v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            listIDsMergeableOrdering = self->_listIDsMergeableOrdering;
            v117 = v6->_listIDsMergeableOrdering;
            v122 = 138543874;
            v123 = v115;
            v124 = 2112;
            v125 = listIDsMergeableOrdering;
            v126 = 2112;
            v127 = v117;
            _os_log_error_impl(&dword_1B4A39000, v100, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the listIDsMergeableOrdering. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-idsOrdering: %@, other-idsOrdering: %@}", (uint8_t *)&v122, 0x20u);

          }
        }
        -[REMAccountStorage listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage listIDsMergeableOrdering](v6, "listIDsMergeableOrdering");
        v102 = objc_claimAutoreleasedReturnValue();
        if (v101 == (void *)v102)
        {

        }
        else
        {
          v103 = (void *)v102;
          -[REMAccountStorage listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMAccountStorage listIDsMergeableOrdering](v6, "listIDsMergeableOrdering");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v104, "isEqual:", v105);

          if (!v106)
            goto LABEL_77;
        }
        if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
        {
          +[REMLogStore utility](REMLogStore, "utility");
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v118 = (objc_class *)objc_opt_class();
            NSStringFromClass(v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            resolutionTokenMap = self->_resolutionTokenMap;
            v121 = v6->_resolutionTokenMap;
            v122 = 138543874;
            v123 = v119;
            v124 = 2112;
            v125 = resolutionTokenMap;
            v126 = 2112;
            v127 = v121;
            _os_log_error_impl(&dword_1B4A39000, v108, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v122, 0x20u);

          }
        }
        -[REMAccountStorage resolutionTokenMap](self, "resolutionTokenMap");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccountStorage resolutionTokenMap](v6, "resolutionTokenMap");
        v110 = objc_claimAutoreleasedReturnValue();
        if (v109 == (void *)v110)
        {
          v13 = 1;
          v111 = v109;
        }
        else
        {
          v111 = (void *)v110;
          -[REMAccountStorage resolutionTokenMap](self, "resolutionTokenMap");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMAccountStorage resolutionTokenMap](v6, "resolutionTokenMap");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v112, "isEqual:", v113);

        }
        goto LABEL_78;
      }
    }
LABEL_77:
    v13 = 0;
LABEL_78:

    goto LABEL_79;
  }
  v13 = 1;
LABEL_79:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAccountStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMCRMergeableOrderedSet)listIDsMergeableOrdering
{
  REMCRMergeableOrderedSet **p_listIDsMergeableOrdering;
  REMCRMergeableOrderedSet *v4;
  REMCRMergeableOrderedSet *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  REMCRMergeableOrderedSet *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSData *listIDsMergeableOrderingData;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  REMAccountStorage *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_listIDsMergeableOrdering = &self->_listIDsMergeableOrdering;
  v4 = self->_listIDsMergeableOrdering;
  if (!v4)
  {
    -[REMAccountStorage objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:](REMAccountStorage, "listIDsMergeableOrderingReplicaIDSourceWithAccountID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMAccountStorage listIDsMergeableOrderingData](self, "listIDsMergeableOrderingData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x1E67F4000uLL;
    if (v8)
    {
      v21 = 0;
      v10 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:serializedData:error:]([REMCRMergeableOrderedSet alloc], "initWithReplicaIDSource:serializedData:error:", v7, v8, &v21);
      v11 = v21;
      +[REMLogStore utility](REMLogStore, "utility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[REMAccountStorage objectID](self, "objectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[REMCRMergeableOrderedSet count](v10, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = v14;
        _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "REMAccountStorage listIDsMergeableOrdering deserialized {objectID: %{public}@, self: %p, orderedSet.count: %@}", buf, 0x20u);

        v9 = 0x1E67F4000;
      }

      if (v10 && !v11)
      {
        listIDsMergeableOrderingData = self->_listIDsMergeableOrderingData;
        self->_listIDsMergeableOrderingData = 0;
LABEL_15:

        objc_storeStrong((id *)p_listIDsMergeableOrdering, v10);
        v5 = v10;

        goto LABEL_16;
      }
    }
    else
    {
      +[REMLogStore utility](REMLogStore, "utility");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[REMAccountStorage listIDsMergeableOrdering].cold.2(self, v16);

      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("listIDsMergeableOrderingData is nil when trying to deserialize from account storage"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    +[REMLogStore utility](REMLogStore, "utility");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[REMAccountStorage listIDsMergeableOrdering].cold.1();

    v18 = objc_alloc(*(Class *)(v9 + 3080));
    listIDsMergeableOrderingData = (NSData *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    v19 = objc_msgSend(v18, "initWithReplicaIDSource:orderedSet:", v7, listIDsMergeableOrderingData);

    v10 = (REMCRMergeableOrderedSet *)v19;
    goto LABEL_15;
  }
  v5 = v4;
LABEL_16:

  return v5;
}

- (id)serializedListIDsMergeableOrdering
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[REMCRMergeableOrderedSet serializedData](self->_listIDsMergeableOrdering, "serializedData");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v9[5];
  v9[5] = v4;

  os_unfair_lock_unlock(p_lock);
  v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (BOOL)hasDeserializedListIDsMergeableOrdering
{
  return self->_listIDsMergeableOrdering != 0;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMAccountStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken != -1)
    dispatch_once(&cdKeyToStorageKeyMap_onceToken, &__block_literal_global_3);
  return (id)cdKeyToStorageKeyMap_mapping;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  REMResolutionTokenMap **p_resolutionTokenMap;
  REMResolutionTokenMap *v4;
  REMResolutionTokenMap *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  p_resolutionTokenMap = &self->_resolutionTokenMap;
  v4 = self->_resolutionTokenMap;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[REMAccountStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore utility](REMLogStore, "utility");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMAccountStorage resolutionTokenMap].cold.1();

    }
    -[REMAccountStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:](REMResolutionTokenMap, "resolutionTokenMapWithJSONData:keyMap:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;

  }
  return v5;
}

+ (id)listIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3
{
  id v3;
  REMReplicaIDSource *v4;

  v3 = a3;
  v4 = -[REMReplicaIDSource initWithAccountID:objectID:property:]([REMReplicaIDSource alloc], "initWithAccountID:objectID:property:", v3, v3, CFSTR("listIDsMergeableOrdering"));

  return v4;
}

- (id)listIDsMergeableOrderingReplicaIDSource
{
  void *v2;
  void *v3;

  -[REMAccountStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:](REMAccountStorage, "listIDsMergeableOrderingReplicaIDSourceWithAccountID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isAddingExtraPrimaryCKAccountForTesting
{
  return self->_isAddingExtraPrimaryCKAccountForTesting;
}

- (void)_setIsAddingExtraPrimaryCKAccountForTesting:(BOOL)a3
{
  self->_isAddingExtraPrimaryCKAccountForTesting = a3;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSData)listIDsMergeableOrderingData
{
  return self->_listIDsMergeableOrderingData;
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2117;
  v4 = v0;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, v1, (uint64_t)v1, "rem_log_fault_if (_listIDsMergeableOrdering == nil && _listIDsMergeableOrderingData == nil) -- Attempted to decode REMAccountStorage with both _listIDsMergeableOrdering and _listIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_FAULT, "Unknown REMAccountType %ld", v1, 0xCu);
  OUTLINED_FUNCTION_3_1();
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543619;
  v8 = v4;
  v9 = 2117;
  v10 = v5;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, a2, v6, "rem_log_fault_if (self->_listIDsMergeableOrderingData == nil) -- Attempted to encode REMAccountStorage with both _listIDsMergeableOrdering and _listIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}", (uint8_t *)&v7);

}

- (void)listIDsMergeableOrdering
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v4, "Nil listIDsMergeableOrderingData when reading listIDsMergeableOrdering from account storage. Initialize an empty set {objectID: %{public}@}", v5);

}

- (void)resolutionTokenMap
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "Nil resolutionTokenMapData when reading resolutionTokenMap from account storage. Initialize an empty map {list: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

@end
