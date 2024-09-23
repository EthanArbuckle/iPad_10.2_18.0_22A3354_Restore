@implementation SCWZoneModificationSilo

- (SCWZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4
{
  id v7;
  id v8;
  SCWZoneModificationSilo *v9;
  SCWZoneModificationSilo *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *originalRecordsByID;
  NSMutableDictionary *v13;
  NSMutableDictionary *workingRecordsByID;
  NSMutableDictionary *v15;
  NSMutableDictionary *recordsToSaveByID;
  NSMutableArray *v17;
  NSMutableArray *deletedRecordIDs;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCWZoneModificationSilo;
  v9 = -[SCWZoneModificationSilo init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneSchema, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    originalRecordsByID = v10->_originalRecordsByID;
    v10->_originalRecordsByID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    workingRecordsByID = v10->_workingRecordsByID;
    v10->_workingRecordsByID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recordsToSaveByID = v10->_recordsToSaveByID;
    v10->_recordsToSaveByID = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedRecordIDs = v10->_deletedRecordIDs;
    v10->_deletedRecordIDs = v17;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v23);
          -[SCWZoneModificationSilo originalRecordsByID](v10, "originalRecordsByID", (_QWORD)v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "recordID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

  }
  return v10;
}

- (SCWZoneDiff)diff
{
  SCWZoneDiff *v3;
  void *v4;
  void *v5;
  void *v6;
  SCWZoneDiff *v7;

  v3 = [SCWZoneDiff alloc];
  -[SCWZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCWZoneDiff initWithModifiedRecords:deletedRecordIDs:](v3, "initWithModifiedRecords:deletedRecordIDs:", v5, v6);

  return v7;
}

- (void)createOrUpdateRecordWithName:(id)a3 recordType:(id)a4 modifyBlock:(id)a5
{
  id v8;
  void (**v9)(id, id);
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (objc_class *)MEMORY[0x1E0C95070];
  v11 = a3;
  v12 = [v10 alloc];
  -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithRecordName:zoneID:", v11, v14);

  -[SCWZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v17;
    goto LABEL_4;
  }
  -[SCWZoneModificationSilo originalRecordsByID](self, "originalRecordsByID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (id)objc_msgSend(v20, "copy");
  if (v18)
  {
LABEL_4:
    -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isValidRecord:", v18);

    if ((v22 & 1) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", v8, v15);
LABEL_7:
  v9[2](v9, v18);
  -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isValidRecord:", v18);

  if (v24)
  {
    -[SCWZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v26);

    -[SCWZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, v28);

    -[SCWZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObject:", v15);

  }
  else if (-[SCWZoneModificationSilo _shouldAssertRecordValidity](self, "_shouldAssertRecordValidity")
         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[SCWZoneModificationSilo createOrUpdateRecordWithName:recordType:modifyBlock:].cold.1((uint64_t)v18);
  }
LABEL_12:

}

- (SCWZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (NSMutableDictionary)workingRecordsByID
{
  return self->_workingRecordsByID;
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (NSMutableDictionary)originalRecordsByID
{
  return self->_originalRecordsByID;
}

- (BOOL)recordExistsWithName:(id)a3
{
  void *v3;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v5 = (objc_class *)MEMORY[0x1E0C95070];
  v6 = a3;
  v7 = [v5 alloc];
  -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v6, v9);

  -[SCWZoneModificationSilo originalRecordsByID](self, "originalRecordsByID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[SCWZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      LOBYTE(v14) = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[SCWZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v10) ^ 1;

  if (!v12)
    goto LABEL_6;
LABEL_7:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_workingRecordsByID, 0);
  objc_storeStrong((id *)&self->_originalRecordsByID, 0);
  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

- (void)deleteRecordWithName:(id)a3
{
  id v4;
  id v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C95070]);
  -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v7);

  -[SCWZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[SCWZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v8);

  -[SCWZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SCWZoneModificationSilo zoneSchema](self, "zoneSchema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schemaForRecordType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v15, "fieldSchemas", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v21, "isEncrypted"))
          {
            objc_msgSend(v12, "encryptedValues");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v23);

          }
          else
          {
            objc_msgSend(v21, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v22);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

  }
}

- (BOOL)_shouldAssertRecordValidity
{
  if (_shouldAssertRecordValidity_onceToken[0] != -1)
    dispatch_once(_shouldAssertRecordValidity_onceToken, &__block_literal_global_1);
  return _shouldAssertRecordValidity_runningTests == 0;
}

Class __54__SCWZoneModificationSilo__shouldAssertRecordValidity__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  _shouldAssertRecordValidity_runningTests = result != 0;
  return result;
}

- (void)setZoneSchema:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSchema, a3);
}

- (void)setOriginalRecordsByID:(id)a3
{
  objc_storeStrong((id *)&self->_originalRecordsByID, a3);
}

- (void)setWorkingRecordsByID:(id)a3
{
  objc_storeStrong((id *)&self->_workingRecordsByID, a3);
}

- (void)setRecordsToSaveByID:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSaveByID, a3);
}

- (void)setDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, a3);
}

- (void)createOrUpdateRecordWithName:(uint64_t)a1 recordType:modifyBlock:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_1ABCEF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "record was invalid after modification: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
