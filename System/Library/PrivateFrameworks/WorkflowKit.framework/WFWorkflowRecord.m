@implementation WFWorkflowRecord

+ (id)workflowSubtitleForActionCount:(unint64_t)a3 savedSubtitle:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (a3 == 1 && v5)
  {
    v7 = v5;
  }
  else
  {
    +[WFWorkflow localizedSubtitleWithActionCount:](WFWorkflow, "localizedSubtitleWithActionCount:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)loadFromPeaceData:(id)a3 keyImageData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  WFWorkflowFile *v27;
  void *v28;
  WFWorkflowFile *v29;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 1, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v31[0] = CFSTR("WFLWorkflowActions");
    v31[1] = CFSTR("WFLWorkflowActionIdentifier");
    v32[0] = CFSTR("WFWorkflowActions");
    v32[1] = CFSTR("WFWorkflowActionIdentifier");
    v31[2] = CFSTR("WFLWorkflowActionParameters");
    v31[3] = CFSTR("com.apple.WorkflowKit.actions.handle-intent");
    v32[2] = CFSTR("WFWorkflowActionParameters");
    v32[3] = CFSTR("is.workflow.actions.sirikit.donation.handle");
    v31[4] = CFSTR("com.apple.WorkflowKit.actions.open-user-activity");
    v32[4] = CFSTR("is.workflow.actions.useractivity.open");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = WFMapPropertyListStrings(v13, v14);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFWorkflowActions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    objc_msgSend(v18, "objectMatchingKey:value:", CFSTR("WFWorkflowActionIdentifier"), CFSTR("is.workflow.actions.useractivity.open"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setValue:forKey:", v9, CFSTR("UserActivityImageData"));
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFLWorkflowDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    WFEnforceClass(v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRecord setWorkflowSubtitle:](self, "setWorkflowSubtitle:", v22);

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFLWorkflowAssociatedAppBundleIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    WFEnforceClass(v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRecord setAssociatedAppBundleIdentifier:](self, "setAssociatedAppBundleIdentifier:", v25);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("name"), CFSTR("actions"), 0);
    v27 = [WFWorkflowFile alloc];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WFLWorkflowName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[WFWorkflowFile initWithDictionary:name:](v27, "initWithDictionary:name:", v13, v28);

    -[WFRecord loadFromStorage:properties:](self, "loadFromStorage:properties:", v29, v26);
  }

  objc_autoreleasePoolPop(v10);
  return v13 != 0;
}

- (WFWorkflowRecord)initWithPeaceCloudKitRecord:(id)a3 error:(id *)a4
{
  id v6;
  WFWorkflowRecord *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFWorkflowRecord *v16;

  v6 = a3;
  v7 = -[WFRecord initWithStorage:](self, "initWithStorage:", 0);
  if (v7)
  {
    objc_msgSend(v6, "encryptedValuesByKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serializedWorkflowData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "encryptedValuesByKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keyImageData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[WFWorkflowRecord loadFromPeaceData:keyImageData:error:](v7, "loadFromPeaceData:keyImageData:error:", v9, v11, a4))
      {
        -[WFWorkflowRecord name](v7, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowRecord setWorkflowSubtitle:](v7, "setWorkflowSubtitle:", v12);

        objc_msgSend(v6, "wf_decryptedStringForKey:", CFSTR("phrase"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowRecord setName:](v7, "setName:", v13);

        objc_msgSend(v6, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowRecord setCreationDate:](v7, "setCreationDate:", v14);

        objc_msgSend(v6, "modificationDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowRecord setModificationDate:](v7, "setModificationDate:", v15);

        v16 = v7;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (WFWorkflowRecord)initWithPeaceCoreDataModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  WFWorkflowRecord *v22;
  WFWorkflowRecord *v23;
  void *v24;
  WFWorkflowRecord *v25;

  v6 = a3;
  objc_msgSend(v6, "valueForKey:", CFSTR("serializedWorkflowData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("keyImageData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("phrase"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("dateCreated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  WFEnforceClass(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("dateLastModified"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  WFEnforceClass(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[WFRecord initWithStorage:](self, "initWithStorage:", 0);
  v23 = v22;
  if (v22
    && -[WFWorkflowRecord loadFromPeaceData:keyImageData:error:](v22, "loadFromPeaceData:keyImageData:error:", v9, v12, a4))
  {
    -[WFWorkflowRecord name](v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRecord setWorkflowSubtitle:](v23, "setWorkflowSubtitle:", v24);

    -[WFWorkflowRecord setName:](v23, "setName:", v15);
    -[WFWorkflowRecord setCreationDate:](v23, "setCreationDate:", v18);
    -[WFWorkflowRecord setModificationDate:](v23, "setModificationDate:", v21);
    v25 = v23;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setActions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *actions;
  int64_t v7;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  actions = self->_actions;
  self->_actions = v5;

  -[WFWorkflowRecord willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actionCount"));
  v7 = objc_msgSend(v4, "count");

  self->_actionCount = v7;
  -[WFWorkflowRecord didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actionCount"));
  -[WFRecord markPropertyModifiedIfNecessary:](self, "markPropertyModifiedIfNecessary:", CFSTR("actionCount"));
}

- (id)fileRepresentation
{
  WFWorkflowFile *v3;
  void *v4;
  void *v5;
  WFWorkflowFile *v6;

  v3 = [WFWorkflowFile alloc];
  v4 = (void *)objc_opt_new();
  -[WFWorkflowRecord name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFWorkflowFile initWithDictionary:name:performMigration:](v3, "initWithDictionary:name:performMigration:", v4, v5, 0);

  -[WFRecord writeToStorage:error:](self, "writeToStorage:error:", v6, 0);
  return v6;
}

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFWorkflowRecord name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wf_isEmpty");

  if (v8)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFWorkflowRecord saveChangesToStorage:error:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Could not save workflow record because name was empty", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v35[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Invalid Name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    v35[1] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Please enter a name for this shortcut."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 0, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v15 = -[WFWorkflowRecord wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion");
    v16 = +[WFCloudKitWorkflow latestEncryptedSchemaVersion](WFCloudKitWorkflow, "latestEncryptedSchemaVersion");
    if (v15 != v16)
    {
      v17 = v16;
      getWFWalrusLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[WFWorkflowRecord name](self, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v28 = "-[WFWorkflowRecord saveChangesToStorage:error:]";
        v29 = 2112;
        v30 = v19;
        v31 = 2048;
        v32 = v15;
        v33 = 2048;
        v34 = v17;
        _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_DEFAULT, "%s Saving %@ to storage, but Walrus version is wrong; fixing <old: %lld, new: %lld>",
          buf,
          0x2Au);

      }
      -[WFWorkflowRecord setWantedEncryptedSchemaVersion:](self, "setWantedEncryptedSchemaVersion:", v17);
    }
    -[WFRecord modifiedPropertiesSinceLastSave](self, "modifiedPropertiesSinceLastSave");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRecord setModificationDate:](self, "setModificationDate:", v22);

      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRecord setLastSavedOnDeviceName:](self, "setLastSavedOnDeviceName:", v24);

    }
    v26.receiver = self;
    v26.super_class = (Class)WFWorkflowRecord;
    v14 = -[WFRecord saveChangesToStorage:error:](&v26, sel_saveChangesToStorage_error_, v6, a4);
  }

  return v14;
}

- (BOOL)isEquivalentForSyncTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  char v54;
  BOOL v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  int64_t v67;
  BOOL v68;
  void *v69;
  void *v70;
  char v71;
  char v72;
  BOOL v73;
  char v75;
  BOOL v76;
  char v77;
  char v78;
  BOOL v79;
  char v80;
  char v81;
  char v82;
  BOOL v83;
  char v84;
  char v85;
  BOOL v86;
  char v87;
  char v88;
  BOOL v89;
  char v90;
  char v91;
  char v92;
  char v93;
  void *v94;
  void *v95;
  char v96;
  char v97;
  uint64_t v98;

  v4 = a3;
  -[WFWorkflowRecord name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  -[WFWorkflowRecord icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v7, "isEqual:", v8);

  -[WFWorkflowRecord associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    LOBYTE(v14) = 1;
    if (v11 && v12)
      v14 = objc_msgSend(v11, "isEqualToString:", v12) ^ 1;
  }
  v96 = v14;

  v15 = (void *)MEMORY[0x1E0C99E20];
  -[WFWorkflowRecord workflowTypes](self, "workflowTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC8518];
  objc_msgSend(v17, "removeObject:", *MEMORY[0x1E0DC8518]);
  v19 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "workflowTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "removeObject:", v18);
  v94 = v21;
  v95 = v17;
  v93 = objc_msgSend(v17, "isEqualToSet:", v21);
  v22 = (void *)MEMORY[0x1E0C99E60];
  -[WFWorkflowRecord inputClasses](self, "inputClasses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "inputClasses");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v24, "isEqualToSet:", v27);

  -[WFWorkflowRecord noInputBehavior](self, "noInputBehavior");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noInputBehavior");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 == v29)
  {
    v91 = 0;
  }
  else
  {
    -[WFWorkflowRecord noInputBehavior](self, "noInputBehavior");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noInputBehavior");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqualToDictionary:", v31);

    v91 = v32 ^ 1;
  }

  v33 = (void *)MEMORY[0x1E0C99E60];
  -[WFWorkflowRecord outputClasses](self, "outputClasses");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "outputClasses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v35, "isEqualToSet:", v38);

  v89 = -[WFWorkflowRecord hasShortcutInputVariables](self, "hasShortcutInputVariables");
  v88 = objc_msgSend(v4, "hasShortcutInputVariables");
  v86 = -[WFWorkflowRecord hasOutputFallback](self, "hasOutputFallback");
  v85 = objc_msgSend(v4, "hasOutputFallback");
  v83 = -[WFWorkflowRecord disabledOnLockScreen](self, "disabledOnLockScreen");
  v82 = objc_msgSend(v4, "disabledOnLockScreen");
  -[WFWorkflowRecord actions](self, "actions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39 == v40)
  {
    v87 = 0;
  }
  else
  {
    -[WFWorkflowRecord actions](self, "actions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToArray:", v42);

    v87 = v43 ^ 1;
  }

  -[WFWorkflowRecord importQuestions](self, "importQuestions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importQuestions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 == v45)
  {
    v81 = 0;
  }
  else
  {
    -[WFWorkflowRecord importQuestions](self, "importQuestions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importQuestions");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqualToArray:", v47);

    v81 = v48 ^ 1;
  }

  -[WFWorkflowRecord quarantine](self, "quarantine");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quarantine");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 == v50)
  {
    v80 = 0;
  }
  else
  {
    -[WFWorkflowRecord quarantine](self, "quarantine");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quarantine");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    v80 = v53 ^ 1;
  }

  v79 = -[WFWorkflowRecord hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync");
  v77 = objc_msgSend(v4, "hiddenFromLibraryAndSync");
  v76 = -[WFWorkflowRecord hiddenInComplication](self, "hiddenInComplication");
  v54 = objc_msgSend(v4, "hiddenInComplication");
  v55 = -[WFWorkflowRecord isDeleted](self, "isDeleted");
  v56 = objc_msgSend(v4, "isDeleted");
  -[WFWorkflowRecord accessResourcePerWorkflowStates](self, "accessResourcePerWorkflowStates");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessResourcePerWorkflowStates");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57 == v58)
  {
    v78 = 0;
  }
  else
  {
    -[WFWorkflowRecord accessResourcePerWorkflowStates](self, "accessResourcePerWorkflowStates");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessResourcePerWorkflowStates");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqualToSet:", v60);

    v78 = v61 ^ 1;
  }

  -[WFWorkflowRecord smartPromptPerWorkflowStates](self, "smartPromptPerWorkflowStates");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smartPromptPerWorkflowStates");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62 == v63)
  {
    v75 = 0;
  }
  else
  {
    -[WFWorkflowRecord smartPromptPerWorkflowStates](self, "smartPromptPerWorkflowStates");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smartPromptPerWorkflowStates");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqualToSet:", v65);

    v75 = v66 ^ 1;
  }
  v84 = v83 ^ v82;

  v67 = -[WFWorkflowRecord remoteQuarantineStatus](self, "remoteQuarantineStatus");
  v68 = v67 == objc_msgSend(v4, "remoteQuarantineStatus");
  -[WFWorkflowRecord source](self, "source");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v69, "isEqualToString:", v70);

  v72 = v97 ^ 1;
  if (v98)
    v72 = 1;
  v73 = v68 & ~(v72 | v96 | v93 ^ 1 | v92 ^ 1 | v91 | v90 ^ 1 | v89 ^ v88 | v86 ^ v85 | v87 | v81 | v80 | v79 ^ v77 | v76 ^ v54 | v55 ^ v56 | v78 | v75) & ~v84 & v71;

  return v73;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)legacyName
{
  return self->_legacyName;
}

- (void)setLegacyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)workflowSubtitle
{
  return self->_workflowSubtitle;
}

- (void)setWorkflowSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)actionsDescription
{
  return self->_actionsDescription;
}

- (void)setActionsDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier
{
  return self->_shouldAutoUpdateAssociatedAppBundleIdentifier;
}

- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3
{
  self->_shouldAutoUpdateAssociatedAppBundleIdentifier = a3;
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (WFWorkflowQuarantine)quarantine
{
  return self->_quarantine;
}

- (void)setQuarantine:(id)a3
{
  objc_storeStrong((id *)&self->_quarantine, a3);
}

- (NSArray)workflowTypes
{
  return self->_workflowTypes;
}

- (void)setWorkflowTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)quickActionSurfacesForSharing
{
  return self->_quickActionSurfacesForSharing;
}

- (void)setQuickActionSurfacesForSharing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)inputClasses
{
  return self->_inputClasses;
}

- (void)setInputClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)noInputBehavior
{
  return self->_noInputBehavior;
}

- (void)setNoInputBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)outputClasses
{
  return self->_outputClasses;
}

- (void)setOutputClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)hasShortcutInputVariables
{
  return self->_hasShortcutInputVariables;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  self->_hasShortcutInputVariables = a3;
}

- (BOOL)hasOutputFallback
{
  return self->_hasOutputFallback;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  self->_hasOutputFallback = a3;
}

- (BOOL)disabledOnLockScreen
{
  return self->_disabledOnLockScreen;
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  self->_disabledOnLockScreen = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (int64_t)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(int64_t)a3
{
  self->_actionCount = a3;
}

- (NSArray)importQuestions
{
  return self->_importQuestions;
}

- (void)setImportQuestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)minimumClientVersion
{
  return self->_minimumClientVersion;
}

- (void)setMinimumClientVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)hiddenInComplication
{
  return self->_hiddenInComplication;
}

- (void)setHiddenInComplication:(BOOL)a3
{
  self->_hiddenInComplication = a3;
}

- (BOOL)hiddenFromLibraryAndSync
{
  return self->_hiddenFromLibraryAndSync;
}

- (void)setHiddenFromLibraryAndSync:(BOOL)a3
{
  self->_hiddenFromLibraryAndSync = a3;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (NSString)lastMigratedClientVersion
{
  return self->_lastMigratedClientVersion;
}

- (void)setLastMigratedClientVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (NSString)lastSavedOnDeviceName
{
  return self->_lastSavedOnDeviceName;
}

- (void)setLastSavedOnDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return self->_lastSyncedEncryptedSchemaVersion;
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
  self->_lastSyncedEncryptedSchemaVersion = a3;
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return self->_wantedEncryptedSchemaVersion;
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
  self->_wantedEncryptedSchemaVersion = a3;
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (NSSet)accessResourcePerWorkflowStates
{
  return self->_accessResourcePerWorkflowStates;
}

- (void)setAccessResourcePerWorkflowStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSSet)smartPromptPerWorkflowStates
{
  return self->_smartPromptPerWorkflowStates;
}

- (void)setSmartPromptPerWorkflowStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)remoteQuarantineStatus
{
  return self->_remoteQuarantineStatus;
}

- (void)setRemoteQuarantineStatus:(int64_t)a3
{
  self->_remoteQuarantineStatus = a3;
}

- (NSData)remoteQuarantineHash
{
  return self->_remoteQuarantineHash;
}

- (void)setRemoteQuarantineHash:(id)a3
{
  objc_storeStrong((id *)&self->_remoteQuarantineHash, a3);
}

- (BOOL)isConflictOfOtherWorkflow
{
  return self->_conflictOfOtherWorkflow;
}

- (NSData)cloudKitRecordMetadata
{
  return self->_cloudKitRecordMetadata;
}

- (void)setCloudKitRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (void)setSyncHash:(int64_t)a3
{
  self->_syncHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_remoteQuarantineHash, 0);
  objc_storeStrong((id *)&self->_smartPromptPerWorkflowStates, 0);
  objc_storeStrong((id *)&self->_accessResourcePerWorkflowStates, 0);
  objc_storeStrong((id *)&self->_lastSavedOnDeviceName, 0);
  objc_storeStrong((id *)&self->_lastMigratedClientVersion, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_importQuestions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_outputClasses, 0);
  objc_storeStrong((id *)&self->_noInputBehavior, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_quickActionSurfacesForSharing, 0);
  objc_storeStrong((id *)&self->_workflowTypes, 0);
  objc_storeStrong((id *)&self->_quarantine, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsDescription, 0);
  objc_storeStrong((id *)&self->_workflowSubtitle, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_legacyName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)defaultIcon
{
  return objc_alloc_init(MEMORY[0x1E0DC7E38]);
}

+ (id)defaultCreationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)defaultModificationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)defaultWorkflowTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)defaultQuickActionSurfacesForSharing
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)defaultInputClasses
{
  void *v2;
  void *v3;

  +[WFWorkflow supportedInputClassNames](WFWorkflow, "supportedInputClassNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultOutputClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)defaultHasShortcutInputVariables
{
  return 0;
}

+ (BOOL)defaultDisabledOnLockScreen
{
  return 0;
}

+ (id)defaultActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (int64_t)defaultActionCount
{
  return 0;
}

+ (id)defaultImportQuestions
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)defaultDeleted
{
  return 0;
}

+ (id)defaultLastSavedOnDeviceName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultLastMigratedClientVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultAccessResourcePerWorkflowStates
{
  return (id)objc_opt_new();
}

+ (id)defaultSmartPromptPerWorkflowStates
{
  return (id)objc_opt_new();
}

+ (BOOL)defaultHasOutputFallback
{
  return 1;
}

+ (BOOL)defaultShouldAutoUpdateAssociatedAppBundleIdentifier
{
  return 1;
}

- (void)addWatchWorkflowType
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFWorkflowRecord *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowRecord workflowTypes](self, "workflowTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", *MEMORY[0x1E0DC8510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRecord setWorkflowTypes:](self, "setWorkflowTypes:", v4);

  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[WFWorkflowRecord(WatchEligibility) addWatchWorkflowType]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Added watch workflow type to workflow %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)addWatchWorkflowTypeIfEligible
{
  void *v3;
  void *v4;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiersOfActionsDisabledOnWatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[WFWorkflowRecord addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:](self, "addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:", v4);
  return (char)self;
}

- (BOOL)addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  BOOL v8;
  int v10;
  const char *v11;
  __int16 v12;
  WFWorkflowRecord *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[WFWorkflowRecord(WatchEligibility) addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Adding watch workflow type to record %@", (uint8_t *)&v10, 0x16u);
  }

  -[WFWorkflowRecord workflowTypes](self, "workflowTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0DC8510]);

  if ((v7 & 1) == 0)
  {
    if (!-[WFWorkflowRecord isEligibleForWatchWithIneligibleActionIdentifiers:](self, "isEligibleForWatchWithIneligibleActionIdentifiers:", v4))
    {
      v8 = 0;
      goto LABEL_8;
    }
    -[WFWorkflowRecord addWatchWorkflowType](self, "addWatchWorkflowType");
  }
  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)isEligibleForWatch
{
  void *v3;
  void *v4;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiersOfActionsDisabledOnWatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[WFWorkflowRecord isEligibleForWatchWithIneligibleActionIdentifiers:](self, "isEligibleForWatchWithIneligibleActionIdentifiers:", v4);
  return (char)self;
}

- (BOOL)isEligibleForWatchWithIneligibleActionIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[WFWorkflowRecord actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__WFWorkflowRecord_WatchEligibility__isEligibleForWatchWithIneligibleActionIdentifiers___block_invoke;
  v10[3] = &unk_1E7AF9420;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  return v8;
}

uint64_t __88__WFWorkflowRecord_WatchEligibility__isEligibleForWatchWithIneligibleActionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFWorkflowActionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  else
    v6 = 0;

  objc_autoreleasePoolPop(v4);
  return v6;
}

@end
