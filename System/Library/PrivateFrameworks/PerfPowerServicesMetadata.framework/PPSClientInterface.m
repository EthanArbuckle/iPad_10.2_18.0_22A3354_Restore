@implementation PPSClientInterface

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMetadataForSubsystem:category:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getMetadataByNameForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getMetadataForSubsystem:category:", v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSClientInterfaceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[PPSClientInterface getMetadataByNameForSubsystem:category:].cold.1((uint64_t)v5, (uint64_t)v7, v10);

    v9 = 0;
  }

  return v9;
}

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getMetadataForSubsystem:category:name:", v7, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSClientInterfaceLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_24399D000, v13, OS_LOG_TYPE_ERROR, "Invalid Input: subsystem=%@, category=%@, name=%@", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)getAllSubsystem
{
  void *v2;
  void *v3;

  +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllSubsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getAllFrameworkSubsystem
{
  void *v2;
  void *v3;

  +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllFrameworkSubsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getMetadataForSubsystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  if (v3)
  {
    +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getMetadataForSubsystem:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __46__PPSClientInterface_getMetadataForSubsystem___block_invoke;
    v19[3] = &unk_25141DB90;
    v8 = v6;
    v20 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);

    if (objc_msgSend(v8, "count"))
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    PPSClientInterfaceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[PPSClientInterface getMetadataForSubsystem:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }

  return v9;
}

void __46__PPSClientInterface_getMetadataForSubsystem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 && v10 && v11 && v12)
  {
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetadataStore getMetadataHistoryForFilepath:subsystem:category:name:](PPSMetadataStore, "getMetadataHistoryForFilepath:subsystem:category:name:", v14, v10, v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSClientInterfaceLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 138413058;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_24399D000, v16, OS_LOG_TYPE_ERROR, "Invalid Input: filepath=%@, subsystem=%@, category=%@, name=%@", (uint8_t *)&v18, 0x2Au);
    }

    v15 = 0;
  }

  return v15;
}

+ (id)getSubsystemsForFilepath:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    objc_msgSend(a3, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSSQLMetadataStore querySubsystemsForFilepath:](PPSSQLMetadataStore, "querySubsystemsForFilepath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSClientInterfaceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSClientInterface getSubsystemsForFilepath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }
  return v4;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetadataStore getMetadataHistoryForFilepath:subsystem:category:](PPSMetadataStore, "getMetadataHistoryForFilepath:subsystem:category:", v11, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSClientInterfaceLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_24399D000, v13, OS_LOG_TYPE_ERROR, "Invalid Input: filepath=%@, subsystem=%@, category=%@", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

+ (void)buildDeviceMetadata
{
  id v2;

  +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildDeviceMetadata");

}

+ (id)getMetadataByCategoryForSubsystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PPSMetadataStore sharedStore](PPSMetadataStore, "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMetadataForSubsystem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)getMetadataForSubsystem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_24399D000, a1, a3, "Invalid Input: subsystem=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

+ (void)getMetadataByNameForSubsystem:(os_log_t)log category:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_24399D000, log, OS_LOG_TYPE_ERROR, "Invalid Input: subsystem=%@, category=%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_6();
}

+ (void)getSubsystemsForFilepath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_24399D000, a1, a3, "Invalid Input: filepath=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
