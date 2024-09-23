@implementation PKCloudRecordObject

- (PKCloudRecordObject)initWithRecords:(id)a3
{
  id v4;
  PKCloudRecordObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *recordIDToRecord;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCloudRecordObject;
  v5 = -[PKCloudRecordObject init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recordIDToRecord = v5->_recordIDToRecord;
    v5->_recordIDToRecord = v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v14 = v5->_recordIDToRecord;
          objc_msgSend(v13, "recordID", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (NSSet)records
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_recordIDToRecord, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (PKCloudStoreCoding)item
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordObject)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *recordIDToRecord;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudRecordObject;
  v5 = -[PKCloudRecordObject init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("recordIDToRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDToRecord = v5->_recordIDToRecord;
    v5->_recordIDToRecord = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recordIDToRecord, CFSTR("recordIDToRecord"));
}

- (id)descriptionWithItem:(BOOL)a3
{
  return -[PKCloudRecordObject _descriptionWithDetailedOutput:](self, "_descriptionWithDetailedOutput:", 1);
}

- (id)description
{
  return -[PKCloudRecordObject _descriptionWithDetailedOutput:](self, "_descriptionWithDetailedOutput:", 0);
}

- (id)_descriptionWithDetailedOutput:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("records: \n"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKCloudRecordObject records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (v3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "pk_description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR(" --> %@\n"), v11);

        }
        else
        {
          objc_msgSend(v5, "appendFormat:", CFSTR(" --> %@\n"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *recordIDToRecord;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "records");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          recordIDToRecord = self->_recordIDToRecord;
          objc_msgSend(v10, "recordID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](recordIDToRecord, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = self->_recordIDToRecord;
            objc_msgSend(v10, "recordID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v10, v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

- (id)primaryIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKCloudRecordObject item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NSMutableDictionary allValues](self->_recordIDToRecord, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDToRecord, 0);
}

@end
