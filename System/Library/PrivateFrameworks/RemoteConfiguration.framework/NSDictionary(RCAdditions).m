@implementation NSDictionary(RCAdditions)

- (id)rc_dictionaryByTransformingValuesWithKeyAndValueBlock:()RCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSDictionary(RCAdditions) rc_dictionaryByTransformingValuesWithKeyAndValueBlock:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__NSDictionary_RCAdditions__rc_dictionaryByTransformingValuesWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E470EDD0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)rc_subdictionaryForKeys:()RCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)rc_dictionaryFromData:()RCAdditions error:
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    RCCheckedDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)rc_dictionaryFromJSON:()RCAdditions error:
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    RCCheckedDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (uint64_t)rc_dictionaryFromJSON:()RCAdditions
{
  return objc_msgSend(a1, "rc_dictionaryFromJSON:error:", a3, 0);
}

- (id)rc_dictionaryByTransformingKeysWithKeyAndValueBlock:()RCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSDictionary(RCAdditions) rc_dictionaryByTransformingKeysWithKeyAndValueBlock:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__NSDictionary_RCAdditions__rc_dictionaryByTransformingKeysWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E470EDD0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (void)rc_dictionaryByTransformingKeysWithKeyAndValueBlock:()RCAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"transformBlock", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)rc_dictionaryByTransformingValuesWithKeyAndValueBlock:()RCAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"transformBlock", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
