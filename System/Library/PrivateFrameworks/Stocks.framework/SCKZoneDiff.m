@implementation SCKZoneDiff

- (SCKZoneDiff)initWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4
{
  id v6;
  id v7;
  SCKZoneDiff *v8;
  uint64_t v9;
  NSArray *modifiedRecords;
  uint64_t v11;
  NSArray *deletedRecordIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCKZoneDiff;
  v8 = -[SCKZoneDiff init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    modifiedRecords = v8->_modifiedRecords;
    v8->_modifiedRecords = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    deletedRecordIDs = v8->_deletedRecordIDs;
    v8->_deletedRecordIDs = (NSArray *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SCKZoneDiff modifiedRecords](self, "modifiedRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKZoneDiff deletedRecordIDs](self, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithModifiedRecords:deletedRecordIDs:", v5, v6);

  return v7;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SCKZoneDiff modifiedRecords](self, "modifiedRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[SCKZoneDiff deletedRecordIDs](self, "deletedRecordIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (id)applyToRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "recordID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[SCKZoneDiff modifiedRecords](self, "modifiedRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v18, "recordID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v15);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SCKZoneDiff deletedRecordIDs](self, "deletedRecordIDs", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(v5, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)applyToModifyRecordsOperation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BDBCE30];
  v5 = a3;
  v6 = [v4 alloc];
  -[SCKZoneDiff modifiedRecords](self, "modifiedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
  objc_msgSend(v5, "setRecordsToSave:", v8);

  -[SCKZoneDiff deletedRecordIDs](self, "deletedRecordIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordIDsToDelete:", v9);

}

- (BOOL)hasSameBaseAsDiff:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[SCKZoneDiff deletedRecordIDs](self, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToSet:", v10))
  {
    v41 = v10;
    v42 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[SCKZoneDiff modifiedRecords](self, "modifiedRecords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v53 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v17, "recordID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "modifiedRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v25, "recordID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v25, v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v22);
    }

    v27 = objc_msgSend(v11, "count");
    if (v27 == objc_msgSend(v19, "count"))
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = v11;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v29)
      {
        v30 = v29;
        v40 = v4;
        v43 = *(_QWORD *)v45;
        while (2)
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v45 != v43)
              objc_enumerationMutation(v28);
            v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
            objc_msgSend(v28, "objectForKeyedSubscript:", v32, v40);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x24BEDCDF0];
            objc_msgSend(v33, "recordChangeTag");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "recordChangeTag");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v35) = objc_msgSend(v35, "sck_object:isEqualToObject:", v36, v37);

            if (!(_DWORD)v35)
            {
              v38 = 0;
              goto LABEL_29;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v30)
            continue;
          break;
        }
        v38 = 1;
LABEL_29:
        v4 = v40;
      }
      else
      {
        v38 = 1;
      }

    }
    else
    {
      v38 = 0;
    }
    v10 = v41;

    v7 = v42;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (NSArray)modifiedRecords
{
  return self->_modifiedRecords;
}

- (NSArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_modifiedRecords, 0);
}

@end
