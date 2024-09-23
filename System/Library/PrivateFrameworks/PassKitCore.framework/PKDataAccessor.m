@implementation PKDataAccessor

- (id)content
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__73;
  v14 = __Block_byref_object_dispose__73;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__PKDataAccessor_content__block_invoke;
  v7[3] = &unk_1E2AD9448;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[PKDataAccessor contentWithCompletion:](self, "contentWithCompletion:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __25__PKDataAccessor_content__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)dictionary
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__73;
  v14 = __Block_byref_object_dispose__73;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__PKDataAccessor_dictionary__block_invoke;
  v7[3] = &unk_1E2AD9470;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[PKDataAccessor dictionaryWithCompletion:](self, "dictionaryWithCompletion:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __28__PKDataAccessor_dictionary__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5
{
  return 0;
}

- (id)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5
{
  return -[PKDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:](self, "imageSetForType:screenScale:suffix:displayProfile:preheat:", a3, 0, a4, a5, 0.0);
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a7;
  v12 = a5;
  v13 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__73;
  v25 = __Block_byref_object_dispose__73;
  v26 = 0;
  v14 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__PKDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke;
  v18[3] = &unk_1E2AD9498;
  v20 = &v21;
  v15 = v14;
  v19 = v15;
  -[PKDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:](self, "imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:", a3, v12, v13, v7, v18, a4);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __76__PKDataAccessor_imageSetForType_screenScale_suffix_displayProfile_preheat___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)noteShared
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[PKDataAccessor noteShared]";
    v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v5, 0x16u);

  }
}

- (void)updateSettings:(unint64_t)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[PKDataAccessor updateSettings:]";
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);

  }
}

- (void)revocationStatusWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)requestUpdateWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor requestUpdateWithCompletion:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  if (v3)
    v3[2](v3, 0);

}

- (void)dictionaryWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor dictionaryWithCompletion:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  if (v3)
    v3[2](v3, 0);

}

- (void)contentWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor contentWithCompletion:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  if (v3)
    v3[2](v3, 0);

}

- (void)imageSetForType:(int64_t)a3 displayProfile:(id)a4 preheat:(BOOL)a5 withCompletion:(id)a6
{
  -[PKDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:](self, "imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:", a3, 0, a4, a5, a6, 0.0);
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void (**)(id, _QWORD))a8;
  PKLogFacilityTypeGetObject(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[PKDataAccessor imageSetForType:screenScale:suffix:displayProfile:preheat:withCompletion:]";
    v18 = 2114;
    v19 = v15;
    _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v16, 0x16u);

  }
  if (v12)
    v12[2](v12, 0);

}

- (id)resourceValueForKey:(id)a3
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor resourceValueForKey:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (NSData)manifestHash
{
  NSObject *v2;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[PKDataAccessor manifestHash]";
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

- (NSData)archiveData
{
  NSObject *v2;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[PKDataAccessor archiveData]";
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

- (NSData)serializedFileWrapper
{
  NSObject *v2;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[PKDataAccessor serializedFileWrapper]";
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

- (NSBundle)bundle
{
  NSObject *v2;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[PKDataAccessor bundle]";
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v6, 0x16u);

  }
  return 0;
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  NSObject *v4;
  objc_class *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[PKDataAccessor dataForBundleResourceNamed:withExtension:]";
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

- (id)dataForBundleResource:(id)a3
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor dataForBundleResource:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (id)dataForBundleResources:(id)a3
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor dataForBundleResources:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  PKDownloadRemoteAssetConfiguration *v7;
  PKDownloadRemoteAssetConfiguration *v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
    v7 = (PKDownloadRemoteAssetConfiguration *)v11;
  else
    v7 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  v8 = v7;
  -[PKDownloadRemoteAssetConfiguration screenScale](v7, "screenScale");
  if (v9 == 0.0)
    -[PKDownloadRemoteAssetConfiguration setScreenScale:](v8, "setScreenScale:", PKScreenScale());
  v10 = _Block_copy(v6);
  -[PKDataAccessor _downloadRemoteAssetsWithConfiguration:completion:](self, "_downloadRemoteAssetsWithConfiguration:completion:", v8, v10);

}

- (void)_downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD, float))a4 + 2))(a4, 1, 0, 1.0);
}

- (BOOL)remoteAssetsDownloaded
{
  return -[PKDataAccessor remoteAssetsDownloadedForSEIDs:](self, "remoteAssetsDownloadedForSEIDs:", 0);
}

- (BOOL)remoteAssetsDownloadedForSEIDs:(id)a3
{
  return 1;
}

- (BOOL)remoteAssetsDownloadedForScreenScale:(double)a3 suffix:(id)a4
{
  return 1;
}

- (id)remoteAssetManagerForSEIDs:(id)a3
{
  return 0;
}

- (PKRemoteAssetManager)remoteAssetManager
{
  return 0;
}

- (id)displayProfileOfType:(int64_t)a3
{
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[PKDataAccessor displayProfileOfType:]";
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "WARNING: Method '%s' in class '%{public}@' not overridden but called.", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (id)passLocalizedStringForKey:(id)a3
{
  return 0;
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5
{
  -[PKDataAccessor downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:seids:completion:](self, "downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:seids:completion:", a4, 0, 0, a5, a3);
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
  -[PKDataAccessor downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:seids:completion:](self, "downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:seids:completion:", 0, 0, a3);
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 completion:(id)a6
{
  -[PKDataAccessor downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:seids:completion:](self, "downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:seids:completion:", a4, a5, 0, a6, a3);
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 completion:(id)a4
{
  -[PKDataAccessor downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:seids:completion:](self, "downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:seids:completion:", a3, 0, a4);
}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 seids:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKDownloadRemoteAssetConfiguration *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  -[PKDownloadRemoteAssetConfiguration setScreenScale:](v16, "setScreenScale:", a3);
  -[PKDownloadRemoteAssetConfiguration setSuffix:](v16, "setSuffix:", v15);

  -[PKDownloadRemoteAssetConfiguration setCloudStoreCoordinatorDelegate:](v16, "setCloudStoreCoordinatorDelegate:", v14);
  -[PKDownloadRemoteAssetConfiguration setSeids:](v16, "setSeids:", v13);

  -[PKDataAccessor downloadRemoteAssetsWithConfiguration:completion:](self, "downloadRemoteAssetsWithConfiguration:completion:", v16, v12);
}

- (void)downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:(id)a3 seids:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDownloadRemoteAssetConfiguration *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  -[PKDownloadRemoteAssetConfiguration setCloudStoreCoordinatorDelegate:](v11, "setCloudStoreCoordinatorDelegate:", v10);

  -[PKDownloadRemoteAssetConfiguration setSeids:](v11, "setSeids:", v9);
  -[PKDataAccessor downloadRemoteAssetsWithConfiguration:completion:](self, "downloadRemoteAssetsWithConfiguration:completion:", v11, v8);

}

@end
