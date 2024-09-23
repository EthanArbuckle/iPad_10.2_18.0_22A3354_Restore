@implementation HKSPDictionarySerializer

- (HKSPDictionarySerializer)init
{
  return -[HKSPDictionarySerializer initWithSerializationOptions:](self, "initWithSerializationOptions:", 1);
}

- (HKSPDictionarySerializer)initWithSerializationOptions:(unint64_t)a3
{
  HKSPDictionarySerializer *v4;
  HKSPDictionarySerializer *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSMutableArray *stack;
  NSMutableSet *v10;
  NSMutableSet *mutableSerializedClasses;
  HKSPDictionarySerializer *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKSPDictionarySerializer;
  v4 = -[HKSPDictionarySerializer init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_serializationOptions = a3;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    stack = v5->_stack;
    v5->_stack = (NSMutableArray *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableSerializedClasses = v5->_mutableSerializedClasses;
    v5->_mutableSerializedClasses = v10;

    v12 = v5;
  }

  return v5;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)serialize:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  -[HKSPDictionarySerializer encodeRootObject:](self, "encodeRootObject:", a3);
  if (a4)
    *a4 = (id)-[NSError copy](self->_internalError, "copy");
  -[HKSPDictionarySerializer internalError](self, "internalError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

- (NSSet)serializedClasses
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableSerializedClasses, "copy");
}

- (void)encodeRootObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSError *v7;
  NSError *internalError;
  NSDictionary *v9;
  NSDictionary *serializedDictionary;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EE795018))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Root object not serializable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sleep.serialization"), 3, v6);
    v7 = (NSError *)objc_claimAutoreleasedReturnValue();
    internalError = self->_internalError;
    self->_internalError = v7;

  }
  if (!self->_internalError)
  {
    -[HKSPDictionarySerializer _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", v4);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    serializedDictionary = self->_serializedDictionary;
    self->_serializedDictionary = v9;

  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v9, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE795018))
          {
            -[HKSPDictionarySerializer _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v9, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v12);
    }

    -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v9, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v7;
      v28 = v6;
      v17 = v6;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_msgSend(v19, "objectForKeyedSubscript:", v24, v27);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE795018))
            {
              -[HKSPDictionarySerializer _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v24);

            }
            else
            {
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v24);
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v21);
      }

      v7 = v27;
      -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v18, v27);

      v6 = v28;
    }
    else if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE795018))
    {
      -[HKSPDictionarySerializer _encodeProtocolObject:forKey:](self, "_encodeProtocolObject:forKey:", v6, v7);
    }
    else
    {
      -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v6, v7);
    }
  }

}

- (void)_encodeProtocolObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HKSPDictionarySerializer _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPDictionarySerializer _encodeObject:forKey:](self, "_encodeObject:forKey:", v7, v6);

}

- (void)_encodeObject:(id)a3 forKey:(id)a4
{
  NSMutableArray *stack;
  id v6;
  id v7;
  id v8;

  stack = self->_stack;
  v6 = a4;
  v7 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)_dictionaryForProtocolObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSMutableSet *mutableSerializedClasses;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableArray addObject:](self->_stack, "addObject:", v7);
  objc_msgSend(v5, "encodeWithCoder:", self);
  -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("$"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);
  mutableSerializedClasses = self->_mutableSerializedClasses;
  v10 = objc_opt_class();

  -[NSMutableSet addObject:](mutableSerializedClasses, "addObject:", v10);
  return v6;
}

- (unint64_t)hksp_serializationOptions
{
  return self->_serializationOptions;
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (unint64_t)serializationOptions
{
  return self->_serializationOptions;
}

- (NSError)internalError
{
  return self->_internalError;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (NSMutableSet)mutableSerializedClasses
{
  return self->_mutableSerializedClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSerializedClasses, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_internalError, 0);
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
}

@end
