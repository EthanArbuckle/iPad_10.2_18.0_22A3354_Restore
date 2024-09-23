@implementation SignpostSupportSerializabledObjectCollection

- (SignpostSupportSerializabledObjectCollection)initWithSerializeableObjectArray:(id)a3
{
  id v4;
  SignpostSupportSerializabledObjectCollection *v5;
  SignpostSupportSerializabledObjectCollection *v6;
  NSNumber *formatVersion;
  uint64_t v8;
  NSArray *objectArray;
  void *v10;
  void *v11;
  SignpostSupportSerializabledObjectCollection *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)SignpostSupportSerializabledObjectCollection;
    v5 = -[SignpostSupportSerializabledObjectCollection init](&v14, sel_init);
    v6 = v5;
    if (v5)
    {
      formatVersion = v5->_formatVersion;
      v5->_formatVersion = (NSNumber *)&unk_1E462E870;

      v8 = objc_msgSend(v4, "copy");
      objectArray = v6->_objectArray;
      v6->_objectArray = (NSArray *)v8;

      objc_msgSend(v4, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_machContinuousTimeFirst = objc_msgSend(v10, "startMachContinuousTime");

      objc_msgSend(v4, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_machContinuousTimeLast = objc_msgSend(v11, "endMachContinuousTime");

    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_versionIsSupported:(id)a3
{
  return objc_msgSend(a3, "isEqualToNumber:", &unk_1E462E870);
}

- (id)newSerializedCollection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E462E870, CFSTR("Vers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportSerializabledObjectCollection machContinuousTimeFirst](self, "machContinuousTimeFirst"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("FirstTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportSerializabledObjectCollection machContinuousTimeLast](self, "machContinuousTimeLast"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("LastTime"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SignpostSupportSerializabledObjectCollection objectArray](self, "objectArray", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "serializeableDictionaryWithShouldRedact:", v3);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          v16 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Objects"));
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v16;
}

+ (id)_deserializedDictionaryForData:(id)a3 errorOut:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Vers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend((id)objc_opt_class(), "_versionIsSupported:", v8) & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FirstTime"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastTime"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Objects"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = v5;
            }
            else if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("No object dictionaries array"));
              v12 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }

          }
          else if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Missing last signpost time"));
            v12 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }

        }
        else if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Missing first signpost time"));
          v12 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_31;
      }
      if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported version: %@"), v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithCode:description:", 3, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("No version in deserialized plist"));
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
    v12 = 0;
    goto LABEL_31;
  }
  if (a4)
  {
    if (v6)
    {
      v13 = (void *)objc_msgSend(v6, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Plist deserialization failed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = 0;
    *a4 = v13;
  }
  else
  {
    v12 = 0;
  }
LABEL_32:

  return v12;
}

- (SignpostSupportSerializabledObjectCollection)initWithData:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  SignpostSupportSerializabledObjectCollection *v18;
  SignpostSupportSerializabledObjectCollection *v19;
  void *v20;
  SignpostSupportSerializabledObjectCollection *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  objc_super v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v6 = a3;
  v31 = 0;
  objc_msgSend((id)objc_opt_class(), "_deserializedDictionaryForData:errorOut:", v6, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v31;
  v9 = v8;
  if (v7)
  {
    v26 = v8;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Vers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FirstTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LastTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __70__SignpostSupportSerializabledObjectCollection_initWithData_errorOut___block_invoke;
    v29[3] = &unk_1E4601418;
    v13 = v12;
    v30 = v13;
    v14 = (void *)MEMORY[0x1A1B10AD8](v29);
    v28 = 0;
    v15 = objc_msgSend((id)objc_opt_class(), "_enumerateSignpostObjectsInDeserializedCollectionDictionary:processingBlock:errorOut:", v7, v14, &v28);
    v16 = v28;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v27.receiver = self;
      v27.super_class = (Class)SignpostSupportSerializabledObjectCollection;
      v18 = -[SignpostSupportSerializabledObjectCollection init](&v27, sel_init);
      v19 = v18;
      v20 = v25;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_objectArray, v12);
        objc_storeStrong((id *)&v19->_formatVersion, v10);
        v19->_machContinuousTimeFirst = objc_msgSend(v11, "unsignedLongLongValue");
        v19->_machContinuousTimeLast = objc_msgSend(v25, "unsignedLongLongValue");
      }
      self = v19;
      v21 = self;
      v9 = v26;
    }
    else
    {
      if (a4)
      {
        if (v16)
        {
          v23 = (void *)objc_msgSend(v16, "copy");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data enumeration error"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v21 = 0;
        *a4 = v23;
      }
      else
      {
        v21 = 0;
      }
      v20 = v25;
      v9 = v26;
    }

  }
  else if (a4)
  {
    if (v8)
    {
      v22 = (void *)objc_msgSend(v8, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown dictionary deserialization error"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = 0;
    *a4 = v22;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __70__SignpostSupportSerializabledObjectCollection_initWithData_errorOut___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (BOOL)timeRangeForSerializedCollection:(id)a3 continuousTimeFirstOut:(unint64_t *)a4 continuousTimeLastOut:(unint64_t *)a5 errorOut:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v9 = a3;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_deserializedDictionaryForData:errorOut:", v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v17;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FirstTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LastTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v13, "unsignedLongLongValue");
    *a5 = objc_msgSend(v14, "unsignedLongLongValue");

  }
  else if (a6)
  {
    if (v11)
    {
      v15 = (void *)objc_msgSend(v11, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data deserialization error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v15;
  }

  return v10 != 0;
}

+ (BOOL)_enumerateSignpostObjectsInDeserializedCollectionDictionary:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5
{
  uint64_t v5;
  void (**v8)(id, uint64_t, _BYTE *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  int v17;
  char v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned __int8 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, _BYTE *))a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Objects"));
  v26 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21 = 0;
        _SignpostSerializeableObjectFromSerializedObjectDictionary(v14, &v21);
        v5 = objc_claimAutoreleasedReturnValue();
        v15 = v21;
        v16 = v15;
        if (!v5)
        {
          if (a5)
          {
            if (v15)
            {
              v19 = (void *)objc_msgSend(v15, "copy");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data deserialization error"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            *a5 = v19;
          }

          LOBYTE(v5) = 0;
          v18 = 0;
          goto LABEL_19;
        }
        v8[2](v8, v5, &v26);
        v17 = v26;

        if (v17)
        {
          v18 = 0;
          LOBYTE(v5) = 1;
          goto LABEL_19;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v18 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v18 = 1;
  }
LABEL_19:

  return (v5 | v18) & 1;
}

+ (BOOL)enumerateSignpostSupportObjectsInSerializedCollection:(id)a3 processingBlock:(id)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v8 = a4;
  v18 = 0;
  objc_msgSend(a1, "_deserializedDictionaryForData:errorOut:", a3, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  v11 = v10;
  if (v9)
  {
    v17 = 0;
    objc_msgSend(a1, "_enumerateSignpostObjectsInDeserializedCollectionDictionary:processingBlock:errorOut:", v9, v8, &v17);
    v12 = v17;
    v13 = v12;
    if (a5)
    {
      if (v12)
      {
        v14 = (void *)objc_msgSend(v12, "copy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data enumeration error"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a5 = v14;
    }

  }
  else if (a5)
  {
    if (v10)
    {
      v15 = (void *)objc_msgSend(v10, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data deserialization error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a5 = v15;
  }

  return v9 != 0;
}

- (NSArray)objectArray
{
  return self->_objectArray;
}

- (NSNumber)formatVersion
{
  return self->_formatVersion;
}

- (unint64_t)machContinuousTimeFirst
{
  return self->_machContinuousTimeFirst;
}

- (unint64_t)machContinuousTimeLast
{
  return self->_machContinuousTimeLast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_objectArray, 0);
}

@end
