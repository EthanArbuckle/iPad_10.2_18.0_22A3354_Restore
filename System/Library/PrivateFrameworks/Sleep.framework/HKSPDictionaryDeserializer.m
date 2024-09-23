@implementation HKSPDictionaryDeserializer

- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4
{
  return -[HKSPDictionaryDeserializer initWithAllowedClasses:serializedDictionary:serializationOptions:](self, "initWithAllowedClasses:serializedDictionary:serializationOptions:", a3, a4, 1);
}

- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4 serializationOptions:(unint64_t)a5
{
  id v9;
  id v10;
  HKSPDictionaryDeserializer *v11;
  HKSPDictionaryDeserializer *v12;
  NSMutableArray *v13;
  NSMutableArray *stack;
  HKSPDictionaryDeserializer *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKSPDictionaryDeserializer;
  v11 = -[HKSPDictionaryDeserializer init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allowedClasses, a3);
    objc_storeStrong((id *)&v12->_serializedDictionary, a4);
    v12->_serializationOptions = a5;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stack = v12->_stack;
    v12->_stack = v13;

    v15 = v12;
  }

  return v12;
}

- (id)deserializeObjectOfClass:(Class)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  HKSPSerializableKeyForClass((uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionaryDeserializer decodeTopLevelObjectOfClass:forKey:error:](self, "decodeTopLevelObjectOfClass:forKey:error:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decodeTopLevelObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[NSDictionary hksp_isSerialized](self->_serializedDictionary, "hksp_isSerialized"))
  {
    objc_msgSend(v7, "substringFromIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary hksp_serializedClassName](self->_serializedDictionary, "hksp_serializedClassName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
    {
      -[HKSPDictionaryDeserializer _decodeObject:error:](self, "_decodeObject:error:", self->_serializedDictionary, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected class %@"), v9, *MEMORY[0x1E0CB2D50]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.serialization"), 2, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
    }

  }
  else
  {
    if (!a5)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Invalid serialized dictionary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.serialization"), 1, v8);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v10;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (int)decodeIntForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longLongValue");
  return v7;
}

- (float)decodeFloatForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  NSMutableArray *stack;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  stack = self->_stack;
  v4 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  NSMutableArray *stack;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  stack = self->_stack;
  v5 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPDictionaryDeserializer _decodeObject:error:](self, "_decodeObject:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_decodeObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v7, "hksp_isSerialized"))
    {
      -[HKSPDictionaryDeserializer _decodeDeserializable:error:](self, "_decodeDeserializable:error:", v7, a4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v6;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = v7;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSPDictionaryDeserializer _decodeObject:error:](self, "_decodeObject:error:", v24, a4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v20);
      }

      v8 = (id)objc_msgSend(v17, "copy");
      v6 = v27;
    }
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          -[HKSPDictionaryDeserializer _decodeObject:error:](self, "_decodeObject:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v13);
    }

    v8 = (id)objc_msgSend(v10, "copy");
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

- (id)_decodeDeserializable:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hksp_serializedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_stack, "addObject:", v8);
  objc_msgSend(v6, "hksp_serializedClassName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (-[NSSet containsObject:](self->_allowedClasses, "containsObject:", NSClassFromString(v9)))
  {
    a4 = (id *)objc_msgSend(objc_alloc(NSClassFromString(v9)), "initWithCoder:", self);
    -[NSMutableArray removeObject:](self->_stack, "removeObject:", v8);
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disallowed class %@"), v9, *MEMORY[0x1E0CB2D50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.serialization"), 2, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (unint64_t)hksp_serializationOptions
{
  return self->_serializationOptions;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (unint64_t)serializationOptions
{
  return self->_serializationOptions;
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);
}

@end
