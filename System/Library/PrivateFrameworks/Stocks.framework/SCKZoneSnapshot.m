@implementation SCKZoneSnapshot

- (SCKZoneSnapshot)initWithZoneSchema:(id)a3 records:(id)a4
{
  id v8;
  id v9;
  SCKZoneSnapshot *v10;
  SCKZoneSnapshot *v11;
  uint64_t v12;
  NSArray *records;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCKZoneSnapshot.m"), 36, CFSTR("zone read context requires non-nil zone schema"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SCKZoneSnapshot;
  v10 = -[SCKZoneSnapshot init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zoneSchema, a3);
    if (v9)
    {
      v12 = objc_msgSend(v9, "copy");
      records = v11->_records;
      v11->_records = (NSArray *)v12;
    }
    else
    {
      records = v11->_records;
      v11->_records = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  return v11;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCKZoneSnapshot records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sck_dictionaryWithKeyBlock:", &__block_literal_global_9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sck_dictionaryWithKeyBlock:", &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "count");
  if (v9 == objc_msgSend(v8, "count"))
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v8, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqualToSet:", v15))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v17)
      {
        v18 = v17;
        v36 = v4;
        v37 = *(_QWORD *)v39;
        v34 = v15;
        v35 = v12;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v39 != v37)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKeyedSubscript:", v20, v34, v35, v36);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x24BEDCDF0];
            objc_msgSend(v21, "recordChangeTag");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "recordChangeTag");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v23) = objc_msgSend(v23, "sck_object:isEqualToObject:", v24, v25);

            if (!(_DWORD)v23
              || (objc_msgSend(v21, "valuesByKey"),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v22, "valuesByKey"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  v28 = __37__SCKZoneSnapshot_isEqualToSnapshot___block_invoke_6((uint64_t)v27, v26, v27),
                  v27,
                  v26,
                  !v28))
            {

LABEL_17:
              v32 = 0;
              v12 = v35;
              v4 = v36;
              v15 = v34;
              goto LABEL_19;
            }
            objc_msgSend(v21, "encryptedValuesByKey");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "encryptedValuesByKey");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = __37__SCKZoneSnapshot_isEqualToSnapshot___block_invoke_6((uint64_t)v30, v29, v30);

            if (!v31)
              goto LABEL_17;
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          v32 = 1;
          v12 = v35;
          v4 = v36;
          v15 = v34;
          if (v18)
            continue;
          break;
        }
      }
      else
      {
        v32 = 1;
      }
LABEL_19:

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

uint64_t __37__SCKZoneSnapshot_isEqualToSnapshot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

uint64_t __37__SCKZoneSnapshot_isEqualToSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

uint64_t __37__SCKZoneSnapshot_isEqualToSnapshot___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "changedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "changedKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToSet:", v11))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v23 = v11;
      v24 = v8;
      v15 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v17, v23, v24, (_QWORD)v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(MEMORY[0x24BEDCDF0], "sck_object:isEqualToObject:", v18, v19);

          if (!v20)
          {
            v21 = 0;
            goto LABEL_13;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
          continue;
        break;
      }
      v21 = 1;
LABEL_13:
      v11 = v23;
      v8 = v24;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)recordsOfType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[SCKZoneSnapshot records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __33__SCKZoneSnapshot_recordsOfType___block_invoke;
  v11[3] = &unk_24D74B848;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCKZoneSnapshot records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __33__SCKZoneSnapshot_recordsOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)recordOfType:(id)a3
{
  return -[SCKZoneSnapshot recordOfType:passingTest:](self, "recordOfType:passingTest:", a3, &__block_literal_global_19);
}

uint64_t __32__SCKZoneSnapshot_recordOfType___block_invoke()
{
  return 1;
}

- (id)recordOfType:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[SCKZoneSnapshot records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __44__SCKZoneSnapshot_recordOfType_passingTest___block_invoke;
  v18 = &unk_24D74C428;
  v19 = v6;
  v20 = v7;
  v9 = v7;
  v10 = v6;
  v11 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v15);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    -[SCKZoneSnapshot records](self, "records", v15, v16, v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

uint64_t __44__SCKZoneSnapshot_recordOfType_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v5 = 0;

  return v5;
}

- (id)recordWithName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = (objc_class *)MEMORY[0x24BDB91E8];
  v5 = a3;
  v6 = [v4 alloc];
  -[SCKZoneSnapshot zoneSchema](self, "zoneSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v5, v8);

  -[SCKZoneSnapshot records](self, "records");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __34__SCKZoneSnapshot_recordWithName___block_invoke;
  v16[3] = &unk_24D74B848;
  v11 = v9;
  v17 = v11;
  v12 = objc_msgSend(v10, "indexOfObjectPassingTest:", v16);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    -[SCKZoneSnapshot records](self, "records");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

uint64_t __34__SCKZoneSnapshot_recordWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)descriptionOfContents
{
  uint64_t v3;
  void *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  SCKZoneSnapshot *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = self;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[SCKZoneSnapshot records](self, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v27 = *(_QWORD *)v38;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v32 = v3;
        v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v3);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("recordName"));

        objc_msgSend(v4, "recordChangeTag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("changeTag"));

        objc_msgSend(v4, "creationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("creationDate"));

        objc_msgSend(v4, "modificationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("modificationDate"));

        -[SCKZoneSnapshot zoneSchema](v28, "zoneSchema");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "schemaForRecordType:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = v13;
        objc_msgSend(v13, "fieldSchemas");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if ((objc_msgSend(v19, "isEncrypted") & 1) != 0)
                objc_msgSend(v4, "encryptedValuesByKey");
              else
                objc_msgSend(v4, "valuesByKey");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                objc_msgSend(v19, "name");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v23);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v16);
        }

        objc_msgSend(v29, "addObject:", v5);
        v3 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);
  }

  objc_msgSend(v29, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (SCKZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (void)setZoneSchema:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSchema, a3);
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

@end
