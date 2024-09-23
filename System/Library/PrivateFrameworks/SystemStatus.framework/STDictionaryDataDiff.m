@implementation STDictionaryDataDiff

+ (id)diffFromDictionaryData:(id)a3 toDictionaryData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  STDictionaryData *v33;
  STDictionaryData *v34;
  _QWORD *v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectsAndKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "objectsAndKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v38 = v5;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v9, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqual:", v22))
          objc_msgSend(v14, "removeObjectForKey:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v17);
  }
  v37 = v14;

  v23 = (void *)objc_msgSend(v9, "mutableCopy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v13, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKey:", v29, v37, v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqual:", v30))
          objc_msgSend(v23, "removeObjectForKey:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v26);
  }

  v32 = v37;
  if (objc_msgSend(v37, "count"))
    v33 = -[STDictionaryData initWithObjectsAndKeys:]([STDictionaryData alloc], "initWithObjectsAndKeys:", v37);
  else
    v33 = 0;
  if (objc_msgSend(v23, "count", v37))
    v34 = -[STDictionaryData initWithObjectsAndKeys:]([STDictionaryData alloc], "initWithObjectsAndKeys:", v23);
  else
    v34 = 0;
  v35 = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:]([STDictionaryDataDiff alloc], v33, v34);

  return v35;
}

- (_QWORD)initWithObjectsAndKeysAdded:(void *)a3 objectsAndKeysRemoved:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STDictionaryDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (STDictionaryDataDiff)init
{
  return (STDictionaryDataDiff *)-[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:](self, 0, 0);
}

- (id)dictionaryDataByApplyingToDictionaryData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STDictionaryDataDiff applyToMutableDictionaryData:](self, "applyToMutableDictionaryData:", v4);
  return v4;
}

- (void)applyToMutableDictionaryData:(id)a3
{
  id v4;
  STDictionaryData *objectsAndKeysAdded;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  STDictionaryData *objectsAndKeysRemoved;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  else
    objectsAndKeysAdded = 0;
  -[STDictionaryData objectsAndKeys](objectsAndKeysAdded, "objectsAndKeys");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAndKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "addEntriesFromDictionary:", v6);
  v22 = (void *)v6;
  if (self)
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  else
    objectsAndKeysRemoved = 0;
  -[STDictionaryData objectsAndKeys](objectsAndKeysRemoved, "objectsAndKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqual:", v21))
          objc_msgSend(v11, "removeObjectForKey:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v4, "setObjectsAndKeys:", v11);
}

- (BOOL)isEmpty
{
  STDictionaryData *objectsAndKeysAdded;
  STDictionaryData *v4;
  BOOL v5;
  STDictionaryData *objectsAndKeysRemoved;

  if (self)
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  else
    objectsAndKeysAdded = 0;
  v4 = objectsAndKeysAdded;
  if (-[STDictionaryData count](v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    if (self)
      objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
    else
      objectsAndKeysRemoved = 0;
    v5 = -[STDictionaryData count](objectsAndKeysRemoved, "count") == 0;
  }

  return v5;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  id *v5;
  STDictionaryData *objectsAndKeysAdded;
  void *v7;
  void *v8;
  STMutableDictionaryData *v9;
  _QWORD *v10;
  STMutableDictionaryData *v11;
  STDictionaryData *objectsAndKeysRemoved;
  void *v13;
  void *v14;
  STMutableDictionaryData *v15;
  STMutableDictionaryData *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id *v41;
  id v42;
  id v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    v42 = v4;
    if (self)
      objectsAndKeysAdded = self->_objectsAndKeysAdded;
    else
      objectsAndKeysAdded = 0;
    v7 = (void *)-[STDictionaryData mutableCopy](objectsAndKeysAdded, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = objc_alloc_init(STMutableDictionaryData);
    v11 = v9;

    if (self)
      objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
    else
      objectsAndKeysRemoved = 0;
    v13 = (void *)-[STDictionaryData mutableCopy](objectsAndKeysRemoved, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(STMutableDictionaryData);
    v16 = v15;

    v41 = v5;
    if (v5)
    {
      v43 = v5[1];
      v17 = v5[2];
    }
    else
    {
      v43 = 0;
      v17 = 0;
    }
    v40 = v17;
    objc_msgSend(v40, "objectsAndKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v45 = v19;
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          -[STDictionaryData objectsAndKeys](v11, "objectsAndKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKey:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isEqual:", v27))
            -[STMutableDictionaryData removeObjectForKey:](v11, "removeObjectForKey:", v25);
          else
            -[STMutableDictionaryData setObject:forKey:](v16, "setObject:forKey:", v28, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v22);
    }

    objc_msgSend(v43, "objectsAndKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v30, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(obj);
          v35 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          -[STDictionaryData objectsAndKeys](v16, "objectsAndKeys");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKey:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKey:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "isEqual:", v37))
            -[STMutableDictionaryData removeObjectForKey:](v16, "removeObjectForKey:", v35);
          else
            -[STMutableDictionaryData setObject:forKey:](v11, "setObject:forKey:", v38, v35);

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v32);
    }

    if (!-[STDictionaryData count](v11, "count"))
    {

      v11 = 0;
    }
    v4 = v42;
    if (!-[STDictionaryData count](v16, "count"))
    {

      v16 = 0;
    }
    v10 = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:]([STDictionaryDataDiff alloc], v11, v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STDictionaryDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  STDictionaryData *objectsAndKeysAdded;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (self)
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  else
    objectsAndKeysAdded = 0;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__STDictionaryDataDiff_isEqual___block_invoke;
  v20[3] = &unk_1E91E4AB0;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", objectsAndKeysAdded, v20);
  if (self)
    self = (STDictionaryDataDiff *)self->_objectsAndKeysRemoved;
  v15 = v8;
  v16 = 3221225472;
  v17 = __32__STDictionaryDataDiff_isEqual___block_invoke_2;
  v18 = &unk_1E91E4AB0;
  v19 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v15);
  v13 = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return v13;
}

id __32__STDictionaryDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __32__STDictionaryDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STDictionaryData *objectsAndKeysRemoved;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_objectsAndKeysAdded);
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    objectsAndKeysRemoved = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", objectsAndKeysRemoved);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STDictionaryDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  STDictionaryData *objectsAndKeysRemoved;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_objectsAndKeysAdded, CFSTR("objectsAndKeysAdded"));
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("objectsAndKeysAdded"));
    objectsAndKeysRemoved = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", objectsAndKeysRemoved, CFSTR("objectsAndKeysRemoved"));

}

- (STDictionaryDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STDictionaryDataDiff *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectsAndKeysAdded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectsAndKeysRemoved"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:](self, v5, v6);
    v8 = self;
  }

  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STDictionaryDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STDictionaryDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  STDictionaryDataDiff *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STDictionaryDataDiff *v11;

  v3 = self;
  if (self)
  {
    v4 = a3;
    -[STDictionaryDataDiff succinctDescriptionBuilder](v3, "succinctDescriptionBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUseDebugDescription:", 0);
    objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

    objc_msgSend(v5, "activeMultilinePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__STDictionaryDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v5;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v9);

    v3 = (STDictionaryDataDiff *)v7;
  }
  return v3;
}

id __72__STDictionaryDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("objects and keys added"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("objects and keys removed"), 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsAndKeysRemoved, 0);
  objc_storeStrong((id *)&self->_objectsAndKeysAdded, 0);
}

@end
