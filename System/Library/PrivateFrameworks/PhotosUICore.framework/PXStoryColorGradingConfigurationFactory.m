@implementation PXStoryColorGradingConfigurationFactory

+ (id)newConfiguration
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  PXStoryColorGradingConfiguration *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *context;
  _QWORD block[4];
  __CFString *v21;
  id v22;
  SEL v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85CE17C]();
  objc_msgSend(MEMORY[0x1E0D73208], "defaultSystemPhotoDataDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PXStoryColorGradeConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v8, &v24);
  v10 = v24;
  if (v9)
  {
    PLStoryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config file loaded from on-device file at %@", buf, 0xCu);
    }

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cubes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = CFSTR("PXStoryColorGradeConfig");
        v27 = 2112;
        v28 = v10;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "failed to read on device config for %@: %@", buf, 0x16u);
      }

    }
    v14 = -[PXStoryColorGradingConfiguration initWithCubeInfos:]([PXStoryColorGradingConfiguration alloc], "initWithCubeInfos:", v12);

  }
  else
  {
    v14 = 0;
  }

  if (!v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXStoryColorGradingConfigurationFactory_newConfiguration__block_invoke;
    block[3] = &unk_1E5149060;
    v21 = CFSTR("PXStoryColorGradeConfig");
    v22 = a1;
    v23 = a2;
    if (newConfiguration_onceToken != -1)
      dispatch_once(&newConfiguration_onceToken, block);
    objc_msgSend((id)newConfiguration_bundledGradeInfo, "objectForKeyedSubscript:", CFSTR("cubes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      PXAssertGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = CFSTR("PXStoryColorGradeConfig");
        _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "bundled config file is missing cube info for %@", buf, 0xCu);
      }

    }
    v14 = -[PXStoryColorGradingConfiguration initWithCubeInfos:]([PXStoryColorGradingConfiguration alloc], "initWithCubeInfos:", v15);

    if (!v14)
    {
      PLStoryGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config fallback", buf, 2u);
      }

      v14 = objc_alloc_init(PXStoryColorGradingConfiguration);
    }
  }
  objc_autoreleasePoolPop(context);
  return v14;
}

+ (PXStoryColorGradingConfiguration)sharedConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXStoryColorGradingConfigurationFactory_sharedConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, block);
  return (PXStoryColorGradingConfiguration *)(id)sharedConfiguration_sharedConfig;
}

void __62__PXStoryColorGradingConfigurationFactory_sharedConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "newConfiguration");
  v2 = (void *)sharedConfiguration_sharedConfig;
  sharedConfiguration_sharedConfig = v1;

}

void __59__PXStoryColorGradingConfigurationFactory_newConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", *(_QWORD *)(a1 + 32), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config file loaded from bundle at %@", buf, 0xCu);
    }

    v11 = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v3, &v11);
    v6 = v11;
    v7 = (void *)newConfiguration_bundledGradeInfo;
    newConfiguration_bundledGradeInfo = v5;

    if (!newConfiguration_bundledGradeInfo)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "failed to read config for %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "couldn't find config file %@", buf, 0xCu);
    }
  }

}

@end
