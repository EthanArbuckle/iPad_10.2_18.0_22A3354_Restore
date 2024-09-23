@implementation PMLTrainingStore

void __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleIdentifier", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":domainIdentifier", *(_QWORD *)(a1 + 40));

}

void __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleIdentifier", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":itemIdentifier", *(_QWORD *)(a1 + 40));

}

uint64_t __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":bundleIdentifier", *(_QWORD *)(a1 + 32));
}

- (void)deleteSessionsWithBundleId:(id)a3 domainId:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke;
  v15[3] = &unk_24D3DB2A8;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke_2;
  v12[3] = &unk_24D3DB388;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsDomainIds WHERE bundleIdentifier = :bundleIdentifier AND domainIdentifier = :domainIdentifier  UNION ALL SELECT sessionId FROM sessionsDomainIds WHERE bundleIdentifier = :bundleIdentifier AND domainIdentifier >= :domainIdentifier || '.' AND domainIdentifier < :domainIdentifier || '/')"), v15, 0, v12);

}

- (void)deleteSessionsWithBundleId:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke;
  v15[3] = &unk_24D3DB2A8;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke_2;
  v12[3] = &unk_24D3DB388;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsItemIds WHERE bundleIdentifier = :bundleIdentifier AND itemIdentifier = :itemIdentifier)"), v15, 0, v12);

}

- (void)deleteSessionsWithBundleId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  db = self->_db;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke;
  v10[3] = &unk_24D3DB140;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke_2;
  v8[3] = &unk_24D3DAFB8;
  v9 = v11;
  v7 = v11;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM sessions WHERE id IN (SELECT sessionId FROM sessionsItemIds WHERE bundleIdentifier = :bundleIdentifier)"), v10, 0, v8);

}

- (PMLTrainingStore)initWithPath:(id)a3 allowSkipSchema:(BOOL)a4
{
  id v7;
  PMLTrainingStore *v8;
  PMLTrainingStore *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMLTrainingStore;
  v8 = -[PMLTrainingStore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dbPath, a3);
    v9->_allowSkipSchema = a4;
    v9->_maxTimesAccessed = 1;
    -[PMLTrainingStore _registerUnlockHandler](v9, "_registerUnlockHandler");
    -[PMLTrainingStore _openDbIfUnlocked](v9, "_openDbIfUnlocked");
  }

  return v9;
}

- (PMLTrainingStore)initWithPath:(id)a3
{
  return -[PMLTrainingStore initWithPath:allowSkipSchema:](self, "initWithPath:allowSkipSchema:", a3, 1);
}

- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5 bundleId:(id)a6 domainId:(id)a7 itemIds:(id)a8 isAppleInternal:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  _PASSqliteDatabase *db;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  BOOL v33;

  v25 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(MEMORY[0x24BE7A5C8], "isDNUEnabled"))
  {
    if (v25)
    {
      if (v16)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStore.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("covariates"));

      if (v16)
      {
LABEL_4:
        if (v17)
          goto LABEL_5;
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStore.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionDescriptor"));

    if (v17)
    {
LABEL_5:
      if (v19)
      {
LABEL_6:
        db = self->_db;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __87__PMLTrainingStore_storeSession_label_model_bundleId_domainId_itemIds_isAppleInternal___block_invoke;
        v26[3] = &unk_24D3DAE58;
        v26[4] = self;
        v27 = v16;
        v32 = a4;
        v28 = v25;
        v33 = a9;
        v29 = v18;
        v30 = v17;
        v31 = v19;
        -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v26);

        goto LABEL_7;
      }
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStore.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIds"));

      goto LABEL_6;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStore.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v19)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_7:

}

- (void)loadDataForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v12 = a6;
  v16 = a3;
  v17 = a9;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v18 = MEMORY[0x24BDAC760];
  do
  {
    v19 = v39[3];
    v20 = v35[3];
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __111__PMLTrainingStore_loadDataForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
    v22[3] = &unk_24D3DAE80;
    v24 = &v38;
    v25 = &v34;
    v26 = &v30;
    v27 = v28;
    v21 = v17;
    v23 = v21;
    -[PMLTrainingStore _loadDataForModel:positiveRowId:negativeRowId:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](self, "_loadDataForModel:positiveRowId:negativeRowId:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", v16, v19, v20, a5, v12, a7, a4, a8, v22);

  }
  while (*((_BYTE *)v31 + 24));
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v11 = a6;
  v16 = a9;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __115__PMLTrainingStore_loadSessionsForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
  v18[3] = &unk_24D3DAEA8;
  v18[4] = self;
  v19 = v16;
  v17 = v16;
  -[PMLTrainingStore loadDataForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](self, "loadDataForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", a3, a5, v11, a7, v18, a4, a8);

}

- (void)loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v15 = MEMORY[0x24BDAC760];
  do
  {
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __87__PMLTrainingStore_loadDataForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
    v17[3] = &unk_24D3DAED0;
    v16 = v14;
    v18 = v16;
    v19 = &v20;
    -[PMLTrainingStore _loadBatchForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:](self, "_loadBatchForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:", v12, v13, a6, v17, a4);

  }
  while (*((_BYTE *)v21 + 24));
  _Block_object_dispose(&v20, 8);

}

- (void)loadSessionsForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __91__PMLTrainingStore_loadSessionsForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
  v14[3] = &unk_24D3DAEA8;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  -[PMLTrainingStore loadDataForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:](self, "loadDataForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:", a3, a5, a6, v14, a4);

}

- (id)sessionDimensionsForModel:(id)a3 startingRowId:(unint64_t)a4 onlyAppleInternal:(BOOL)a5 labelFilter:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  _PASSqliteDatabase *db;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[4];
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v7 = a5;
  v35[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v12 = &stru_24D3DC000;
  if (v7)
    v12 = CFSTR("AND isAppleInternal = 1 ");
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT covariatesLength, COUNT(*) FROM sessions WHERE sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND id > :rowId %@ %@ ORDER BY id"), v13, v11);
  v15 = MEMORY[0x24BDAC760];
  db = self->_db;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke;
  v23[3] = &unk_24D3DAEF8;
  v25 = a4;
  v17 = v10;
  v24 = v17;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke_2;
  v22[3] = &unk_24D3DAF20;
  v22[4] = &v30;
  v22[5] = &v26;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v14, v23, v22, 0);
  v34[0] = CFSTR("numberOfRows");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = CFSTR("numberOfColumns");
  v35[0] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31[3]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

- (void)_loadDataFromLabelAndTuples:(id)a3 model:(id)a4 numberOfRows:(unint64_t)a5 numberOfColumns:(unint64_t)a6 lastUsedMax:(double)a7 block:(id)a8
{
  id v14;
  void (**v15)(id, unint64_t, uint64_t, void *, uint64_t, char *);
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  id v26;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t *v38;
  double v39;
  SEL v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[4];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  char v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v14 = a4;
  v15 = (void (**)(id, unint64_t, uint64_t, void *, uint64_t, char *))a8;
  v62 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__998;
  v60 = __Block_byref_object_dispose__999;
  v61 = 0;
  v61 = (id)objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__998;
  v53 = __Block_byref_object_dispose__999;
  v54 = 0;
  v54 = (id)objc_opt_new();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__998;
  v47 = __Block_byref_object_dispose__999;
  v48 = 0;
  v48 = (id)objc_opt_new();
  if (a5)
  {
    v16 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v57[5], "setObject:atIndexedSubscript:", v17, v16);

      ++v16;
    }
    while (a5 != v16);
  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke;
  v33[3] = &unk_24D3DAFE0;
  v33[4] = self;
  v18 = v14;
  v39 = a7;
  v34 = v18;
  v35 = &v49;
  v40 = a2;
  v41 = a6;
  v36 = &v56;
  v37 = v55;
  v38 = &v43;
  v42 = a5;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v33);
  v19 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = (id)v57[5];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v63, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v23);
        v28 = 0;
        objc_msgSend(v24, "floatValue");
        v28 = v25;
        objc_msgSend(v19, "appendBytes:length:", &v28, 4);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v63, 16);
    }
    while (v21);
  }

  v15[2](v15, a6, v44[5], v19, v50[5], &v62);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v56, 8);

}

- (void)_loadDataForModel:(id)a3 positiveRowId:(unint64_t)a4 negativeRowId:(unint64_t)a5 excludeItemIdsUsedWithin:(double)a6 limit:(unint64_t)a7 onlyAppleInternal:(BOOL)a8 positiveLabel:(unint64_t)a9 skew:(double)a10 block:(id)a11
{
  id v19;
  id v20;
  _PASSqliteDatabase *db;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  _QWORD v36[4];
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;

  v19 = a3;
  v20 = a11;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__998;
  v39[4] = __Block_byref_object_dispose__999;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  *(double *)&v36[3] = a10;
  db = self->_db;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke;
  v24[3] = &unk_24D3DB030;
  v30 = a6;
  v31 = a9;
  v24[4] = self;
  v22 = v19;
  v35 = a8;
  v33 = a5;
  v34 = a7;
  v25 = v22;
  v32 = a4;
  v27 = v36;
  v28 = v39;
  v23 = v20;
  v26 = v23;
  v29 = v37;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v24);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

}

- (void)_loadBatchForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labels:(id)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _PASSqliteDatabase *db;
  uint64_t v22;
  id v23;
  id v24;
  SEL v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[11];
  _QWORD v29[4];
  id v30;
  PMLTrainingStore *v31;
  id v32;
  unint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[4];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[9];

  v25 = a2;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, uint64_t, uint64_t, uint64_t, _BYTE *))a7;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = v16;

  v52[0] = 0;
  v18 = (void *)objc_opt_new();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__998;
  v50 = __Block_byref_object_dispose__999;
  v51 = 0;
  v51 = (id)objc_opt_new();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__998;
  v43 = __Block_byref_object_dispose__999;
  v44 = 0;
  v44 = (id)objc_opt_new();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  if (a6)
  {
    v19 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v20, v19);

      ++v19;
    }
    while (a6 != v19);
  }
  db = self->_db;
  v22 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke;
  v29[3] = &unk_24D3DB058;
  v33 = a6;
  v34 = v17 - a4;
  v30 = v12;
  v31 = self;
  v23 = v13;
  v32 = v23;
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_2;
  v28[3] = &unk_24D3DB0A0;
  v28[4] = self;
  v28[5] = &v35;
  v28[6] = &v46;
  v28[7] = v45;
  v28[8] = &v39;
  v28[9] = v25;
  v28[10] = a6;
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_120;
  v26[3] = &unk_24D3DAFB8;
  v24 = v30;
  v27 = v24;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT sessions.id, sessions.label, sessions.covariatesLength, sessions.covariatesIndices, sessions.covariatesValues, sessionsItemIds.timesAccessed FROM sessions JOIN sessionsItemIds ON sessions.id = sessionsItemIds.sessionId AND sessions.sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND sessionsItemIds.lastUsed <= :lastUsedMax AND sessionsItemIds.timesAccessed < :timesUsedMax AND sessions.label IN _pas_nsarray(:labels) ORDER BY RANDOM() limit :limit"), v29, v28, v26);
  v14[2](v14, v36[3], v40[5], v47[5], v52);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);

}

- (void)_loadDataForModel:(id)a3 privacyBudgetRefreshPeriod:(double)a4 labelAndStartRows:(id)a5 batchSize:(unint64_t)a6 supportPerLabel:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  _PASSqliteDatabase *db;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  PMLTrainingStore *v23;
  id v24;
  id v25;
  double v26;
  unint64_t v27;
  unint64_t v28;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  db = self->_db;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke;
  v21[3] = &unk_24D3DB118;
  v26 = a4;
  v22 = v15;
  v23 = self;
  v27 = a6;
  v28 = a7;
  v24 = v14;
  v25 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v21);

}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 block:(id)a7
{
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](self, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", a3, a5, a6, 1, a7, a4, 0.0);
}

- (void)limitSessionsForEachLabelWithSessionDescriptor:(id)a3 totalSessionLimit:(unint64_t)a4
{
  id v6;
  _PASSqliteDatabase *db;
  uint64_t v8;
  id v9;
  _PASSqliteDatabase *v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  __CFString *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  __CFString *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  db = self->_db;
  v8 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke;
  v34[3] = &unk_24D3DB1B0;
  v34[4] = self;
  v35 = CFSTR("SELECT count(*) FROM sessions WHERE sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) ");
  v9 = v6;
  v36 = v9;
  v37 = &v38;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v34);
  if (v39[3] >= a4)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__998;
    v32 = __Block_byref_object_dispose__999;
    v33 = 0;
    v33 = (id)objc_opt_new();
    v10 = self->_db;
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_130;
    v24[3] = &unk_24D3DB1B0;
    v24[4] = self;
    v25 = CFSTR("SELECT DISTINCT label FROM sessions WHERE UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))");
    v11 = v9;
    v26 = v11;
    v27 = &v28;
    -[_PASSqliteDatabase readTransaction:](v10, "readTransaction:", v24);
    v12 = a4;
    if ((unint64_t)objc_msgSend((id)v29[5], "count") >= 2)
      v12 = (a4 / (objc_msgSend((id)v29[5], "count") - 1)) >> 1;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = (id)v29[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      v16 = a4 >> 1;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v18, "integerValue", (_QWORD)v20))
            v19 = v12;
          else
            v19 = v16;
          -[PMLTrainingStore limitSessionsWithSessionDescriptor:withLabel:limit:](self, "limitSessionsWithSessionDescriptor:withLabel:limit:", v11, v18, v19);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
      }
      while (v14);
    }

    _Block_object_dispose(&v28, 8);
  }

  _Block_object_dispose(&v38, 8);
}

- (void)limitSessionsByLastUsedTTL:(double)a3
{
  void *v5;
  double v6;
  double v7;
  _PASSqliteDatabase *db;
  _QWORD v9[6];

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  db = self->_db;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke;
  v9[3] = &unk_24D3DB238;
  v9[4] = self;
  *(double *)&v9[5] = v7 - a3;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);
}

- (void)limitSessionsByMaxTimesAccessed
{
  _PASSqliteDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke;
  v3[3] = &unk_24D3DB280;
  v3[4] = self;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v3);
}

- (void)limitSessionsWithSessionDescriptor:(id)a3 withLabel:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  _PASSqliteDatabase *db;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  _PASSqliteDatabase *v20;
  _QWORD v21[4];
  __CFString *v22;
  PMLTrainingStore *v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v8 = a3;
  v9 = a4;
  v10 = CFSTR("label = :label AND");
  if (!v9)
    v10 = &stru_24D3DC000;
  v11 = v10;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT count(*) FROM sessions WHERE %@ UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))"), v11);
  v13 = MEMORY[0x24BDAC760];
  db = self->_db;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke;
  v27[3] = &unk_24D3DB2F0;
  v27[4] = self;
  v15 = v12;
  v28 = v15;
  v16 = v8;
  v29 = v16;
  v17 = v9;
  v30 = v17;
  v31 = &v32;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v27);
  v18 = v33[3];
  v19 = v18 - a5;
  if (v18 >= a5)
  {
    v20 = self->_db;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_150;
    v21[3] = &unk_24D3DB360;
    v22 = v11;
    v23 = self;
    v24 = v16;
    v25 = v17;
    v26 = v19;
    -[_PASSqliteDatabase writeTransaction:](v20, "writeTransaction:", v21);

  }
  _Block_object_dispose(&v32, 8);

}

- (id)sessionStats
{
  void *v3;
  _PASSqliteDatabase *db;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32__PMLTrainingStore_sessionStats__block_invoke;
  v11[3] = &unk_24D3DB140;
  v11[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__PMLTrainingStore_sessionStats__block_invoke_2;
  v9[3] = &unk_24D3DB818;
  v5 = v3;
  v10 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT mh.name, mh.version, mh.locale, s.label, count(*) FROM sessions s INNER JOIN sessionsDescriptors mh ON s.sessionDescriptorId = mh.id INNER JOIN sessionsItemIds sii ON s.id = sii.sessionId WHERE sii.timesAccessed < :timesUsedMax GROUP BY s.sessionDescriptorId, s.label ORDER BY s.sessionDescriptorId, s.label"), v11, v9, &__block_literal_global_169);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)sessionStatsForSessionDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PMLTrainingStore sessionStats](self, "sessionStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateSessionDescriptorsUsingBlock:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__PMLTrainingStore_enumerateSessionDescriptorsUsingBlock___block_invoke_2;
  v7[3] = &unk_24D3DB410;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name, version, locale FROM sessionsDescriptors"), &__block_literal_global_172, v7, 0);

}

- (unint64_t)sessionDescriptorIdFor:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke;
  v9[3] = &unk_24D3DB438;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_registerUnlockHandler
{
  void *v3;
  void *v4;
  id lockStateNotificationToken;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_lockStateNotificationToken)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTrainingStore.m"), 1005, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_lockStateNotificationToken"));

  }
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BE7A5D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__PMLTrainingStore__registerUnlockHandler__block_invoke;
  v8[3] = &unk_24D3DB460;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "registerForLockStateChangeNotifications:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lockStateNotificationToken = self->_lockStateNotificationToken;
  self->_lockStateNotificationToken = v4;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_unregisterUnlockHandler
{
  id lockStateNotificationToken;

  if (self->_lockStateNotificationToken)
  {
    objc_msgSend(MEMORY[0x24BE7A5D0], "unregisterForLockStateChangeNotifications:");
    lockStateNotificationToken = self->_lockStateNotificationToken;
    self->_lockStateNotificationToken = 0;

  }
}

- (int64_t)_openDbIfUnlocked
{
  int64_t v3;

  pthread_mutex_lock(&_openDbIfUnlocked_openDbMutex);
  v3 = -[PMLTrainingStore _unsafeOpenDbIfUnlocked](self, "_unsafeOpenDbIfUnlocked");
  pthread_mutex_unlock(&_openDbIfUnlocked_openDbMutex);
  return v3;
}

- (int64_t)_unsafeOpenDbIfUnlocked
{
  int64_t v2;
  char i;
  NSObject *v5;
  uint64_t v6;
  _PASSqliteDatabase *v7;
  NSObject *v8;
  NSString *dbPath;
  NSString *v10;
  NSObject *v11;
  _PASSqliteDatabase *db;
  uint8_t buf[4];
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_db)
    return 0;
  if (!objc_msgSend(MEMORY[0x24BE7A5D0], "isUnlocked"))
    return 1;
  -[PMLTrainingStore _truncateDbIfCorrupted](self, "_truncateDbIfCorrupted");
  for (i = 1; ; i = 0)
  {
    PML_LogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      dbPath = self->_dbPath;
      *(_DWORD *)buf = 138412290;
      v15 = dbPath;
      _os_log_debug_impl(&dword_2159BB000, v5, OS_LOG_TYPE_DEBUG, "Opening db %@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE7A640], "initializeDatabase:withContentProtection:newDatabaseCreated:errorHandler:", self->_dbPath, 2, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      break;
    v7 = (_PASSqliteDatabase *)v6;
    v2 = +[PMLTrainingStore _migrate:forStore:](PMLTrainingStore, "_migrate:forStore:", v6, self);
    if (!v2)
    {
      db = self->_db;
      self->_db = v7;

      -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA foreign_keys = ON"), 0, 0, &__block_literal_global_191);
      -[PMLTrainingStore _unregisterUnlockHandler](self, "_unregisterUnlockHandler");
      return v2;
    }
    PML_LogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = self->_dbPath;
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_debug_impl(&dword_2159BB000, v8, OS_LOG_TYPE_DEBUG, "Closing db %@.", buf, 0xCu);
    }

    -[_PASSqliteDatabase closePermanently](v7, "closePermanently");
    if (v2 == 2)
    {
      -[PMLTrainingStore _unregisterUnlockHandler](self, "_unregisterUnlockHandler");
      goto LABEL_21;
    }
    if ((i & 1) == 0 || !-[PMLTrainingStore _truncateDbIfCorrupted](self, "_truncateDbIfCorrupted"))
      goto LABEL_21;

  }
  PML_LogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2159BB000, v11, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to open/initialize db.", buf, 2u);
  }

  v7 = 0;
  v2 = 3;
LABEL_21:

  return v2;
}

- (BOOL)_truncateDbIfCorrupted
{
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSString *dbPath;
  void *v8;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BE7A640], "isInMemoryPath:", self->_dbPath) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7A640], "corruptionMarkerPathForPath:", self->_dbPath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v3)
    {
      PML_LogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        dbPath = self->_dbPath;
        v10 = 138412290;
        v11 = dbPath;
        _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEFAULT, "PMLTraining db (%@) corrupted. Flushing.", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE7A640], "truncateDatabaseAtPath:", self->_dbPath);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeItemAtPath:error:", v4, 0);

    }
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PMLTrainingStore *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_2159BB000, v3, OS_LOG_TYPE_DEBUG, "%@ deallocating", buf, 0xCu);
  }

  -[PMLTrainingStore _unregisterUnlockHandler](self, "_unregisterUnlockHandler");
  -[_PASSqliteDatabase closePermanently](self->_db, "closePermanently");
  v4.receiver = self;
  v4.super_class = (Class)PMLTrainingStore;
  -[PMLTrainingStore dealloc](&v4, sel_dealloc);
}

- (void)vacuumDbWithDeferralBlock:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PMLTrainingStore_vacuumDbWithDeferralBlock___block_invoke;
  v7[3] = &unk_24D3DB4A8;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase vacuumWithShouldContinueBlock:error:](db, "vacuumWithShouldContinueBlock:error:", v7, 0);

}

- (int64_t)migrateTo:(id)a3
{
  return +[PMLTrainingStore migrate:to:forStore:](PMLTrainingStore, "migrate:to:forStore:", self->_db, a3);
}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__998;
  v25 = __Block_byref_object_dispose__999;
  v26 = 0;
  db = self->_db;
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke;
  v18[3] = &unk_24D3DB2A8;
  v19 = v6;
  v20 = v7;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_2;
  v14[3] = &unk_24D3DB520;
  v10 = v19;
  v15 = v10;
  v11 = v20;
  v16 = v11;
  v17 = &v21;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT sd.version, lf.transformer FROM sessionsDescriptors sd CROSS JOIN lastFeaturizations lf ON lf.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale"), v18, v14, &__block_literal_global_202);
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke;
  v11[3] = &unk_24D3DB5A8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v11);

}

- (void)convertToBagOfIdsVectorForModel:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x2199EA600]();
  db = self->_db;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke;
  v8[3] = &unk_24D3DB610;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v8);

  objc_autoreleasePoolPop(v5);
}

- (BOOL)isDbOpen
{
  return -[_PASSqliteDatabase userVersion](self->_db, "userVersion") != 0;
}

- (id)getSchema:(unint64_t *)a3
{
  id v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (getSchema___pasOnceToken417 != -1)
    dispatch_once(&getSchema___pasOnceToken417, &__block_literal_global_222);
  v5 = (id)getSchema___pasExprOnceResult;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__998;
  v19 = __Block_byref_object_dispose__999;
  v20 = 0;
  v20 = (id)objc_opt_new();
  db = self->_db;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__PMLTrainingStore_getSchema___block_invoke_2;
  v12[3] = &unk_24D3DB658;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __30__PMLTrainingStore_getSchema___block_invoke_3;
  v11[3] = &unk_24D3DB680;
  v11[4] = &v15;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' "), 0, v12, v11);
  if (a3)
    *a3 = -[_PASSqliteDatabase userVersion](self->_db, "userVersion");
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setMaxTimesAccessed:(unint64_t)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_2159BB000, v3, OS_LOG_TYPE_FAULT, "setMaxTimesAccessed should only be called for testing.", v4, 2u);
  }

}

- (void)logDbNotOpenEvent
{
  NSObject *v3;
  _PASSqliteDatabase *db;
  int v5;
  _PASSqliteDatabase *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    db = self->_db;
    v5 = 138412802;
    v6 = db;
    v7 = 1024;
    v8 = objc_msgSend(MEMORY[0x24BE7A5D0], "isUnlocked");
    v9 = 1024;
    v10 = objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked");
    _os_log_impl(&dword_2159BB000, v3, OS_LOG_TYPE_DEFAULT, "db: %@, isUnlocked: %d, isClassCLocked: %d", (uint8_t *)&v5, 0x18u);
  }

}

- (id)dbForTesting
{
  return self->_db;
}

- (BOOL)createSnapshot:(id)a3
{
  return -[_PASSqliteDatabase createSnapshot:](self->_db, "createSnapshot:", a3);
}

- (void)storeSession:(id)a3 label:(int64_t)a4 model:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), arc4random_uniform(0x2710u));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = 1;
  -[PMLTrainingStore storeSession:label:model:bundleId:domainId:itemIds:isAppleInternal:](self, "storeSession:label:model:bundleId:domainId:itemIds:isAppleInternal:", v10, a4, v9, CFSTR("test"), CFSTR("foo"), v12, v13);

}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 withSkew:(double)a5 andLimit:(int)a6 block:(id)a7
{
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](self, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", a3, a6, 0, 1, a7, a4, a5);
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASSqliteDatabase *db;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x2199EA600]();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(CFSTR("SELECT count(*) FROM "), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__PMLTrainingStore_numberOfRowsInTable___block_invoke;
  v10[3] = &unk_24D3DB168;
  v10[4] = &v11;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v6, 0, v10, 0);
  v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (void)closeDbForTesting
{
  _PASSqliteDatabase *db;

  -[_PASSqliteDatabase closePermanently](self->_db, "closePermanently");
  db = self->_db;
  self->_db = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lockStateNotificationToken, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_dbPath, 0);
}

uint64_t __40__PMLTrainingStore_numberOfRowsInTable___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __30__PMLTrainingStore_getSchema___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 *v6;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("CREATE TABLE integrityCheck")) & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR(" "));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
  }
  v6 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];

  return *v6;
}

uint64_t __30__PMLTrainingStore_getSchema___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Error querying schema: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  return *MEMORY[0x24BE7A6B0];
}

void __30__PMLTrainingStore_getSchema___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[ ]{2,}"), 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getSchema___pasExprOnceResult;
  getSchema___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_2;
  v6[3] = &unk_24D3DB140;
  v7 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_3;
  v5[3] = &unk_24D3DB818;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT s.id, s.sessionDescriptorId, s.covariatesIndices, s.covariatesValues FROM sessions s CROSS JOIN sessionsDescriptors sd ON s.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale"), v6, v5, &__block_literal_global_219);

}

void __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v6);

}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "getIntegerForColumn:", 0);
  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v3, "getNSDataForColumn:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  v15 = objc_retainAutorelease(v9);
  v16 = objc_msgSend(v15, "mutableBytes");
  v17 = objc_retainAutorelease(v14);
  v18 = objc_msgSend(v17, "mutableBytes");
  v19 = objc_msgSend(v15, "length");
  if (v19 >= 4)
  {
    v20 = 0;
    do
    {
      *(float *)(v18 + 4 * v20) = (float)*(int *)(v16 + 4 * v20);
      *(_DWORD *)(v16 + 4 * v20) = v20;
      ++v20;
    }
    while (v19 >> 2 != v20);
  }
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v27[0] = CFSTR("covariatesIndices");
  v22 = (void *)objc_msgSend(v15, "copy");
  v27[1] = CFSTR("covariatesValues");
  v28[0] = v22;
  v23 = (void *)objc_msgSend(v17, "copy");
  v28[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("id = %ld"), v4);
  objc_msgSend(v21, "updateTable:dictionary:whereClause:onError:", CFSTR("sessions"), v24, v25, &__block_literal_global_218);

  return *MEMORY[0x24BE7A6A8];
}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_5()
{
  return *MEMORY[0x24BE7A6A8];
}

uint64_t __52__PMLTrainingStore_convertToBagOfIdsVectorForModel___block_invoke_4()
{
  return *MEMORY[0x24BE7A6A8];
}

void __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v13[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_2;
  v13[3] = &unk_24D3DB140;
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = v2;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_3;
  v12[3] = &unk_24D3DB168;
  v12[4] = &v15;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT sd.id FROM sessionsDescriptors sd CROSS JOIN lastFeaturizations lf ON lf.sessionDescriptorId = sd.id WHERE sd.name = :name AND sd.locale = :locale"), v13, v12, &__block_literal_global_205);
  v5 = objc_msgSend(*(id *)(a1 + 32), "sessionDescriptorIdFor:", *(_QWORD *)(a1 + 40));
  v19[0] = CFSTR("sessionDescriptorId");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("transformer");
  v20[0] = v6;
  v20[1] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  if (v16[3])
  {
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    v11 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("sessionDescriptorId = %lu"), v16[3]);
    objc_msgSend(v9, "updateTable:dictionary:whereClause:onError:", CFSTR("lastFeaturizations"), v7, v11, &__block_literal_global_213);

  }
  else
  {
    objc_msgSend(*(id *)(v8 + 16), "insertIntoTable:dictionary:", CFSTR("lastFeaturizations"), v7);
  }

  _Block_object_dispose(&v15, 8);
}

void __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v6);

}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_212()
{
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __68__PMLTrainingStore_updateLastTrainingFeaturizationForModel_andData___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "Failed to load last training featurization in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", *(_QWORD *)(a1 + 40));

}

uint64_t __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getNSStringForColumn:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", a1[4], v5, a1[5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getNSDataForColumn:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *MEMORY[0x24BE7A6B0];
    }
    else
    {
      PML_LogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = 0;
        _os_log_error_impl(&dword_2159BB000, v13, OS_LOG_TYPE_ERROR, "Row in sessionStats contained unexpected null value, version %@, continuing to iterate as best effort", (uint8_t *)&v15, 0xCu);
      }

      v11 = *MEMORY[0x24BE7A6A8];
    }

  }
  else
  {
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_2159BB000, v12, OS_LOG_TYPE_ERROR, "Row returned in lastTrainingFeaturizationForModelName was null, continuing to iterate as best effort", (uint8_t *)&v15, 2u);
    }

    v11 = *MEMORY[0x24BE7A6A8];
  }

  return v11;
}

uint64_t __68__PMLTrainingStore_lastTrainingFeaturizationForModelName_andLocale___block_invoke_201(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "Failed to load last training featurization in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __46__PMLTrainingStore_vacuumDbWithDeferralBlock___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __43__PMLTrainingStore__unsafeOpenDbIfUnlocked__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  PML_LogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_2159BB000, v0, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to enable foreign keys support.", v2, 2u);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __42__PMLTrainingStore__registerUnlockHandler__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_debug_impl(&dword_2159BB000, v4, OS_LOG_TYPE_DEBUG, "PMLTrainingStore notified of device lock state change to %d", (uint8_t *)v6, 8u);
  }

  if (a2 == 3 || !a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_openDbIfUnlocked");

  }
}

void __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v12[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_2;
  v12[3] = &unk_24D3DB140;
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = v2;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_3;
  v11[3] = &unk_24D3DB168;
  v11[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale"), v12, v11, 0);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v14[0] = CFSTR("name");
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v14[1] = CFSTR("version");
    objc_msgSend(*(id *)(a1 + 40), "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    v14[2] = CFSTR("locale");
    objc_msgSend(*(id *)(a1 + 40), "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertIntoTable:dictionary:", CFSTR("sessionsDescriptors"), v10);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastInsertRowId");
  }

}

void __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":version", v6);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v7);

}

uint64_t __43__PMLTrainingStore_sessionDescriptorIdFor___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __58__PMLTrainingStore_enumerateSessionDescriptorsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getNSStringForColumn:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getNSStringForColumn:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getNSStringForColumn:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", v5, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = 0;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v10 = *MEMORY[0x24BE7A6A8];

    }
    else
    {
      PML_LogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412802;
        v15 = v5;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_2159BB000, v12, OS_LOG_TYPE_ERROR, "Row in enumerateSessionDescriptorsUsingBlock contained unexpected null value, name %@, version %@, locale %@, continuing to iterate as best effort", (uint8_t *)&v14, 0x20u);
      }

      v10 = *MEMORY[0x24BE7A6A8];
    }

  }
  else
  {
    PML_LogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_2159BB000, v11, OS_LOG_TYPE_ERROR, "Row returned in enumerateSessionDescriptorsUsingBlock was null, continuing to iterate as best effort", (uint8_t *)&v14, 2u);
    }

    v10 = *MEMORY[0x24BE7A6A8];
  }

  return v10;
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInteger:", ":timesUsedMax", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getNSStringForColumn:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getNSStringForColumn:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getNSStringForColumn:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", v5, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v11 = *(void **)(a1 + 32);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
      }
      v12 = objc_msgSend(v4, "getIntegerForColumn:", 3);
      v13 = objc_msgSend(v4, "getIntegerForColumn:", 4);
      v14 = (void *)MEMORY[0x24BE7A648];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tupleWithFirst:second:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      v18 = *MEMORY[0x24BE7A6A8];
    }
    else
    {
      PML_LogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = 138412802;
        v23 = v5;
        v24 = 2112;
        v25 = v6;
        v26 = 2112;
        v27 = v8;
        _os_log_error_impl(&dword_2159BB000, v20, OS_LOG_TYPE_ERROR, "Row in sessionStats contained unexpected null value, name %@, version %@, locale %@, continuing to iterate as best effort", (uint8_t *)&v22, 0x20u);
      }

      v18 = *MEMORY[0x24BE7A6A8];
    }

  }
  else
  {
    PML_LogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_2159BB000, v19, OS_LOG_TYPE_ERROR, "Row returned in sessionStats was null, continuing to iterate as best effort", (uint8_t *)&v22, 2u);
    }

    v18 = *MEMORY[0x24BE7A6A8];
  }

  return v18;
}

uint64_t __32__PMLTrainingStore_sessionStats__block_invoke_168(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "Failed to load stats about sessions in db. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __56__PMLTrainingStore_deleteSessionsWithBundleId_domainId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for bundleId=%@ and domainId=%@. Error: %@", (uint8_t *)&v8, 0x20u);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __54__PMLTrainingStore_deleteSessionsWithBundleId_itemId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for for bundleId=%@ and itemId=%@. Error: %@", (uint8_t *)&v8, 0x20u);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __47__PMLTrainingStore_deleteSessionsWithBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions for bundleId=%@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2;
  v6[3] = &unk_24D3DB2A8;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3;
  v5[3] = &unk_24D3DB168;
  v5[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v2, v6, v5, &__block_literal_global_149);

}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_150(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("DELETE FROM sessions WHERE id IN(  SELECT id FROM sessions   WHERE %@   UNLIKELY(sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale))   ORDER BY RANDOM() LIMIT :limit)"), *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2_153;
  v7[3] = &unk_24D3DB318;
  v8 = v2;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v6, v7, 0, &__block_literal_global_155);

}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2_153(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":name", v3);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":version", v4);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":locale", v5);

  v6 = *(void **)(a1 + 40);
  if (v6)
    objc_msgSend(v7, "bindNamedParam:toInteger:", ":label", objc_msgSend(v6, "integerValue"));
  objc_msgSend(v7, "bindNamedParam:toInteger:", ":limit", *(_QWORD *)(a1 + 48));

}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3_154(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":name", v3);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":version", v4);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":locale", v5);

  v6 = *(void **)(a1 + 40);
  if (v6)
    objc_msgSend(v7, "bindNamedParam:toInteger:", ":label", objc_msgSend(v6, "integerValue"));

}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __71__PMLTrainingStore_limitSessionsWithSessionDescriptor_withLabel_limit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count labeled sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_2;
  v4[3] = &unk_24D3DB140;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM sessions WHERE (id in (SELECT sessionId from sessionsItemIds WHERE timesAccessed >= :maxTimesAccessed))"), v4, 0, &__block_literal_global_143);
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInteger:", ":maxTimesAccessed", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __51__PMLTrainingStore_limitSessionsByMaxTimesAccessed__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete over used sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_2;
  v3[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM sessions WHERE creationTimestamp < :lastUsedExpirationDate AND (id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < :lastUsedExpirationDate))"), v3, 0, &__block_literal_global_139);
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":lastUsedExpirationDate", *(double *)(a1 + 32));
}

uint64_t __47__PMLTrainingStore_limitSessionsByLastUsedTTL___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to delete unused sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2;
  v6[3] = &unk_24D3DB140;
  v7 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3;
  v5[3] = &unk_24D3DB168;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v2, v6, v5, &__block_literal_global_126);

}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_130(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2_131;
  v6[3] = &unk_24D3DB140;
  v7 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3_132;
  v5[3] = &unk_24D3DB168;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v2, v6, v5, &__block_literal_global_134);

}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2_131(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":version", v6);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v7);

}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3_132(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumn:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x24BE7A6A8];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_4_133(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count labeled sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":version", v6);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v7);

}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __85__PMLTrainingStore_limitSessionsForEachLabelWithSessionDescriptor_totalSessionLimit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PML_LogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_2159BB000, v3, OS_LOG_TYPE_ERROR, "PMLTrainingStore failed to count total sessions. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x24BE7A6B0];
}

void __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v5 = v4 - *(double *)(a1 + 64);
  v6 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = *(_QWORD *)(a1 + 72);
  v7 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_2;
  v20[3] = &unk_24D3DB0C8;
  v25 = v5;
  v8 = *(void **)(a1 + 32);
  v20[4] = *(_QWORD *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v23 = &v31;
  v24 = &v27;
  v26 = *(_QWORD *)(a1 + 80);
  v9 = v6;
  v22 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (v28[3] || !objc_msgSend(v9, "count"))
  {
    v17 = 1;
    v10 = *(_QWORD *)(a1 + 56);
    v11 = v32[3];
    v12 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *, _QWORD, char *))(v10 + 16))(v10, v11, MEMORY[0x24BDBD1A8], v12, MEMORY[0x24BDBD1B8], &v17);

  }
  else
  {
    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 72);
    v16 = v32[3];
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_3;
    v18[3] = &unk_24D3DB0F0;
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v13, "_loadDataFromLabelAndTuples:model:numberOfRows:numberOfColumns:lastUsedMax:block:", v9, v14, v15, v16, v18, v5);

  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

}

void __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("AND label = %lu AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) "), objc_msgSend(v19, "unsignedIntegerValue"), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "sessionDimensionsForModel:startingRowId:onlyAppleInternal:labelFilter:", *(_QWORD *)(a1 + 40), objc_msgSend(v7, "unsignedIntegerValue"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("numberOfColumns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("numberOfRows"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  v13 = *(_QWORD *)(a1 + 80);
  if (v12)
    v14 = v12 >= v13;
  else
    v14 = 0;
  if (v14)
  {
    if (!v13)
      v13 = v12;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(_QWORD *)(v15 + 24);
    if (v13 >= v16)
      v17 = *(_QWORD *)(v15 + 24);
    else
      v17 = v13;
    *(_QWORD *)(v15 + 24) = v16 - v17;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      *a4 = 1;
    +[PMLLabelLimitRowId labelLimitRowIdWithLabel:limit:rowId:](PMLLabelLimitRowId, "labelLimitRowIdWithLabel:limit:rowId:", v8, v17, objc_msgSend(v7, "unsignedIntegerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, v19);

  }
}

uint64_t __115__PMLTrainingStore__loadDataForModel_privacyBudgetRefreshPeriod_labelAndStartRows_batchSize_supportPerLabel_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":name", v4);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":version", v5);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":locale", v6);

  objc_msgSend(v7, "bindNamedParam:toInteger:", ":limit", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":lastUsedMax", *(double *)(a1 + 64));
  objc_msgSend(v7, "bindNamedParam:toInteger:", ":timesUsedMax", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v7, "bindNamedParam:toNSArray:", ":labels", *(_QWORD *)(a1 + 48));

}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  unsigned __int8 *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "getIntegerForColumn:", 0);
  v5 = objc_msgSend(v3, "getIntegerForColumn:", 5);
  v6 = *(void **)(a1[4] + 16);
  v42[0] = CFSTR("lastUsed");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  objc_msgSend(v7, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = CFSTR("timesAccessed");
  v43[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("sessionId = %ld"), v4);
  objc_msgSend(v6, "updateTable:dictionary:whereClause:onError:", CFSTR("sessionsItemIds"), v13, v14, &__block_literal_global_119);

  v15 = objc_msgSend(v3, "getIntegerForColumn:", 1);
  v16 = objc_msgSend(v3, "getIntegerForColumn:", 2);
  objc_msgSend(v3, "getNSDataForColumn:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSDataForColumn:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "length");
  v20 = v19 >> 2;
  if (v19 >> 2 != (unint64_t)objc_msgSend(v18, "length") >> 2)
  {
    PML_LogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v37 = v4;
      v38 = 2048;
      v39 = objc_msgSend(v17, "length");
      v40 = 2048;
      v41 = objc_msgSend(v18, "length");
      _os_log_error_impl(&dword_2159BB000, v29, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu)."), v4, objc_msgSend(v17, "length"), objc_msgSend(v18, "length"));
    goto LABEL_15;
  }
  v21 = *(_QWORD *)(a1[5] + 8);
  v22 = *(_QWORD *)(v21 + 24);
  if (!v22)
  {
    *(_QWORD *)(v21 + 24) = v16;
    v22 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  if (v16 != v22)
  {
    PML_LogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v34 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 134218496;
      v37 = v4;
      v38 = 2048;
      v39 = v34;
      v40 = 2048;
      v41 = v16;
      _os_log_error_impl(&dword_2159BB000, v30, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu."), v4, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), v16);
LABEL_15:
    v28 = (unsigned __int8 *)MEMORY[0x24BE7A6B0];
    goto LABEL_16;
  }
  if (v19 >= 4)
  {
    v33 = 0;
    if (v20 <= 1)
      v20 = 1;
    do
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v17, "getBytes:range:", buf, v33, 4);
      if ((*(_DWORD *)buf & 0x80000000) != 0 || v16 <= *(int *)buf)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[4], CFSTR("PMLTrainingStore.m"), 623, CFSTR("Invalid session from db (row id %lu): idx %d out of bounds [0, %lu)."), v4, *(unsigned int *)buf, v16);

      }
      v33 += 4;
      --v20;
    }
    while (v20);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;

  *(_DWORD *)buf = v25;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "appendBytes:length:", buf, 4);
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v26 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v17, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v27);

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == a1[10])
    v28 = (unsigned __int8 *)MEMORY[0x24BE7A6B0];
  else
    v28 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
LABEL_16:
  v31 = *v28;

  return v31;
}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Failed to load sessions for model %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __89__PMLTrainingStore__loadBatchForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke_3()
{
  return *MEMORY[0x24BE7A6A8];
}

void __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  int64_t v22;
  uint64_t v23;
  PMLTrainingStoredSessionBatch *v25;
  void *v26;
  PMLMutableDenseVector *v27;
  void *v28;
  PMLMutableDenseVector *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v5 = v4 - *(double *)(a1 + 80);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("AND sessions.label = %lu AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) "), *(_QWORD *)(a1 + 88), *(_QWORD *)&v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("AND sessions.label = 0 AND sessions.id in (SELECT sessionId from sessionsItemIds WHERE lastUsed < %f AND timesAccessed < %lu) "), *(_QWORD *)&v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v44 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 32), "sessionDimensionsForModel:startingRowId:onlyAppleInternal:labelFilter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96), *(unsigned __int8 *)(a1 + 120), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionDimensionsForModel:startingRowId:onlyAppleInternal:labelFilter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104), *(unsigned __int8 *)(a1 + 120), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfColumns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("numberOfColumns"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longValue");

  if (v11 <= v13)
    v14 = v13;
  else
    v14 = v11;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfRows"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("numberOfRows"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "longValue");

  v19 = *(_QWORD *)(a1 + 112);
  if (v19 && v16 >= 3 && v18 + v16 >= v19 && v18 >= 3)
  {
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(double *)(v20 + 24);
    if (v21 == 0.0)
      v21 = (float)((float)v16 / (float)((float)v16 + (float)v18));
    *(double *)(v20 + 24) = v21;
    v22 = llround(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) * (double)v19);
    v23 = v19 - v22;
    if (v16 >= v22 && v18 >= v23)
      goto LABEL_21;
    if (v16 >= v22)
    {
      if (v18 + 1 >= v23)
      {
        v22 = v19 - v18;
        v23 = v18;
        goto LABEL_21;
      }
    }
    else if (v16 + 1 >= v22)
    {
      v23 = v19 - v16;
      v22 = v16;
LABEL_21:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = &unk_24D3EAA18;
      +[PMLLabelLimitRowId labelLimitRowIdWithLabel:limit:rowId:](PMLLabelLimitRowId, "labelLimitRowIdWithLabel:limit:rowId:", v7, v23, *(_QWORD *)(a1 + 104));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v36;
      v50[0] = v37;
      +[PMLLabelLimitRowId labelLimitRowIdWithLabel:limit:rowId:](PMLLabelLimitRowId, "labelLimitRowIdWithLabel:limit:rowId:", v44, v22, *(_QWORD *)(a1 + 96));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = *(void **)(a1 + 32);
      v41 = *(_QWORD *)(a1 + 40);
      v42 = *(_QWORD *)(a1 + 112);
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke_2;
      v45[3] = &unk_24D3DB008;
      v46 = v36;
      v47 = &unk_24D3EAA18;
      v48 = *(id *)(a1 + 48);
      v43 = v36;
      objc_msgSend(v40, "_loadDataFromLabelAndTuples:model:numberOfRows:numberOfColumns:lastUsedMax:block:", v39, v41, v42, v14, v45, v5);

      goto LABEL_22;
    }
  }
  v25 = [PMLTrainingStoredSessionBatch alloc];
  +[PMLSparseMatrix sparseMatrixWithNumberOfRows:numberOfColumns:](PMLSparseMatrix, "sparseMatrixWithNumberOfRows:numberOfColumns:", 0, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [PMLMutableDenseVector alloc];
  v28 = (void *)objc_opt_new();
  v29 = -[PMLDenseVector initWithData:](v27, "initWithData:", v28);
  +[PMLModelRegressor modelRegressorFromFloats:](PMLModelRegressor, "modelRegressorFromFloats:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PMLTrainingStoredSessionBatch initWithCovariates:outcomes:](v25, "initWithCovariates:outcomes:", v26, v30);
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v31;

  v34 = *(_QWORD *)(a1 + 48);
  v35 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, uint64_t, _QWORD, void *, _QWORD, _QWORD, uint64_t))(v34 + 16))(v34, v14, MEMORY[0x24BDBD1A8], v35, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

LABEL_22:
}

void __140__PMLTrainingStore__loadDataForModel_positiveRowId_negativeRowId_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a1[4];
  v9 = a5;
  v10 = a4;
  v13 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "unsignedIntegerValue");
  (*(void (**)(void))(a1[6] + 16))();

}

void __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "label");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT sessions.id, sessions.label, sessions.covariatesLength, sessions.covariatesIndices, sessions.covariatesValues, sessionsItemIds.timesAccessed FROM sessions JOIN sessionsItemIds ON sessions.id = sessionsItemIds.sessionId AND sessions.sessionDescriptorId = (SELECT id FROM sessionsDescriptors WHERE name = :name AND version = :version AND locale = :locale) AND sessionsItemIds.lastUsed <= :lastUsedMax AND sessionsItemIds.timesAccessed < :timesUsedMax AND sessions.id > :rowId %@ ORDER BY sessions.id limit :limit"), v16);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_2;
  v26[3] = &unk_24D3DAF48;
  v27 = v6;
  v10 = *(id *)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 64);
  v22 = *(_OWORD *)(a1 + 48);
  v19[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_3;
  v19[3] = &unk_24D3DAF90;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v28 = v10;
  v29 = v12;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[4] = v12;
  v20 = v5;
  v24 = *(_QWORD *)(a1 + 88);
  v21 = v27;
  v23 = v11;
  v25 = *(_OWORD *)(a1 + 96);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_106;
  v17[3] = &unk_24D3DAFB8;
  v18 = v13;
  v14 = v27;
  v15 = v5;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v26, v19, v17);

}

void __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "bindNamedParam:toInteger:", ":rowId", objc_msgSend(v3, "rowId"));
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":name", v4);

  objc_msgSend(*(id *)(a1 + 40), "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":version", v5);

  objc_msgSend(*(id *)(a1 + 40), "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNSString:", ":locale", v6);

  objc_msgSend(v7, "bindNamedParam:toInteger:", ":limit", objc_msgSend(*(id *)(a1 + 32), "limit"));
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":lastUsedMax", *(double *)(a1 + 56));
  objc_msgSend(v7, "bindNamedParam:toInteger:", ":timesUsedMax", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));

}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "getIntegerForColumn:", 0);
  v5 = objc_msgSend(v3, "getIntegerForColumn:", 5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v43[0] = CFSTR("lastUsed");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  objc_msgSend(v7, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = CFSTR("timesAccessed");
  v44[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("sessionId = %ld"), v4);
  objc_msgSend(v6, "updateTable:dictionary:whereClause:onError:", CFSTR("sessionsItemIds"), v13, v14, &__block_literal_global);

  v15 = objc_msgSend(v3, "getIntegerForColumn:", 1);
  if (objc_msgSend(*(id *)(a1 + 40), "integerValue") != v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 88);
    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v32, v33, CFSTR("PMLTrainingStore.m"), 396, CFSTR("Read label %lu while specified %@. Matcher: %@"), v15, v34, v35);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 40));

  v17 = objc_msgSend(v3, "getIntegerForColumn:", 2);
  objc_msgSend(v3, "getNSDataForColumn:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSDataForColumn:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "length");
  v21 = v20 >> 2;
  if (v20 >> 2 != (unint64_t)objc_msgSend(v19, "length") >> 2)
  {
    PML_LogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v38 = v4;
      v39 = 2048;
      v40 = objc_msgSend(v18, "length");
      v41 = 2048;
      v42 = objc_msgSend(v19, "length");
      _os_log_error_impl(&dword_2159BB000, v25, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu).", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid session from db (row id %lu): covariatesIndices and covariatesValues must contain the same number of elements (expected bytes length in int/float ratio but got %lu and %lu)."), v4, objc_msgSend(v18, "length"), objc_msgSend(v19, "length"));
    goto LABEL_15;
  }
  if (v17 != *(_QWORD *)(a1 + 96))
  {
    PML_LogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 134218496;
      v38 = v4;
      v39 = 2048;
      v40 = v30;
      v41 = 2048;
      v42 = v17;
      _os_log_error_impl(&dword_2159BB000, v26, OS_LOG_TYPE_ERROR, "Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu.", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid session from db (row id %lu), covariatesLength has to be %lu, got %lu."), v4, *(_QWORD *)(a1 + 96), v17);
LABEL_15:
    v24 = (unsigned __int8 *)MEMORY[0x24BE7A6B0];
    goto LABEL_16;
  }
  if (v20 >= 4)
  {
    v28 = 0;
    if (v21 <= 1)
      v29 = 1;
    else
      v29 = v21;
    do
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v18, "getBytes:range:", buf, v28, 4);
      if ((*(_DWORD *)buf & 0x80000000) != 0 || v17 <= *(int *)buf)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("PMLTrainingStore.m"), 419, CFSTR("Invalid session from db (row id %lu): idx %d out of bounds [0, %lu)."), v4, *(unsigned int *)buf, v17);

      }
      v28 += 4;
      --v29;
    }
    while (v29);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 40), (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))++);
  v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == *(_QWORD *)(a1 + 104))
    v24 = (unsigned __int8 *)MEMORY[0x24BE7A6B0];
  else
    v24 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
LABEL_16:

  return *v24;
}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Failed to load sessions for model %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x24BE7A6B0];
}

uint64_t __101__PMLTrainingStore__loadDataFromLabelAndTuples_model_numberOfRows_numberOfColumns_lastUsedMax_block___block_invoke_4()
{
  return *MEMORY[0x24BE7A6A8];
}

void __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":rowId", v3);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v5);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":version", v6);

  objc_msgSend(*(id *)(a1 + 32), "locale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":locale", v7);

}

uint64_t __90__PMLTrainingStore_sessionDimensionsForModel_startingRowId_onlyAppleInternal_labelFilter___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  v5 = objc_msgSend(v4, "getIntegerForColumn:", 0);
  if (v3 <= v5)
    v6 = v5;
  else
    v6 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  v7 = objc_msgSend(v4, "getIntegerForColumn:", 1);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return *MEMORY[0x24BE7A6A8];
}

void __91__PMLTrainingStore_loadSessionsForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_sessionDataToBatchWithNumberOfColumns:rowsData:labelsData:", a2, v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __87__PMLTrainingStore_loadDataForModel_privacyBudgetRefreshPeriod_labels_batchSize_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, id, uint64_t, _BYTE *);
  id v11;
  uint64_t v12;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void (**)(uint64_t, uint64_t, id, uint64_t, _BYTE *))(v9 + 16);
  v11 = a3;
  v10(v9, a2, v11, a4, a5);
  v12 = objc_msgSend(v11, "count");

  if (!v12 || *a5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __115__PMLTrainingStore_loadSessionsForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_sessionDataToBatchWithNumberOfColumns:rowsData:labelsData:", a2, v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __111__PMLTrainingStore_loadDataForModel_excludeItemIdsUsedWithin_limit_onlyAppleInternal_positiveLabel_skew_block___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4, unint64_t a5, unint64_t a6, _BYTE *a7)
{
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;

  v17 = a3;
  v12 = a4;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > a5 && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) > a6
    || !objc_msgSend(v17, "count") && *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    *a7 = 1;
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    goto LABEL_12;
  }
  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(_QWORD *)(v13 + 24);
  if (v14 <= a5)
    v14 = a5;
  *(_QWORD *)(v13 + 24) = v14;
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(_QWORD *)(v15 + 24);
  if (v16 <= a6)
    v16 = a6;
  *(_QWORD *)(v15 + 24) = v16;
  (*(void (**)(void))(a1[4] + 16))();
  if (*a7)
    goto LABEL_11;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;

}

void __87__PMLTrainingStore_storeSession_label_model_bundleId_domainId_itemIds_isAppleInternal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id obja;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _BYTE v40[128];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[7];
  _QWORD v44[9];

  v44[7] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionDescriptorIdFor:", *(_QWORD *)(a1 + 40));
  obja = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v43[0] = CFSTR("creationTimestamp");
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(v3, "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v7;
  v43[1] = CFSTR("sessionDescriptorId");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v8;
  v43[2] = CFSTR("label");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v9;
  v43[3] = CFSTR("covariatesLength");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v10;
  v43[4] = CFSTR("covariatesIndices");
  objc_msgSend(*(id *)(a1 + 48), "indicesData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v11;
  v43[5] = CFSTR("covariatesValues");
  objc_msgSend(*(id *)(a1 + 48), "valuesData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v12;
  v43[6] = CFSTR("isAppleInternal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "insertIntoTable:dictionary:", CFSTR("sessions"), v14);

  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastInsertRowId");
  v16 = CFSTR("sessionId");
  if (*(_QWORD *)(a1 + 56))
  {
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v41[0] = CFSTR("sessionId");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 64);
    v42[0] = v18;
    v42[1] = v19;
    v41[1] = CFSTR("bundleIdentifier");
    v41[2] = CFSTR("domainIdentifier");
    v42[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertIntoTable:dictionary:", CFSTR("sessionsDomainIds"), v21);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 72);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v25);
        v27 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        v38[0] = v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
        v28 = v16;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 64);
        v39[0] = v29;
        v39[1] = v30;
        v38[1] = CFSTR("bundleIdentifier");
        v38[2] = CFSTR("itemIdentifier");
        v39[2] = v26;
        v39[3] = &unk_24D3EAA18;
        v38[3] = CFSTR("lastUsed");
        v38[4] = CFSTR("timesAccessed");
        v39[4] = &unk_24D3EAA18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertIntoTable:dictionary:", CFSTR("sessionsItemIds"), v31);

        v16 = v28;
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v23);
  }

}

+ (id)_sessionDataToBatchWithNumberOfColumns:(unint64_t)a3 rowsData:(id)a4 labelsData:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  sparse_index i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  sparse_m_float *v23;
  PMLTrainingStoredSessionBatch *v24;
  PMLMutableDenseVector *v25;
  void *v26;
  PMLTrainingStoredSessionBatch *v27;
  void *v29;
  float val;
  sparse_index j;

  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  v12 = (unint64_t)objc_msgSend(v10, "length") >> 2;
  if (v12 != v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLTrainingStore.m"), 108, CFSTR("Number of labels %lu does not match number of rows specified %lu"), v12, v11);

  }
  +[PMLSparseMatrix sparseMatrixWithNumberOfRows:numberOfColumns:](PMLSparseMatrix, "sparseMatrixWithNumberOfRows:numberOfColumns:", v11, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "first");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "second");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v16, "length");
      if (v19 >= 4)
      {
        v20 = 0;
        v21 = 0;
        v22 = v19 >> 2;
        do
        {
          LODWORD(j) = 0;
          objc_msgSend(v16, "getBytes:range:", &j, v20, 4);
          val = 0.0;
          objc_msgSend(v18, "getBytes:range:", &val, v20, 4);
          v23 = (sparse_m_float *)objc_msgSend(v13, "matrix");
          sparse_insert_entry_float(v23, val, i, (int)j);
          if ((v21 & 0x1FFF) == 0)
            sparse_commit((void *)objc_msgSend(v13, "matrix"));
          ++v21;
          v20 += 4;
        }
        while (v22 != v21);
      }

    }
  }
  sparse_commit((void *)objc_msgSend(v13, "matrix"));
  v24 = [PMLTrainingStoredSessionBatch alloc];
  v25 = -[PMLDenseVector initWithData:]([PMLMutableDenseVector alloc], "initWithData:", v10);
  +[PMLModelRegressor modelRegressorFromFloats:](PMLModelRegressor, "modelRegressorFromFloats:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PMLTrainingStoredSessionBatch initWithCovariates:outcomes:](v24, "initWithCovariates:outcomes:", v13, v26);

  return v27;
}

+ (int64_t)_migrate:(id)a3 forStore:(id)a4
{
  id v5;
  _BYTE *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[12];
  unsigned int v13;

  v5 = a3;
  v6 = a4;
  if (!v6[32] || objc_msgSend(v5, "userVersion"))
  {
LABEL_8:
    v10 = (void *)objc_opt_new();
    v8 = +[PMLTrainingStore migrate:to:forStore:](PMLTrainingStore, "migrate:to:forStore:", v5, v10, v6);

    goto LABEL_9;
  }
  v13 = 0;
  +[PMLTrainingDatabaseMigrations skipFromZeroSchema:](PMLTrainingDatabaseMigrations, "skipFromZeroSchema:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PMLTrainingStore _runQueries:andUpdateVersionTo:inTransactionOnDb:forStore:](PMLTrainingStore, "_runQueries:andUpdateVersionTo:inTransactionOnDb:forStore:", v7, v13, v5, v6))
  {
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_2159BB000, v9, OS_LOG_TYPE_ERROR, "PMLTrainingStore db failed to create new database with skip queries.", v12, 2u);
    }

    goto LABEL_8;
  }

  v8 = 0;
LABEL_9:

  return v8;
}

+ (int64_t)migrate:(id)a3 to:(id)a4 forStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "migrations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "maxVersion");
  v12 = objc_msgSend(v7, "userVersion");
  if (v12 != v11)
  {
    LODWORD(v13) = v12;
    if (v12 > v11)
    {
      PML_LogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134217984;
        v20 = v13;
        _os_log_impl(&dword_2159BB000, v14, OS_LOG_TYPE_DEFAULT, "Future database version detected (%lu). Giving up on migration.", (uint8_t *)&v19, 0xCu);
      }
      v15 = 2;
LABEL_13:

      goto LABEL_14;
    }
    if (v12 < v11)
    {
      while (1)
      {
        v13 = (v13 + 1);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v16);
        v14 = objc_claimAutoreleasedReturnValue();

        if (!+[PMLTrainingStore _runQueries:andUpdateVersionTo:inTransactionOnDb:forStore:](PMLTrainingStore, "_runQueries:andUpdateVersionTo:inTransactionOnDb:forStore:", v14, v13, v7, v9))break;
        if (v11 == (_DWORD)v13)
          goto LABEL_9;
      }
      PML_LogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_2159BB000, v17, OS_LOG_TYPE_ERROR, "PMLTrainingStore db failed to migrate but migration is needed.", (uint8_t *)&v19, 2u);
      }

      v15 = 4;
      goto LABEL_13;
    }
  }
LABEL_9:
  v15 = 0;
LABEL_14:

  return v15;
}

+ (BOOL)_runQueries:(id)a3 andUpdateVersionTo:(unsigned int)a4 inTransactionOnDb:(id)a5 forStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unsigned int v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke;
  v16[3] = &unk_24D3DB4F8;
  v17 = v9;
  v18 = v11;
  v19 = v10;
  v20 = a4;
  v12 = v10;
  v13 = v11;
  v14 = v9;
  LOBYTE(v9) = objc_msgSend(v12, "frailWriteTransaction:", v16);

  return (char)v9;
}

+ (id)getSchema:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE7A640], "randomlyNamedInMemoryPathWithBaseName:", CFSTR("training_db_schema"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:allowSkipSchema:", v5, 0);
  objc_msgSend(v6, "getSchema:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)lastUsedTimestampLimit
{
  return *(double *)&kLastUsedTimestampLimit;
}

+ (void)setLastUsedTimestampLimit:(double)a3
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("python")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLTrainingStore.m"), 1401, CFSTR("Process name %@ is not python"), v8);

  }
  kLastUsedTimestampLimit = *(_QWORD *)&a3;

}

+ (id)inMemoryStoreForTesting
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BE7A640], "randomlyNamedInMemoryPathWithBaseName:", CFSTR("training_sessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPath:", v3);

  return v4;
}

uint64_t __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  void *v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      v8 = v7;
      objc_msgSend(v8, "objectForKey:", CFSTR("migrationFunction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = v9;
      ((void (*)(_QWORD, _QWORD))objc_msgSend(v9, "pointerValue"))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

LABEL_11:
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

LABEL_10:
    v11 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke_2;
    v15[3] = &unk_24D3DB4D0;
    v12 = v11;
    v18 = *(_DWORD *)(a1 + 56);
    v16 = v12;
    v17 = v7;
    v13 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, 0, v15);

    if (!v13)
    {

      return 0;
    }
    goto LABEL_11;
  }
LABEL_13:

  objc_msgSend(*(id *)(a1 + 48), "setUserVersion:", *(unsigned int *)(a1 + 56));
  return 1;
}

uint64_t __78__PMLTrainingStore__runQueries_andUpdateVersionTo_inTransactionOnDb_forStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PML_LogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned int *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138413058;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Migration encountered error during migration of %@: versions %lu, query: %@, error: %@", (uint8_t *)&v9, 0x2Au);

  }
  return *MEMORY[0x24BE7A6B0];
}

@end
