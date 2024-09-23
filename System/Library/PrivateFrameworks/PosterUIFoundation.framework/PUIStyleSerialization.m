@implementation PUIStyleSerialization

+ (id)dataForStyle:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v12;

  v5 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    PUILogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[PUIStyleSerialization dataForStyle:error:].cold.1((uint64_t)v5, (uint64_t)v8, v9);

    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

+ (id)styleForData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v9, v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    PUILogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[PUIStyleSerialization styleForData:error:].cold.1((uint64_t)v11, v12);

  }
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return v10;
}

+ (void)dataForStyle:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_24464E000, log, OS_LOG_TYPE_ERROR, "Failed to archive %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)styleForData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_24464E000, a2, OS_LOG_TYPE_DEBUG, "Unable to unarchive content style: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
