@implementation PTParameterRecords

- (PTParameterRecords)initWithDictionary:(id)a3
{
  id v4;
  PTParameterRecords *v5;
  PTParameterRecords *v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTParameterRecords;
  v5 = -[PTParameterRecords init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PTParameterRecords setRecordDictionary:](v5, "setRecordDictionary:", v4);
    if (!_parameterRecordsQueue)
    {
      v7 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecords", 0);
      v8 = (void *)_parameterRecordsQueue;
      _parameterRecordsQueue = (uint64_t)v7;

    }
  }

  return v6;
}

- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _parameterRecordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PTParameterRecords_addRecordWithKeyPath_domainID_recordClassName_value___block_invoke;
  block[3] = &unk_1E7058500;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_async(v14, block);

}

void __74__PTParameterRecords_addRecordWithKeyPath_domainID_recordClassName_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  PTParameterRecordLeaf *v16;
  void *v17;
  id v18;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setValue:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", &stru_1E7059270))
  {
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "keyPath is an empty string.", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "componentsSeparatedByString:", CFSTR("."));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count") == 1)
    {
      v9 = v8;
    }
    else
    {
      v10 = 0;
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v18, "objectAtIndexedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setValue:forKey:", v13, v14);

        }
        objc_msgSend(v18, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v8 = v9;
      }
      while (objc_msgSend(v18, "count") - 1 > v10);
    }
    v16 = -[PTParameterRecordLeaf initWithRecordClassName:value:]([PTParameterRecordLeaf alloc], "initWithRecordClassName:value:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(v18, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v16, v17);

  }
}

- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = _parameterRecordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PTParameterRecords_removeRecordWithKeyPath_domainID___block_invoke;
  block[3] = &unk_1E7058290;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __55__PTParameterRecords_removeRecordWithKeyPath_domainID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "componentsSeparatedByString:", CFSTR("."));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v21, "count"))
    {
      v8 = 0;
      v9 = v21;
      while (1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          break;
        objc_msgSend(v7, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 >= 2)
        {
          v14 = objc_msgSend(v5, "copy");

          v4 = (id)v14;
        }
        objc_msgSend(v21, "objectAtIndexedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        ++v8;
        v7 = v11;
        v16 = objc_msgSend(v21, "count") > v8;
        v9 = v21;
        if (!v16)
          goto LABEL_11;
      }
    }
    else
    {
      v11 = v7;
LABEL_11:
      objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "count"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v19);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v18;
          v17 = v7;
        }
        while (objc_msgSend(v4, "count") > v18);
      }
      else
      {
        v7 = v17;
      }
      objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v20);

    }
  }
}

- (NSMutableDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void)setRecordDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_recordDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDictionary, 0);
}

@end
