@implementation SCWZoneSchema

- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 recordSchemas:(id)a5
{
  return -[SCWZoneSchema initWithName:atomic:version:recordSchemas:](self, "initWithName:atomic:version:recordSchemas:", a3, a4, 0, a5);
}

uint64_t __33__SCWZoneSchema_validateRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isValidRecord:", a2);
}

- (id)validateRecords:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SCWZoneSchema_validateRecords___block_invoke;
  v7[3] = &unk_1E5AF26B0;
  v7[4] = self;
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isValidRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWZoneSchema zoneName](self, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SCWZoneSchema recordSchemas](self, "recordSchemas", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "recordType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recordType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
          {
            LOBYTE(v11) = objc_msgSend(v14, "isValidRecord:", v4);
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSArray)recordSchemas
{
  return self->_recordSchemas;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (id)schemaForRecordType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SCWZoneSchema recordSchemas](self, "recordSchemas", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "recordType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 version:(unint64_t)a5 recordSchemas:(id)a6
{
  id v11;
  id v12;
  SCWZoneSchema *v13;
  id v14;
  uint64_t v15;
  CKRecordZoneID *zoneID;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SCWZoneSchema;
  v13 = -[SCWZoneSchema init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C95098]);
    v15 = objc_msgSend(v14, "initWithZoneName:ownerName:", v11, *MEMORY[0x1E0C94730]);
    zoneID = v13->_zoneID;
    v13->_zoneID = (CKRecordZoneID *)v15;

    objc_storeStrong((id *)&v13->_zoneName, a3);
    v13->_version = a5;
    objc_storeStrong((id *)&v13->_recordSchemas, a6);
    v13->_atomic = a4;
  }

  return v13;
}

- (NSArray)allRecordFieldNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SCWZoneSchema recordSchemas](self, "recordSchemas", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "fieldNames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isAtomic
{
  return self->_atomic;
}

- (void)setRecordSchemas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSchemas, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
