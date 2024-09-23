@implementation TUIUtils

+ (BOOL)isTransparencyFeatureEnabled:(const char *)a3
{
  int v4;
  _BOOL4 v5;

  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v4 = _os_feature_enabled_impl();
  if (!strcmp(a3, ffKTReportToApple))
  {
    if (!v4)
      goto LABEL_15;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_11);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR))
      +[TUIUtils isTransparencyFeatureEnabled:].cold.1();
    goto LABEL_14;
  }
  if ((v4 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_30_1);
  v5 = os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    +[TUIUtils isTransparencyFeatureEnabled:].cold.2();
LABEL_15:
    LOBYTE(v5) = 0;
  }
  return v5;
}

void __41__TUIUtils_isTransparencyFeatureEnabled___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

void __41__TUIUtils_isTransparencyFeatureEnabled___block_invoke_29()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

+ (BOOL)isNetworkError:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "_checkNetworkError:", v4);
  if (v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_31_0);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG))
      +[TUIUtils isNetworkError:].cold.1();
  }

  return v5;
}

void __27__TUIUtils_isNetworkError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

+ (BOOL)isMismatchedAccountError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqual:", *MEMORY[0x24BEBA880]))
  {

LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != -290 || !objc_msgSend(a1, "_checkMismatchedAccountError:", v4))
    goto LABEL_11;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_32_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG))
    +[TUIUtils isMismatchedAccountError:].cold.1();
  v7 = 1;
LABEL_12:

  return v7;
}

void __37__TUIUtils_isMismatchedAccountError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

+ (BOOL)isDateExpired:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

+ (BOOL)isAuthError:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE7EE58]);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE7EE60]) & 1) == 0)
    {

LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
  }
  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if ((v7 & 1) == 0)
  if (v10 != 401)
    goto LABEL_13;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_36_0);
  v11 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG))
    +[TUIUtils isAuthError:].cold.1(v11, v5, (uint64_t)a1);
  v12 = 1;
LABEL_14:

  return v12;
}

void __24__TUIUtils_isAuthError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

+ (BOOL)_checkNetworkError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BEBA8A8]))
    goto LABEL_15;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD1308]))
  {
LABEL_14:

LABEL_15:
LABEL_16:
    v11 = 1;
    goto LABEL_18;
  }
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDB7680]))
  {
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x24BEBA8A0]) && objc_msgSend(v4, "code") == -343)
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", *MEMORY[0x24BEBA898]) && objc_msgSend(v4, "code") == -41)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x24BEBA890]) & 1) != 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v4, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE7EE58]);
  if ((v34 & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE7EE60]))
    {
      v33 = 0;
      goto LABEL_29;
    }
    v31 = v14;
  }
  objc_msgSend(v4, "userInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "integerValue") < 500)
  {

    if ((v34 & 1) != 0)
    {

      goto LABEL_31;
    }
    v33 = 0;
    v14 = v31;
    goto LABEL_29;
  }
  objc_msgSend(v4, "userInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v30 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v16, "integerValue") < 600;

  v13 = v30;
  v14 = v31;
  if ((v34 & 1) == 0)
LABEL_29:

  if (v33)
    goto LABEL_16;
LABEL_31:
  objc_msgSend(v4, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", *MEMORY[0x24BEBA888]);

  if ((v18 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v4, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "_checkNetworkError:", v20) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BDD10D8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        while (2)
        {
          v27 = 0;
          v28 = v20;
          do
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v20 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v27);

            if ((objc_msgSend(a1, "_checkNetworkError:", v20) & 1) != 0)
            {
              v11 = 1;
              goto LABEL_46;
            }
            ++v27;
            v28 = v20;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v25)
            continue;
          break;
        }
      }

      v11 = 0;
      v20 = 0;
LABEL_46:

    }
    else
    {
      v11 = 0;
    }

  }
LABEL_18:

  return v11;
}

+ (BOOL)_checkMismatchedAccountError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("IDSKeyTransparencyVerifierErrorDomain")))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == -8003)
    {
      v7 = 1;
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "_checkMismatchedAccountError:", v9) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD10D8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          v16 = 0;
          v17 = v9;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v9 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);

            if ((objc_msgSend(a1, "_checkMismatchedAccountError:", v9, (_QWORD)v19) & 1) != 0)
            {
              v7 = 1;
              goto LABEL_21;
            }
            ++v16;
            v17 = v9;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
            continue;
          break;
        }
      }

      v7 = 0;
      v9 = 0;
LABEL_21:

    }
    else
    {
      v7 = 0;
    }

  }
LABEL_24:

  return v7;
}

+ (BOOL)isHSA2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAccountAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "securityLevelForAccount:", v5) == 4;

  return (char)v3;
}

+ (void)isTransparencyFeatureEnabled:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2493EE000, v0, v1, "%{public}@ *** %s enabled");
}

+ (void)isTransparencyFeatureEnabled:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2493EE000, v0, v1, "%{public}@ *** %s not enabled");
}

+ (void)isNetworkError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s YES: error = %{public}@ on %{public}@", v2);
}

+ (void)isMismatchedAccountError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s YES: error = %{public}@ on %{public}@", v2);
}

+ (void)isAuthError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "code");
  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136316162;
  v10 = "+[TUIUtils isAuthError:]";
  v11 = 2114;
  v12 = v6;
  v13 = 2048;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  v17 = 2114;
  v18 = a3;
  _os_log_debug_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "%s YES: domain = %{public}@, code = %ld, description = %{public}@ on %{public}@", (uint8_t *)&v9, 0x34u);

}

@end
