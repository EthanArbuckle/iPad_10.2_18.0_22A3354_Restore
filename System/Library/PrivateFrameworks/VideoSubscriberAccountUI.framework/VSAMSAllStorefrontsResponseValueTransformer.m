@implementation VSAMSAllStorefrontsResponseValueTransformer

- (id)transformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  VSStorefront *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "ratingsStoreFronts");
    v6 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v12 = objc_alloc_init(VSStorefront);
          objc_msgSend(v11, "storeFrontID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSStorefront setIdentitifer:](v12, "setIdentitifer:", v13);

          objc_msgSend(v11, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSStorefront setDisplayName:](v12, "setDisplayName:", v14);

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
  }
  else
  {
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VSAMSAllStorefrontsResponseValueTransformer transformedValue:].cold.2((uint64_t)v3, v6);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)MEMORY[0x24BDF8BF0];
    v16 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v15, "failableWithObject:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[VSAMSAllStorefrontsResponseValueTransformer transformedValue:].cold.1(v18);

    VSPrivateError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;

  return v19;
}

- (void)transformedValue:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "No storefronts.  Will fail as unexpected data response.", v1, 2u);
}

- (void)transformedValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Unexpected response type: %@", (uint8_t *)&v2, 0xCu);
}

@end
