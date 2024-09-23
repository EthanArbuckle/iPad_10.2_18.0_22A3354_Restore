@implementation SCKZoneModificationSilo

- (SCKZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4
{
  id v8;
  id v9;
  SCKZoneModificationSilo *v10;
  SCKZoneModificationSilo *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *originalRecordsByID;
  NSMutableDictionary *v14;
  NSMutableDictionary *workingRecordsByID;
  NSMutableDictionary *v16;
  NSMutableDictionary *recordsToSaveByID;
  NSMutableArray *v18;
  NSMutableArray *deletedRecordIDs;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCKZoneModificationSilo.m"), 36, CFSTR("zone modification context requires non-nil zone schema"));

  }
  v34.receiver = self;
  v34.super_class = (Class)SCKZoneModificationSilo;
  v10 = -[SCKZoneModificationSilo init](&v34, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zoneSchema, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    originalRecordsByID = v11->_originalRecordsByID;
    v11->_originalRecordsByID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    workingRecordsByID = v11->_workingRecordsByID;
    v11->_workingRecordsByID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    recordsToSaveByID = v11->_recordsToSaveByID;
    v11->_recordsToSaveByID = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    deletedRecordIDs = v11->_deletedRecordIDs;
    v11->_deletedRecordIDs = v18;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v24);
          -[SCKZoneModificationSilo originalRecordsByID](v11, "originalRecordsByID", (_QWORD)v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "recordID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v22);
    }

  }
  return v11;
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
  v10 = (objc_class *)MEMORY[0x24BDB91E8];
  v11 = a3;
  v12 = [v10 alloc];
  -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithRecordName:zoneID:", v11, v14);

  -[SCKZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v17;
    goto LABEL_4;
  }
  -[SCKZoneModificationSilo originalRecordsByID](self, "originalRecordsByID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (id)objc_msgSend(v20, "copy");
  if (v18)
  {
LABEL_4:
    -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isValidRecord:", v18);

    if ((v22 & 1) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", v8, v15);
LABEL_7:
  v9[2](v9, v18);
  -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isValidRecord:", v18);

  if (v24)
  {
    -[SCKZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v26);

    -[SCKZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, v28);

    -[SCKZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObject:", v15);

  }
  else if (-[SCKZoneModificationSilo _shouldAssertRecordValidity](self, "_shouldAssertRecordValidity")
         && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[SCKZoneModificationSilo createOrUpdateRecordWithName:recordType:modifyBlock:].cold.1((uint64_t)v18);
  }
LABEL_12:

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
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDB91E8]);
  -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v7);

  -[SCKZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[SCKZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v8);

  -[SCKZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schemaForRecordType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v15, "fieldNames", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v18);
    }

  }
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

  v5 = (objc_class *)MEMORY[0x24BDB91E8];
  v6 = a3;
  v7 = [v5 alloc];
  -[SCKZoneModificationSilo zoneSchema](self, "zoneSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v6, v9);

  -[SCKZoneModificationSilo originalRecordsByID](self, "originalRecordsByID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[SCKZoneModificationSilo workingRecordsByID](self, "workingRecordsByID");
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
  -[SCKZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v10) ^ 1;

  if (!v12)
    goto LABEL_6;
LABEL_7:

  return v14;
}

- (SCKZoneDiff)diff
{
  SCKZoneDiff *v3;
  void *v4;
  void *v5;
  void *v6;
  SCKZoneDiff *v7;

  v3 = [SCKZoneDiff alloc];
  -[SCKZoneModificationSilo recordsToSaveByID](self, "recordsToSaveByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKZoneModificationSilo deletedRecordIDs](self, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCKZoneDiff initWithModifiedRecords:deletedRecordIDs:](v3, "initWithModifiedRecords:deletedRecordIDs:", v5, v6);

  return v7;
}

- (BOOL)_shouldAssertRecordValidity
{
  if (_shouldAssertRecordValidity_onceToken != -1)
    dispatch_once(&_shouldAssertRecordValidity_onceToken, &__block_literal_global_0);
  return _shouldAssertRecordValidity_runningTests == 0;
}

Class __54__SCKZoneModificationSilo__shouldAssertRecordValidity__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  _shouldAssertRecordValidity_runningTests = result != 0;
  return result;
}

- (SCKZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (void)setZoneSchema:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSchema, a3);
}

- (NSMutableDictionary)originalRecordsByID
{
  return self->_originalRecordsByID;
}

- (void)setOriginalRecordsByID:(id)a3
{
  objc_storeStrong((id *)&self->_originalRecordsByID, a3);
}

- (NSMutableDictionary)workingRecordsByID
{
  return self->_workingRecordsByID;
}

- (void)setWorkingRecordsByID:(id)a3
{
  objc_storeStrong((id *)&self->_workingRecordsByID, a3);
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (void)setRecordsToSaveByID:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSaveByID, a3);
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_workingRecordsByID, 0);
  objc_storeStrong((id *)&self->_originalRecordsByID, 0);
  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

- (void)createOrUpdateRecordWithName:(uint64_t)a1 recordType:modifyBlock:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "record was invalid after modification: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
