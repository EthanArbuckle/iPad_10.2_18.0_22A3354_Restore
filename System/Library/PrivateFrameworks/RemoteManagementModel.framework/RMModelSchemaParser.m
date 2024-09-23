@implementation RMModelSchemaParser

+ (id)loadSupportedOSFromDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v4;
    v5 = v4;
    v38 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v41;
      v35 = a1;
      while (2)
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v41 != v37)
            objc_enumerationMutation(v5);
          v7 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v8 = objc_msgSend(a1, "_platformFromString:", v7, v34);
          if (v8 != -1)
          {
            v9 = v8;
            objc_msgSend(v5, "objectForKeyedSubscript:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("allowed-enrollments"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_parseEnrollmentTypes:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              goto LABEL_20;
            objc_msgSend(v5, "objectForKeyedSubscript:", v7);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("allowed-scopes"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_parseScopes:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {

LABEL_20:
              v24 = 0;
              goto LABEL_21;
            }
            v44[0] = v15;
            v44[1] = v12;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v17);

            objc_msgSend(v5, "objectForKeyedSubscript:", v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("variant"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_parseVariants:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", v36);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "arrayByAddingObject:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v22, v23);

              a1 = v35;
            }

          }
        }
        v38 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v38)
          continue;
        break;
      }
    }

    v24 = (void *)objc_msgSend(v39, "copy");
LABEL_21:

    v4 = v34;
  }
  else
  {
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      +[RMModelSchemaParser loadSupportedOSFromDictionary:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    v24 = 0;
  }

  return v24;
}

+ (id)_parseEnrollmentTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v23)
              +[RMModelSchemaParser _parseEnrollmentTypes:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

            v14 = 0;
            goto LABEL_19;
          }
          v12 = objc_msgSend(a1, "_enrollmentTypeFromString:", v11, (_QWORD)v32);
          if (v12 != -1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v8)
          continue;
        break;
      }
    }

    v14 = (void *)objc_msgSend(v5, "copy");
LABEL_19:

  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      +[RMModelSchemaParser _parseEnrollmentTypes:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }

  return v14;
}

+ (id)_parseScopes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v23)
              +[RMModelSchemaParser _parseScopes:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

            v14 = 0;
            goto LABEL_19;
          }
          v12 = objc_msgSend(a1, "_scopeFromString:", v11, (_QWORD)v32);
          if (v12 != -1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v8)
          continue;
        break;
      }
    }

    v14 = (void *)objc_msgSend(v5, "copy");
LABEL_19:

  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      +[RMModelSchemaParser _parseScopes:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }

  return v14;
}

+ (id)_parseVariants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
LABEL_16:
    v14 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      +[RMModelSchemaParser _parseVariants:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_16;
  }
  v5 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v23)
            +[RMModelSchemaParser _parseVariants:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

          v14 = 0;
          goto LABEL_20;
        }
        v12 = objc_msgSend(a1, "_variantFromString:", v11, (_QWORD)v32);
        if (v12 != -1)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v5, "copy");
LABEL_20:

LABEL_21:
  return v14;
}

+ (int64_t)_platformFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macOS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SharediPad")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tvOS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("visionOS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("watchOS")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMModelSchemaParser _platformFromString:].cold.1();
    v4 = -1;
  }

  return v4;
}

+ (int64_t)_enrollmentTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("user")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("device")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("local")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("supervised")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMModelSchemaParser _enrollmentTypeFromString:].cold.1();
    v4 = -1;
  }

  return v4;
}

+ (int64_t)_scopeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("user")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("system")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMModelSchemaParser _scopeFromString:].cold.1();
    v4 = -1;
  }

  return v4;
}

+ (int64_t)_variantFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("any")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("internal")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RMModelSchemaParser _variantFromString:].cold.1();
    v4 = -1;
  }

  return v4;
}

+ (void)loadSupportedOSFromDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Missing supported-os", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseEnrollmentTypes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Invalid allowed-enrollments", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseEnrollmentTypes:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Missing allowed-enrollments", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseScopes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Invalid allowed-scopes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseScopes:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Missing allowed-scopes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseVariants:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Invalid variant item", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_parseVariants:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Invalid variant", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_platformFromString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_24510E000, MEMORY[0x24BDACB70], v0, "Unrecognized platform in supported-os being ignored: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)_enrollmentTypeFromString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_24510E000, MEMORY[0x24BDACB70], v0, "Unrecognized enrollment type in allowed-enrollments being ignored: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)_scopeFromString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_24510E000, MEMORY[0x24BDACB70], v0, "Unrecognized scope in allowed-scopes being ignored: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)_variantFromString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_24510E000, MEMORY[0x24BDACB70], v0, "Unrecognized variant in variant being ignored: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
