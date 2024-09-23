@implementation SXDataRecordStore

- (SXDataRecordStore)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SXDataDescriptor *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SXDataRecord *v22;
  SXDataRecordStore *v23;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("descriptors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("records"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = -[SXJSONObject initWithJSONObject:andVersion:]([SXDataDescriptor alloc], "initWithJSONObject:andVersion:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14), v6);
        if (-[SXDataDescriptor dataType](v15, "dataType"))
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = -[SXJSONObject initWithJSONObject:andVersion:]([SXDataRecord alloc], "initWithJSONObject:andVersion:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21), v6);
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  v23 = -[SXDataRecordStore initWithRecords:andDescriptors:](self, "initWithRecords:andDescriptors:", v16, v9);
  return v23;
}

- (SXDataRecordStore)initWithRecords:(id)a3 andDescriptors:(id)a4
{
  id v7;
  id v8;
  SXDataRecordStore *v9;
  SXDataRecordStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDataRecordStore;
  v9 = -[SXDataRecordStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_records, a3);
    objc_storeStrong((id *)&v10->_descriptors, a4);
  }

  return v10;
}

- (unint64_t)numberOfRecords
{
  void *v2;
  unint64_t v3;

  -[SXDataRecordStore records](self, "records");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)recordsUsingSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[SXDataRecordStore records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSArray)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
