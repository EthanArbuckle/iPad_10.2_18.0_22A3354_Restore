@implementation PRUISPosterConfigurationUtilities

+ (id)titleStyleAttributesForConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  PRUISPosterTitleStyleAttributes *v13;
  void *v14;
  PRUISPosterTitleStyleAttributes *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  id v38;

  v5 = a3;
  v38 = 0;
  objc_msgSend(v5, "pr_loadTitleStyleConfigurationWithError:", &v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v38;
  if (v6)
  {
    objc_msgSend(v5, "pr_posterProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PRUISLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:].cold.2((uint64_t)v5, v9, v23, v24, v25, v26, v27, v28);
      v15 = 0;
      goto LABEL_19;
    }
    v37 = v7;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v8, &v37);
    v10 = v37;

    -[NSObject URL](v9, "URL");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;

      v13 = [PRUISPosterTitleStyleAttributes alloc];
      objc_msgSend(v5, "role");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PRUISPosterTitleStyleAttributes initWithPRPosterTitleStyleConfiguration:extensionBundleURL:role:](v13, "initWithPRPosterTitleStyleConfiguration:extensionBundleURL:role:", v6, v12, v14);

      v9 = v12;
    }
    else
    {
      PRUISLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:].cold.3((uint64_t)v10, v29, v30, v31, v32, v33, v34, v35);

      v15 = 0;
      if (a4 && v10)
      {
        v7 = objc_retainAutorelease(v10);
        v15 = 0;
        *a4 = v7;
        goto LABEL_19;
      }
    }
    v7 = v10;
LABEL_19:

    goto LABEL_20;
  }
  PRUISLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:].cold.1((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);

  v15 = 0;
  if (a4 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    v15 = 0;
    *a4 = v7;
  }
LABEL_20:

  return v15;
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a2, a3, "[PRUISPosterConfigurationUtilities] Unable to load title style configuration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a2, a3, "[PRUISPosterConfigurationUtilities] Missing poster provider from the poster configuration %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a2, a3, "[PRUISPosterConfigurationUtilities] Unable to resolve extension bundle URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
