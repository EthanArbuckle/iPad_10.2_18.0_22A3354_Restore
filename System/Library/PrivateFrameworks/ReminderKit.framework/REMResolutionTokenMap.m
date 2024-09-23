@implementation REMResolutionTokenMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

- (REMResolutionTokenMap)init
{
  void *v3;
  REMResolutionTokenMap *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMResolutionTokenMap initWithMap:](self, "initWithMap:", v3);

  return v4;
}

- (REMResolutionTokenMap)initWithMap:(id)a3
{
  id v4;
  REMResolutionTokenMap *v5;
  REMResolutionTokenMap *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMResolutionTokenMap;
  v5 = -[REMResolutionTokenMap init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[REMResolutionTokenMap setMap:](v5, "setMap:", v4);

  return v6;
}

- (void)setMap:(id)a3
{
  objc_storeStrong((id *)&self->_map, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMResolutionTokenMap map](self, "map");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("map"));

}

- (REMResolutionTokenMap)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  REMResolutionTokenMap *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("map"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[REMResolutionTokenMap initWithMap:](self, "initWithMap:", v9);
  return v10;
}

- (void)updateForKey:(id)a3
{
  void *v4;
  REMResolutionToken *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[REMResolutionTokenMap map](self, "map");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (REMResolutionToken *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(REMResolutionToken);
    -[REMResolutionTokenMap map](self, "map");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  -[REMResolutionToken update](v5, "update");

}

- (void)initTokenWithDefaultValueIfNecessaryForKey:(id)a3
{
  void *v4;
  void *v5;
  REMResolutionToken *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[REMResolutionTokenMap map](self, "map");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[REMResolutionToken initWithDefaultValue]([REMResolutionToken alloc], "initWithDefaultValue");
    -[REMResolutionTokenMap map](self, "map");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMResolutionTokenMap *v4;
  id v5;
  void *v6;
  void *v7;
  REMResolutionTokenMap *v8;

  v4 = [REMResolutionTokenMap alloc];
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[REMResolutionTokenMap map](self, "map");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:copyItems:", v6, 1);
  v8 = -[REMResolutionTokenMap initWithMap:](v4, "initWithMap:", v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  REMResolutionTokenMap *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (REMResolutionTokenMap *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMResolutionTokenMap map](self, "map");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMResolutionTokenMap map](v4, "map");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)compare:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[REMResolutionTokenMap map](self, "map");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "map");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!(v9 | v11))
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[REMResolutionTokenMap map](self, "map");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "map");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v7;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v19;
      _os_log_fault_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_FAULT, "Comparing two undefined resolution token is unexpected and should never happen {key: %{public}@, self.map.allKeys: %@, other.map.allKeys: %@}", buf, 0x20u);

    }
LABEL_8:
    v12 = -1;
    goto LABEL_9;
  }
  if (!v9 || v11)
  {
    if (v9 || !v11)
    {
      v12 = objc_msgSend((id)v9, "compare:", v11);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (int64_t)compareAndMergeWithMap:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[REMResolutionTokenMap compare:forKey:](self, "compare:forKey:", v6, v7);
  if (v8 == -1)
  {
    objc_msgSend(v6, "map");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[REMResolutionTokenMap map](self, "map");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

  }
  return v8;
}

- (BOOL)mergeWithMap:(id)a3 forKey:(id)a4
{
  return -[REMResolutionTokenMap compareAndMergeWithMap:forKey:](self, "compareAndMergeWithMap:forKey:", a3, a4) == -1;
}

- (void)forceMergeFromMap:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "map");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[REMResolutionTokenMap map](self, "map");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

}

- (id)getTokenForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMResolutionTokenMap map](self, "map");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setToken:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMResolutionTokenMap map](self, "map");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)getTokenKeys
{
  void *v2;
  void *v3;

  -[REMResolutionTokenMap map](self, "map");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)archivedData
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMResolutionTokenMap archivedData].cold.1();

  }
  return v2;
}

+ (REMResolutionTokenMap)mapWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[REMResolutionTokenMap mapWithData:].cold.1();

  }
  return (REMResolutionTokenMap *)v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[REMResolutionTokenMap map](self, "map");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (REMResolutionTokenMap)resolutionTokenMapWithJSONData:(id)a3 keyMap:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  REMResolutionTokenMap *v24;
  REMResolutionTokenMap *v25;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v36);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v36;
    if (v6)
    {
      v8 = objc_opt_class();
      REMDynamicCast(v8, (uint64_t)v6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v28 = v7;
        v29 = v5;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v30 = objc_claimAutoreleasedReturnValue();
        v27 = v9;
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("map"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v10, "keyEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[REMResolutionToken resolutionTokenWithJSONObject:](REMResolutionToken, "resolutionTokenWithJSONObject:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v31, "objectForKey:", v16);
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v19)
                  v21 = (void *)v19;
                else
                  v21 = v16;
                v22 = v21;

                -[NSObject setObject:forKey:](v30, "setObject:forKey:", v18, v22);
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v13);
        }

        v23 = v30;
        v24 = -[REMResolutionTokenMap initWithMap:]([REMResolutionTokenMap alloc], "initWithMap:", v30);

        v5 = v29;
        v9 = v27;
        v7 = v28;
      }
      else
      {
        +[REMLogStore utility](REMLogStore, "utility");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:].cold.2((uint64_t)v6, v23);
        v24 = 0;
      }

    }
    else
    {
      +[REMLogStore utility](REMLogStore, "utility");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:].cold.1();
      v24 = 0;
    }

    v25 = v24;
  }
  else
  {
    v25 = objc_alloc_init(REMResolutionTokenMap);
  }

  return v25;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)archivedData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error encoding resolution token map {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)mapWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error decoding resolution token map {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)resolutionTokenMapWithJSONData:keyMap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Failed to decode data to REMResolutionTokenMap. Returning nil {error: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

+ (void)resolutionTokenMapWithJSONData:(uint64_t)a1 keyMap:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_5();
  v4 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v5, "Unexpected class to decode data to REMResolutionTokenMap. Returning nil {class: %@}", v6);

}

@end
