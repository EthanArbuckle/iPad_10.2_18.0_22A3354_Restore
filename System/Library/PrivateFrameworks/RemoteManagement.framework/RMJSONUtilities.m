@implementation RMJSONUtilities

+ (BOOL)serializeJSONDictionary:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 11, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  v11 = v10;
  if (v9)
  {
    v24 = v10;
    v12 = objc_msgSend(v9, "rm_atomicWriteToURL:error:", v8, &v24);
    v13 = v24;

    if ((v12 & 1) != 0)
    {
      v14 = 1;
      goto LABEL_13;
    }
    +[RMLog jsonUtilities](RMLog, "jsonUtilities");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[RMJSONUtilities serializeJSONDictionary:fileURL:error:].cold.2();

    v14 = 0;
    if (a5)
      goto LABEL_11;
  }
  else
  {
    v13 = v10;
    +[RMLog jsonUtilities](RMLog, "jsonUtilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[RMJSONUtilities serializeJSONDictionary:fileURL:error:].cold.1((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);

    v14 = 0;
    v9 = 0;
    if (a5)
    {
LABEL_11:
      if (v13)
      {
        v13 = objc_retainAutorelease(v13);
        v14 = 0;
        *a5 = v13;
      }
    }
  }
LABEL_13:

  return v14;
}

+ (id)deserializeJSONDictionaryAtFileURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  char v28;

  v5 = a3;
  v28 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v28);

  if (v8)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 0, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    if (v9)
    {
      v26 = v10;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v26;

      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v11;
        }
        else
        {
          +[RMLog jsonUtilities](RMLog, "jsonUtilities");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:].cold.3(v22);

          if (a4)
          {
            +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
              *a4 = objc_retainAutorelease(v23);

          }
          v13 = 0;
        }
      }
      else
      {
        +[RMLog jsonUtilities](RMLog, "jsonUtilities");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:].cold.2((uint64_t)v12, v15, v16, v17, v18, v19, v20, v21);

        v13 = 0;
        if (a4 && v12)
        {
          v13 = 0;
          *a4 = objc_retainAutorelease(v12);
        }
      }

    }
    else
    {
      +[RMLog jsonUtilities](RMLog, "jsonUtilities");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:].cold.1();

      v13 = 0;
      if (a4 && v10)
      {
        v12 = objc_retainAutorelease(v10);
        v13 = 0;
        *a4 = v12;
      }
      else
      {
        v12 = v10;
      }
    }

  }
  else
  {
    v13 = (id)MEMORY[0x24BDBD1B8];
  }

  return v13;
}

+ (void)serializeJSONDictionary:(uint64_t)a3 fileURL:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21885E000, a2, a3, "Could not serialize JSON object: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)serializeJSONDictionary:fileURL:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Could not write JSON data to disk %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)deserializeJSONDictionaryAtFileURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Could not read JSON data file: %{public}@ %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)deserializeJSONDictionaryAtFileURL:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21885E000, a2, a3, "Could not deserialize JSON data: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)deserializeJSONDictionaryAtFileURL:(os_log_t)log error:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21885E000, log, OS_LOG_TYPE_ERROR, "Could not deserialize JSON data: invalid JSON object", v1, 2u);
}

@end
