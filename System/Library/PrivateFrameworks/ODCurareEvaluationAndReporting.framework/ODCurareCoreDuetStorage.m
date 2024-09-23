@implementation ODCurareCoreDuetStorage

- (id)init:(id)a3
{
  id v4;
  ODCurareCoreDuetStorage *v5;
  ODCurareCoreDuetStorage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODCurareCoreDuetStorage;
  v5 = -[ODCurareCoreDuetStorage init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ODCurareCoreDuetStorage setName:](v5, "setName:", v4);
    objc_msgSend(MEMORY[0x24BE1B090], "eventStreamWithName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODCurareCoreDuetStorage setStream:](v6, "setStream:", v7);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XCTestBundlePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      NSLog(CFSTR("Running on Test"));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/tmp/test-interactiondir/%@"), v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODCurareCoreDuetStorage deleteDirectory:](v6, "deleteDirectory:", v11);
      objc_msgSend(MEMORY[0x24BE1B0A8], "storageWithDirectory:readOnly:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODCurareCoreDuetStorage setKnowledgeStore:](v6, "setKnowledgeStore:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODCurareCoreDuetStorage setKnowledgeStore:](v6, "setKnowledgeStore:", v11);
    }

  }
  return v6;
}

- (void)deleteDirectory:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0))
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

}

- (BOOL)saveDictionaries:(id)a3 date:(id)a4 eventIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  const __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v24;
  void *v25;
  const __CFString *v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v26 = CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey");
    v27 = v8;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v27;
    v13 = &v26;
  }
  else
  {
    v28 = CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey");
    v29[0] = MEMORY[0x24BDBD1A8];
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = (id *)v29;
    v13 = &v28;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE1B080];
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v16, v9, v9, v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v20 = objc_msgSend(v18, "saveObjects:error:", v19, &v24);
  v21 = v24;

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v21, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v22);

  }
  return v20;
}

- (BOOL)saveMetadata:(id)a3 date:(id)a4 eventIdentifier:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey");
  v25[0] = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE1B080];
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v14, v11, v11, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v18 = objc_msgSend(v16, "saveObjects:error:", v17, &v22);
  v19 = v22;

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v19, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("ODCurareCoreDuetStorage: %@"), v20);

  }
  return v18;
}

- (id)queryDataWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ODCurareDKEvent *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStreams:", v7);

  objc_msgSend(v5, "setLimit:", 100);
  objc_msgSend(v5, "setPredicate:", v4);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "executeQuery:error:", v5, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;

  v11 = 0;
  if (!v10)
  {
    v19 = v4;
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = -[ODCurareDKEvent initWithDKEvent:]([ODCurareDKEvent alloc], "initWithDKEvent:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16));
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    v4 = v19;
  }

  return v11;
}

+ (id)predicateWithIdentifier:(id)a3 withDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStartInDateRangeFrom:to:", v6, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)deleteData:(id)a3
{
  uint64_t (**v4)(id, void *, void *);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  ODCurareCoreDuetStorage *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  void *v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStreams:", v7);

  objc_msgSend(v5, "setLimit:", 100);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v8, "executeQuery:error:", v5, &v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v9;
    v10 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v10)
    {
      v23 = self;
      v24 = v9;
      v25 = v5;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (v15)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "startDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "metadata");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v4[2](v4, v16, v18);

            if ((v19 & 1) != 0)
            {
              -[ODCurareCoreDuetStorage knowledgeStore](v23, "knowledgeStore");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v15;
              v11 = 1;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = 0;
              objc_msgSend(v20, "deleteObjects:error:", v21, &v26);
              v10 = v26;

              goto LABEL_14;
            }
          }
        }
        v10 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v10)
          continue;
        break;
      }
      v11 = 0;
LABEL_14:
      v9 = v24;
      v5 = v25;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)deleteMultipleData:(id)a3
{
  uint64_t (**v4)(id, void *, void *);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  ODCurareCoreDuetStorage *v27;
  id obj;
  unint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  void *v36;
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStreams:", v7);

  objc_msgSend(v5, "setLimit:", 100);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "executeQuery:error:", v5, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v25 = v9;
    v26 = v5;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v13 = v12;
      v27 = self;
      v10 = 0;
      v29 = 0;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v16)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "startDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "metadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v4[2](v4, v17, v19);

            if (v20)
            {
              -[ODCurareCoreDuetStorage knowledgeStore](v27, "knowledgeStore");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v16;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v10;
              objc_msgSend(v21, "deleteObjects:error:", v22, &v30);
              v23 = v30;

              ++v29;
              v10 = v23;
            }
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0;
      v29 = 0;
    }

    v9 = v25;
    v5 = v26;
    v11 = v29;
  }

  return v11;
}

- (BOOL)deleteDataWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStreams:", v7);

  objc_msgSend(v5, "setLimit:", 100);
  objc_msgSend(v5, "setPredicate:", v4);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "executeQuery:error:", v5, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v9;
    v10 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v12);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (v15)
          {
            -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v15;
            v11 = 1;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 0;
            objc_msgSend(v16, "deleteObjects:error:", v17, &v19);
            v10 = v19;

            goto LABEL_13;
          }
        }
        v10 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v10)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  return v11;
}

- (unint64_t)deleteMultipleDataWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  ODCurareCoreDuetStorage *v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  v7 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStreams:", v8);

  objc_msgSend(v5, "setLimit:", 100);
  objc_msgSend(v5, "setPredicate:", v4);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v9, "executeQuery:error:", v5, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v33;

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v25 = v5;
    v26 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v10;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v13)
    {
      v14 = v13;
      v11 = 0;
      v12 = 0;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (v17)
          {
            -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v17;
            objc_msgSend(*(id *)(v7 + 3632), "arrayWithObjects:count:", &v34, 1);
            v19 = self;
            v20 = v7;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v11;
            objc_msgSend(v18, "deleteObjects:error:", v21, &v28);
            v22 = v28;

            v7 = v20;
            self = v19;

            ++v12;
            v11 = v22;
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v14);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    v5 = v25;
    v4 = v26;
    v10 = v24;
  }

  return v12;
}

- (BOOL)deleteAllData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE1B088]);
  -[ODCurareCoreDuetStorage stream](self, "stream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventStreams:", v5);

  objc_msgSend(v3, "setLimit:", 100);
  -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v6, "executeQuery:error:", v3, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  v9 = v8;
  if (!v8)
  {
    v20 = v7;
    v21 = v3;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = v11;
      v9 = 0;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (v15)
          {
            -[ODCurareCoreDuetStorage knowledgeStore](self, "knowledgeStore");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v15;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v9;
            objc_msgSend(v16, "deleteObjects:error:", v17, &v22);
            v18 = v22;

            v9 = v18;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v12);
    }
    else
    {
      v9 = 0;
    }

    v7 = v20;
    v3 = v21;
    v8 = 0;
  }

  return v8 == 0;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_DKEventStream)stream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return (_DKKnowledgeSaving *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKnowledgeStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
