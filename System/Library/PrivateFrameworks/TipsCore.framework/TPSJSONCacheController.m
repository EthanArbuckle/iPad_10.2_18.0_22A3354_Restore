@implementation TPSJSONCacheController

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  TPSJSONCacheController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[TPSJSONCacheController isURLValid:](self, "isURLValid:", v6))
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E395B908;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(v8, block);

  }
}

- (BOOL)isURLValid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "fileExistsAtPath:", v6);
  return (char)v4;
}

uint64_t __40__TPSJSONCacheController_sharedInstance__block_invoke()
{
  TPSJSONCacheController *v0;
  void *v1;

  v0 = -[TPSDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([TPSJSONCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("TPSJSONCacheIdentifier"), CFSTR("JSON"), 0x800000, 1);
  v1 = (void *)sharedInstance_gTPSJSONCacheController;
  sharedInstance_gTPSJSONCacheController = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance_gTPSJSONCacheController, "setBackgroundOriginUpdate:", 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_0 != -1)
    dispatch_once(&sharedInstance_predicate_0, &__block_literal_global_6);
  return (id)sharedInstance_gTPSJSONCacheController;
}

uint64_t __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(a1[4], "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  objc_msgSend(a1[5], "formattedDataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E395B538;
  v6 = a1[6];
  v11 = v4;
  v12 = v6;
  v10 = v5;
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)formattedDataWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v10;

  v3 = a3;
  if (v3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 1, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
      +[TPSLogger data](TPSLogger, "data");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
          -[TPSJSONCacheController formattedDataWithData:].cold.2((uint64_t)v5, (uint64_t)v6, v7);
      }
      else if (v8)
      {
        -[TPSJSONCacheController formattedDataWithData:].cold.1((uint64_t)v5, v7);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)newDataCache
{
  TPSDataCache *v2;

  v2 = objc_alloc_init(TPSDataCache);
  -[TPSDataCache setCacheType:](v2, "setCacheType:", 0);
  -[TPSDataCache setMaxAge:](v2, "setMaxAge:", 108000);
  return v2;
}

- (id)formattedDataWithFileURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSJSONCacheController formattedDataWithData:](self, "formattedDataWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "Invalid json data %@", (uint8_t *)&v2, 0xCu);
}

- (void)formattedDataWithData:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "Invalid json data %@, error string %@", (uint8_t *)&v3, 0x16u);
}

@end
