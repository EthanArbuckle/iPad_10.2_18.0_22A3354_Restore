@implementation ExpandOverrideDictionary

void ___ExpandOverrideDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("::"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Override key path is invalid: \"%@\", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_22;
  }
  v8 = *(id *)(a1 + 32);
  if (!objc_msgSend(v7, "count"))
    goto LABEL_22;
  v9 = 0;
  while (1)
  {
    v10 = objc_msgSend(v7, "count") - 1;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      break;
    if (v9 != v10)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v11);
      goto LABEL_13;
    }
    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v6, v11);
LABEL_14:

    if (++v9 >= (unint64_t)objc_msgSend(v7, "count"))
      goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v16 = 138412290;
    v17 = v5;
    v15 = "Override key path would step on an already overridden value: \"%@\";
    goto LABEL_20;
  }
  if (v9 != v10)
  {
    v13 = v12;
LABEL_13:

    v8 = v13;
    goto LABEL_14;
  }
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    goto LABEL_21;
  v16 = 138412290;
  v17 = v5;
  v15 = "Override key path specifies a value that already has overriden child keys: \"%@\";
LABEL_20:
  _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0xCu);
LABEL_21:

LABEL_22:
}

@end
