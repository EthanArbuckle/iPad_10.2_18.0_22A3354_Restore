@implementation PLUserFeedback

- (NSString)detailedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserFeedback uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserFeedback memory](self, "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserFeedback person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLUserFeedback type](self, "type");
  v8 = -[PLUserFeedback feature](self, "feature");
  v9 = -[PLUserFeedback creationType](self, "creationType");
  -[PLUserFeedback context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserFeedback lastModifiedDate](self, "lastModifiedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ - UUID %@, Memory %@, Person %@, type %hd, feature %hd, crearionType %hd, context %@, lastModifiedDate %@, isDeleted:%d"), v15, v14, v4, v6, v7, v8, v9, v10, v11, -[PLUserFeedback isDeleted](self, "isDeleted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLUserFeedback uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUserFeedback uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PLUserFeedbackUUID"));

  }
  if (-[PLUserFeedback type](self, "type"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLUserFeedback type](self, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("PLUserFeedbackType"));

  }
  if (-[PLUserFeedback feature](self, "feature"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLUserFeedback feature](self, "feature"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PLUserFeedbackFeature"));

  }
  if (-[PLUserFeedback creationType](self, "creationType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLUserFeedback creationType](self, "creationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("PLUserFeedbackCreationType"));

  }
  -[PLUserFeedback context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLUserFeedback context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PLUserFeedbackContext"));

  }
  -[PLUserFeedback lastModifiedDate](self, "lastModifiedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLUserFeedback lastModifiedDate](self, "lastModifiedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("PLUserFeedbackLastModifiedDate"));

  }
  return v3;
}

- (BOOL)_relationshipsInInvalidState
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PLUserFeedback person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLUserFeedback memory](self, "memory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[PLUserFeedback person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5 = 0;
  }
  else
  {
    -[PLUserFeedback memory](self, "memory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 == 0;

  }
  if (v3)
  {
    v4 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BOOL)_validateRelationshipConstraintForInsert:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[PLUserFeedback _relationshipsInInvalidState](self, "_relationshipsInInvalidState", a3, a4))
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (v4)
        v7 = CFSTR("insert");
      else
        v7 = CFSTR("update");
      -[PLUserFeedback detailedDescription](self, "detailedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_FAULT, "Attemping to %@ an orphaned UserFeedback. An UserFeedback object should always have a Person or Memory relationship set: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  return 1;
}

- (BOOL)_validateNonNilUUID:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if ((MEMORY[0x19AEC0720](self, a2) & 1) != 0)
    return 1;
  -[PLUserFeedback uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    return 1;
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Attemping to insert/update UserFeedback with nil UUID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 71001, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[PLUserFeedback detailedDescription](self, "detailedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Attemping to insert/update UserFeedback with nil UUID: %@", (uint8_t *)&v13, 0xCu);

  }
  return 0;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUserFeedback;
  v5 = -[PLUserFeedback validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
  {
    v5 = -[PLUserFeedback _validateRelationshipConstraintForInsert:error:](self, "_validateRelationshipConstraintForInsert:error:", 1, a3);
    if (v5)
      LOBYTE(v5) = -[PLUserFeedback _validateNonNilUUID:](self, "_validateNonNilUUID:", a3);
  }
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLUserFeedback;
  v5 = -[PLUserFeedback validateForUpdate:](&v8, sel_validateForUpdate_);
  if (v5)
  {
    v6 = -[PLUserFeedback _validateRelationshipConstraintForInsert:error:](self, "_validateRelationshipConstraintForInsert:error:", 0, a3);
    LOBYTE(v5) = 0;
    if (v6)
      LOBYTE(v5) = -[PLUserFeedback _validateNonNilUUID:](self, "_validateNonNilUUID:", a3);
  }
  return v5;
}

- (void)prepareForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLUserFeedback;
  -[PLManagedObject prepareForDeletion](&v4, sel_prepareForDeletion);
  -[PLUserFeedback managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "recordCloudDeletionForObject:", self);

}

- (BOOL)_isPersonFeatureAutonamingType
{
  int v3;

  v3 = -[PLUserFeedback feature](self, "feature");
  if (v3 != 1)
    LOBYTE(v3) = -[PLUserFeedback feature](self, "feature") == 2;
  return v3;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (BOOL)supportsCloudUpload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PLUserFeedback memory](self, "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLUserFeedback memory](self, "memory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "supportsCloudUpload");

    return v7;
  }
  -[PLUserFeedback person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUserFeedback person](self, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scopedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D11468]);
  -[PLUserFeedback scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserFeedback uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplSuggestionChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
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
  uint64_t v20;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PLUserFeedback scopedIdentifier](self, "scopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D114B0], "newChangeWithScopedIdentifier:changeType:", v3, 0);
  objc_msgSend(v4, "setState:", 1);
  -[PLUserFeedback lastModifiedDate](self, "lastModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreationDate:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0D114C8]);
  -[PLUserFeedback memory](self, "memory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "setType:", 101);
    v8 = objc_alloc_init(MEMORY[0x1E0D114B8]);
    -[PLUserFeedback memory](self, "memory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMemoryIdentifier:", v10);

    objc_msgSend(v8, "setType:", -[PLUserFeedback type](self, "type"));
    objc_msgSend(v8, "setFeature:", -[PLUserFeedback feature](self, "feature"));
    -[PLUserFeedback context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContext:", v11);

    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v6, "setMemorys:", v13);

LABEL_9:
    goto LABEL_10;
  }
  -[PLUserFeedback person](self, "person");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "setType:", 102);
    v8 = objc_alloc_init(MEMORY[0x1E0D114C0]);
    -[PLUserFeedback person](self, "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "personUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPersonIdentifier:", v16);

    objc_msgSend(v8, "setType:", -[PLUserFeedback type](self, "type"));
    objc_msgSend(v8, "setFeature:", -[PLUserFeedback feature](self, "feature"));
    -[PLUserFeedback context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContext:", v17);

    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v6, "setPersons:", v19);

    if (-[PLUserFeedback feature](self, "feature"))
    {
      if (!-[PLUserFeedback _isPersonFeatureAutonamingType](self, "_isPersonFeatureAutonamingType"))
        goto LABEL_9;
      v20 = 1102;
    }
    else
    {
      v20 = 1101;
    }
    objc_msgSend(v4, "setSubtype:", v20);
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v4, "setRecordList:", v6);

  return v4;
}

- (int64_t)cloudDeletionType
{
  return 9;
}

- (id)_objectUsedForPersistence
{
  void *v3;
  void *v4;
  void *v5;

  -[PLUserFeedback memory](self, "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLUserFeedback memory](self, "memory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLUserFeedback person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PLUserFeedback person](self, "person");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isValidForPersistence
{
  void *v2;
  char v3;

  -[PLUserFeedback _objectUsedForPersistence](self, "_objectUsedForPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValidForPersistence");

  return v3;
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLUserFeedback _objectUsedForPersistence](self, "_objectUsedForPersistence");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistMetadataToFileSystemWithPathManager:", v4);

}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLUserFeedback _objectUsedForPersistence](self, "_objectUsedForPersistence");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePersistedFileSystemDataWithPathManager:", v4);

}

+ (id)entityName
{
  return CFSTR("UserFeedback");
}

+ (id)_userFeedbacksMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C97B48];
  v13 = a3;
  objc_msgSend(a1, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchBatchSize:", 100);
  objc_msgSend(v15, "setPredicate:", v13);

  if (v10)
    objc_msgSend(v15, "setSortDescriptors:", v10);
  if (a5 >= 1)
    objc_msgSend(v15, "setFetchLimit:", a5);
  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v15, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;
  if (v16 || *MEMORY[0x1E0D115D0])
  {
    if (v16)
    {
      v19 = v16;
      goto LABEL_13;
    }
  }
  else
  {
    __CPLAssetsdOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch user feedbacks: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v20 = v19;

  return v20;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setUuid:", v6);
  objc_msgSend(v9, "setCreationType:", 1);
  return v9;
}

+ (id)insertIntoManagedObjectContext:(id)a3 withDictionaryRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertIntoManagedObjectContext:withUUID:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12)
        objc_msgSend(v10, "setType:", v12);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackFeature"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (v14)
        objc_msgSend(v10, "setFeature:", v14);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackCreationType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      if (v16)
        objc_msgSend(v10, "setCreationType:", v16);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v10, "setContext:", v17);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLUserFeedbackLastModifiedDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v10, "setLastModifiedDate:", v18);
      v19 = v10;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)userFeedbackWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userFeedbacksMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v8, 0, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)userFeedbacksWithUUIDs:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userFeedbacksMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v8, 0, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)newestUserFeedbackInSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastModifiedDate"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldHandleCPLSuggestionChange:(id)a3
{
  return objc_msgSend(a3, "type") - 101 < 2;
}

+ (id)updateUserFeedback:(id)a3 withCPLSuggestionChange:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  void *v34;
  _BYTE v36[24];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v8, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastModifiedDate:", v10);

    objc_msgSend(v7, "setCloudLocalState:", 1);
    objc_msgSend(v8, "recordList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "memorysCount"))
    {
      objc_msgSend(v11, "memorys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setType:", (__int16)-[NSObject type](v13, "type"));
      objc_msgSend(v7, "setFeature:", (__int16)-[NSObject feature](v13, "feature"));
      -[NSObject context](v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContext:", v14);

      -[NSObject memoryIdentifier](v13, "memoryIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v7, "setMemory:", v17);
        goto LABEL_9;
      }
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_33:

LABEL_34:
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "detailedDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v36 = 138412290;
            *(_QWORD *)&v36[4] = v34;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Deleting UserFeedback in updateUserFeedback:withCPLSuggestionChange:inManagedObjectContext: %@", v36, 0xCu);

          }
        }
        goto LABEL_38;
      }
      __CPLAssetsdOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "detailedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v36 = 138412802;
        *(_QWORD *)&v36[4] = v15;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v8;
        *(_WORD *)&v36[22] = 2112;
        v37 = v31;
        v32 = "Failed to find the right PLMemory %@ to associate CPLSuggestion %@ change with, deleting PLUserFeedback %@";
LABEL_31:
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, v32, v36, 0x20u);

      }
    }
    else
    {
      if (!objc_msgSend(v11, "personsCount"))
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_34;
          objc_msgSend(v7, "detailedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v36 = 138412546;
          *(_QWORD *)&v36[4] = v8;
          *(_WORD *)&v36[12] = 2112;
          *(_QWORD *)&v36[14] = v15;
          v22 = "Failed to find any PLMemory or PLPerson entries in record list to associate CPLSuggestion %@ change with"
                ", deleting PLUserFeedback %@";
          v23 = v13;
          v24 = 22;
          goto LABEL_27;
        }
LABEL_38:
        objc_msgSend(v9, "deleteObject:", v7, *(_OWORD *)v36, *(_QWORD *)&v36[16], v37);
        v18 = 0;
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(v11, "persons");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setType:", (__int16)-[NSObject type](v13, "type"));
      objc_msgSend(v7, "setFeature:", (__int16)-[NSObject feature](v13, "feature"));
      -[NSObject context](v13, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContext:", v20);

      -[NSObject personIdentifier](v13, "personIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v15, v9);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v17 = (void *)v21;
        objc_msgSend(v7, "setPerson:", v21);
LABEL_9:

        if (!objc_msgSend(v7, "_relationshipsInInvalidState"))
        {
          objc_msgSend(v7, "person");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            v27 = objc_msgSend(v7, "_isPersonFeatureAutonamingType");

            if (v27)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v7, "detailedDescription");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v36 = 138412290;
                  *(_QWORD *)&v36[4] = v29;
                  _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Posting darwin notification for autonaming user feedback %@", v36, 0xCu);

                }
              }
              pl_notify_post_with_retry();
            }
          }
          v18 = v7;
          goto LABEL_39;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_34;
          objc_msgSend(v7, "detailedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v36 = 138412290;
          *(_QWORD *)&v36[4] = v15;
          v22 = "UserFeedback relationships are in an invalid state, deleting PLUserFeedback %@";
          v23 = v13;
          v24 = 12;
LABEL_27:
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, v22, v36, v24);
          goto LABEL_33;
        }
        goto LABEL_38;
      }
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_33;
      __CPLAssetsdOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "detailedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v36 = 138412802;
        *(_QWORD *)&v36[4] = v15;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v8;
        *(_WORD *)&v36[22] = 2112;
        v37 = v31;
        v32 = "Failed to find the right PLPerson %@ to associate CPLSuggestion %@ change with, deleting PLUserFeedback %@";
        goto LABEL_31;
      }
    }

    goto LABEL_33;
  }
  v18 = 0;
LABEL_40:

  return v18;
}

+ (id)userFeedbacksToUploadInManagedObjectContext:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3928];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("lastModifiedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortDescriptorWithKey:ascending:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_userFeedbacksMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v7, v11, a4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v19, "supportsCloudUpload"))
          objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v13;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 9;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("uuid");
}

- (id)payloadID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLUserFeedback memory](self, "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLUserFeedback memory](self, "memory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLUserFeedback person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = 0;
      return v8;
    }
    -[PLUserFeedback person](self, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personUUID");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PLUserFeedback memory](self, "memory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLUserFeedback person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 0;
      goto LABEL_10;
    }
    -[PLUserFeedback person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isValidForPersistence"))
    {
      v7 = off_1E365A658;
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[PLUserFeedback memory](self, "memory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isValidForPersistence") & 1) == 0)
    goto LABEL_8;
  v7 = off_1E3659FB0;
LABEL_7:
  v9 = (void *)objc_msgSend(objc_alloc(*v7), "initWithUserFeedback:changedKeys:", self, v4);
LABEL_9:

LABEL_10:
  return v9;
}

@end
