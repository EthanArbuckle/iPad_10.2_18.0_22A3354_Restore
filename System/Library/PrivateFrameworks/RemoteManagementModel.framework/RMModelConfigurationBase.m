@implementation RMModelConfigurationBase

- (id)declarationClassType
{
  return CFSTR("configuration");
}

+ (BOOL)usesKeychainAssets
{
  void *v3;
  void *v4;

  if (usesKeychainAssets_onceToken != -1)
    dispatch_once(&usesKeychainAssets_onceToken, &__block_literal_global_11);
  v3 = (void *)usesKeychainAssets_keychainTypes;
  objc_msgSend(a1, "assetTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "intersectsSet:", v4);

  return (char)v3;
}

void __46__RMModelConfigurationBase_usesKeychainAssets__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251625530);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)usesKeychainAssets_keychainTypes;
  usesKeychainAssets_keychainTypes = v0;

}

+ (id)assetTypes
{
  return (id)objc_opt_new();
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)assetReferencesFromKeyPaths:(id)a3 payloadObject:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  RMModelConfigurationBase *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v19 = self;
  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = a4;
  v21 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "keyPath", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("$"));

        if (v15)
        {
          objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RMModelConfigurationBase _walkObject:keyPath:assetReference:result:processedIdentifiers:](v19, "_walkObject:keyPath:assetReference:result:processedIdentifiers:", v22, v16, v11, v21, v20);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_msgSend(v21, "copy");
  return v17;
}

- (void)_walkObject:(id)a3 keyPath:(id)a4 assetReference:(id)a5 result:(id)a6 processedIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id obj;
  id obja;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v13, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 1)
    {
      if (v18)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RMModelConfigurationBase _addAssetReference:identifier:keyPath:result:processedIdentifiers:](self, "_addAssetReference:identifier:keyPath:result:processedIdentifiers:", v14, v18, v19, v15, v16);
LABEL_8:

      }
    }
    else if (v18)
    {
      objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMModelConfigurationBase _walkObject:keyPath:assetReference:result:processedIdentifiers:](self, "_walkObject:keyPath:assetReference:result:processedIdentifiers:", v18, v19, v14, v15, v16);
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v13, "firstObject"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("*")),
        v20,
        v21))
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      v22 = v13;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v35 = v12;
      obj = v12;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v43;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v43 != v25)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v26);
            objc_msgSend(v22, "objectAtIndexedSubscript:", 0, v35);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[RMModelConfigurationBase _addAssetReference:identifier:keyPath:result:processedIdentifiers:](self, "_addAssetReference:identifier:keyPath:result:processedIdentifiers:", v14, v27, v28, v15, v16);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v24);
      }

      v12 = v35;
      v13 = v22;
    }
    else
    {
      obja = v13;
      objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v30 = v12;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v39;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v30);
            -[RMModelConfigurationBase _walkObject:keyPath:assetReference:result:processedIdentifiers:](self, "_walkObject:keyPath:assetReference:result:processedIdentifiers:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v34++), v29, v14, v15, v16);
          }
          while (v32 != v34);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v32);
      }

      v13 = obja;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RMModelConfigurationBase _walkObject:keyPath:assetReference:result:processedIdentifiers:].cold.1(v14);
  }
LABEL_10:

}

- (void)_addAssetReference:(id)a3 identifier:(id)a4 keyPath:(id)a5 result:(id)a6 processedIdentifiers:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  RMModelAssetReference *v16;
  void *v17;
  RMModelAssetReference *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v15, "containsObject:", v12) & 1) == 0)
    {
      v16 = [RMModelAssetReference alloc];
      objc_msgSend(v11, "assetTypes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[RMModelAssetReference initWithIdentifier:assetTypes:](v16, "initWithIdentifier:assetTypes:", v12, v17);
      objc_msgSend(v14, "addObject:", v18);

      objc_msgSend(v15, "addObject:", v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RMModelConfigurationBase _addAssetReference:identifier:keyPath:result:processedIdentifiers:].cold.1(v11);
  }

}

+ (id)combineBooleanOr:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "BOOLValue");
      objc_msgSend(v8, "numberWithBool:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v5;
    }
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

+ (id)combineBooleanAnd:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      if (objc_msgSend(v5, "BOOLValue"))
        v9 = objc_msgSend(v7, "BOOLValue");
      else
        v9 = 0;
      objc_msgSend(v8, "numberWithBool:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v5;
    }
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

+ (id)combineNumberMin:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = v6;
  if (v5)
  {
    v8 = v5;
    if (v6)
    {
      if (objc_msgSend(v5, "compare:", v6) == -1)
        v8 = v5;
      else
        v8 = v7;
    }
  }
  v9 = v8;

  return v9;
}

+ (id)combineNumberMax:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = v6;
  if (v5)
  {
    v8 = v5;
    if (v6)
    {
      if (objc_msgSend(v5, "compare:", v6) == 1)
        v8 = v5;
      else
        v8 = v7;
    }
  }
  v9 = v8;

  return v9;
}

+ (id)combineEnumFirst:(id)a3 other:(id)a4 enums:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
    goto LABEL_6;
  if (!v8
    || (v11 = objc_msgSend(v9, "indexOfObject:", v7),
        v12 = objc_msgSend(v10, "indexOfObject:", v8),
        v12 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v13 = v7;
    goto LABEL_7;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }
  if (v11 >= v12)
    v16 = v12;
  else
    v16 = v11;
  objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = v13;

  return v14;
}

+ (id)combineEnumLast:(id)a3 other:(id)a4 enums:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
    goto LABEL_6;
  if (!v8
    || (v11 = objc_msgSend(v9, "indexOfObject:", v7),
        v12 = objc_msgSend(v10, "indexOfObject:", v8),
        v12 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v13 = v7;
    goto LABEL_7;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }
  if (v11 <= v12)
    v16 = v12;
  else
    v16 = v11;
  objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = v13;

  return v14;
}

+ (id)combineFirst:(id)a3 other:(id)a4
{
  if (a3)
    return a3;
  else
    return a4;
}

+ (id)combineArrayAppend:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)combineSetUnion:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v11 = v6;
LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  if (!v6)
  {
    v11 = v5;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

+ (id)combineSetIntersection:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v11 = v6;
LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  if (!v6)
  {
    v11 = v5;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intersectSet:", v9);
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

+ (id)combineDictionary:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      objc_msgSend(v5, "combineWithOther:", v6);
    v8 = v5;
  }
  else
  {
    v8 = (id)objc_msgSend(v6, "copyWithZone:", 0);
  }
  v9 = v8;

  return v9;
}

+ (id)combineMergeDictionary:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v19 = (id)objc_msgSend(v6, "copyWithZone:", 0);
LABEL_19:
    v18 = v19;
    goto LABEL_20;
  }
  if (!v6)
  {
    v19 = v5;
    goto LABEL_19;
  }
  v22 = v5;
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v7;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
        {
          if (v16 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "combineWithOther:", v17);
        }
        else
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  v7 = v21;
  v5 = v22;
LABEL_20:

  return v18;
}

- (void)_walkObject:(void *)a1 keyPath:assetReference:result:processedIdentifiers:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "keyPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24510E000, MEMORY[0x24BDACB70], v2, "Asset reference key path failed: %{public}@ at %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_addAssetReference:(void *)a1 identifier:keyPath:result:processedIdentifiers:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "keyPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24510E000, MEMORY[0x24BDACB70], v2, "Asset reference key wrong type: %{public}@ at %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
