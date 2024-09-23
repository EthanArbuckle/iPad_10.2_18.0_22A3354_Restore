@implementation STTestSyncableObject

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("identifier")))
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  v5.receiver = self;
  v5.super_class = (Class)STTestSyncableObject;
  -[STTestSyncableObject didChangeValueForKey:](&v5, sel_didChangeValueForKey_, v4);

}

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTestSyncableObject identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[STTestSyncableObject subobjects](self, "subobjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[STTestSyncableObject subobjects](self, "subobjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v25[0] = CFSTR("identifier");
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = CFSTR("active");
        v26[0] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "active"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v20.receiver = self;
  v20.super_class = (Class)STTestSyncableObject;
  -[STUniquedManagedObject dictionaryRepresentation](&v20, sel_dictionaryRepresentation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STTestSyncableObject enabled](self, "enabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("enabled"));

  -[STTestSyncableObject identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("identifier"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("subobjects"));
  v17 = (void *)objc_msgSend(v14, "copy");

  return v17;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  STTestSyncableObject *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  -[STTestSyncableObject setEnabled:](self, "setEnabled:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subobjects"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v21 = v4;
    v8 = 0;
    v24 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("active"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        +[STTestSyncableSubObject fetchRequest](STTestSyncableSubObject, "fetchRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPredicate:", v16);

        v25 = v10;
        objc_msgSend(v15, "execute:", &v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v25;

        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "setActive:", v14);
          objc_msgSend(v19, "setRoot:", v23);
        }

        ++v9;
        v10 = v8;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);

    v4 = v21;
  }

  return 1;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STTestSyncableObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  STTestSyncableSubObject *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "execute:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v26 = v10;
    v27 = v9;
    v25 = v12;
    objc_msgSend(v12, "firstObject");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v13 = -[STTestSyncableObject initWithContext:]([STTestSyncableObject alloc], "initWithContext:", v30);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v13;
      -[STTestSyncableObject setIdentifier:](v13, "setIdentifier:", v14);

    }
    v28 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subobjects"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "objectForKeyedSubscript:", CFSTR("identifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[STTestSyncableSubObject fetchRequest](STTestSyncableSubObject, "fetchRequest");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setPredicate:", v21);

          objc_msgSend(v20, "execute:", a5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (STTestSyncableSubObject *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            v23 = -[STTestSyncableSubObject initWithContext:]([STTestSyncableSubObject alloc], "initWithContext:", v30);
            -[STTestSyncableSubObject setIdentifier:](v23, "setIdentifier:", v19);
            -[STTestSyncableSubObject setRoot:](v23, "setRoot:", v29);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v9 = v27;
    v8 = v28;
    v12 = v25;
    v10 = v26;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("test");
}

@end
