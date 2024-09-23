@implementation TPSStringCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_5 != -1)
    dispatch_once(&sharedInstance_predicate_5, &__block_literal_global_20);
  return (id)sharedInstance_gTPSStringCacheController;
}

void __42__TPSStringCacheController_sharedInstance__block_invoke()
{
  TPSStringCacheController *v0;
  void *v1;

  v0 = -[TPSDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([TPSStringCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("TPSStringCacheIdentifier"), CFSTR("String"), 5242880, 3);
  v1 = (void *)sharedInstance_gTPSStringCacheController;
  sharedInstance_gTPSStringCacheController = (uint64_t)v0;

}

- (id)newDataCache
{
  TPSDataCache *v2;

  v2 = objc_alloc_init(TPSDataCache);
  -[TPSDataCache setCacheType:](v2, "setCacheType:", 1);
  -[TPSDataCache setMaxAge:](v2, "setMaxAge:", 21600);
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

  -[TPSStringCacheController formattedDataWithData:](self, "formattedDataWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)formattedDataWithData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  if (!v3)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  if (!v4)
  {
    +[TPSLogger data](TPSLogger, "data");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[TPSStringCacheController formattedDataWithData:].cold.1((uint64_t)v3, v5);

    goto LABEL_6;
  }
LABEL_7:

  return v4;
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

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  TPSStringCacheController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[TPSStringCacheController isURLValid:](self, "isURLValid:", v6))
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E395B908;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(v8, block);

  }
}

void __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
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
  block[2] = __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E395B538;
  v6 = a1[6];
  v11 = v4;
  v12 = v6;
  v10 = v5;
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "Invalid string data %@", (uint8_t *)&v2, 0xCu);
}

@end
