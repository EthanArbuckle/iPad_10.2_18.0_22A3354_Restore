@implementation VSAppDeviceConfig

- (VSAppDeviceConfig)init
{
  VSAppDeviceConfig *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAppDeviceConfig;
  v2 = -[VSAppDeviceConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSAppDeviceConfig"));
  }
  return v2;
}

- (unint64_t)preferredVideoFormat
{
  return 0;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  return objc_msgSend(MEMORY[0x24BDBCF38], "vs_isTimeZoneSet");
}

- (id)systemLanguage
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
}

- (id)storeFrontCountryCode
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BDF8C88]);
  objc_msgSend(v2, "start");
  objc_msgSend(v2, "waitUntilFinished");
  objc_msgSend(v2, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke;
  v7[3] = &unk_24FE1A028;
  v7[4] = &v8;
  objc_msgSend(v4, "unwrapObject:error:", v7, &__block_literal_global_5);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (id)timeZone
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __42__VSAppDeviceConfig_storeFrontCountryCode__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Error fetching bag store country code: %@", (uint8_t *)&v2, 0xCu);
}

@end
