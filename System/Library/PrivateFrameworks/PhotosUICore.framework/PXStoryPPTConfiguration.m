@implementation PXStoryPPTConfiguration

- (PXStoryPPTConfiguration)initWithPreset:(unint64_t)a3
{
  uint64_t v3;
  PXStoryPPTConfiguration *v4;
  uint64_t v5;
  PXStoryPPTConfiguration *v6;
  void *v10;
  void *v11;
  SEL v12;
  PXStoryPPTConfiguration *v13;
  uint64_t v14;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = a2;
      v13 = self;
      v14 = 86;
      goto LABEL_13;
    case 2uLL:
      v3 = 4;
      goto LABEL_4;
    case 3uLL:
      v3 = 1;
LABEL_4:
      v4 = -[PXStoryPPTConfiguration initWithLatestCollectionOfType:](self, "initWithLatestCollectionOfType:", v3);
      break;
    case 4uLL:
      v5 = 3;
      goto LABEL_8;
    case 5uLL:
      v5 = 2;
      goto LABEL_8;
    case 6uLL:
      v5 = 1;
LABEL_8:
      v4 = -[PXStoryPPTConfiguration initWithAssetType:count:](self, "initWithAssetType:count:", v5, 1000);
      break;
    case 7uLL:
      v4 = -[PXStoryPPTConfiguration initWithDefaultMemory](self, "initWithDefaultMemory");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = a2;
      v13 = self;
      v14 = 100;
LABEL_13:
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PXStoryPPTConfiguration.m"), v14, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v6 = v4;

  return v6;
}

- (PXStoryPPTConfiguration)initWithLatestCollectionOfType:(int64_t)a3
{
  PXStoryPPTConfiguration *v5;
  PXStoryPPTConfiguration *v6;
  NSString *contentDescription;
  const __CFString *v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXStoryPPTConfiguration;
  v5 = -[PXStoryPPTConfiguration init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (a3 == 1)
    {
      contentDescription = v5->_contentDescription;
      v8 = CFSTR("LatestAlbum");
    }
    else
    {
      if (a3 != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXStoryPPTConfiguration.m"), 114, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      contentDescription = v5->_contentDescription;
      v8 = CFSTR("LatestMemory");
    }
    v5->_contentDescription = &v8->isa;

    v6->_collectionType = a3;
  }
  return v6;
}

- (PXStoryPPTConfiguration)initWithDefaultMemory
{
  PXStoryPPTConfiguration *v2;
  PXStoryPPTConfiguration *v3;
  NSString *contentDescription;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryPPTConfiguration;
  v2 = -[PXStoryPPTConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    contentDescription = v2->_contentDescription;
    v2->_contentDescription = (NSString *)CFSTR("DefaultMemory");

    v3->_useDefaultMemory = 1;
  }
  return v3;
}

- (PXStoryPPTConfiguration)initWithAssetCollection:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  PXStoryPPTConfiguration *v9;
  PXStoryPPTConfiguration *v10;
  uint64_t v11;
  NSString *contentDescription;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryPPTConfiguration;
  v9 = -[PXStoryPPTConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    v11 = objc_msgSend(v8, "copy");
    contentDescription = v10->_contentDescription;
    v10->_contentDescription = (NSString *)v11;

  }
  return v10;
}

- (PXStoryPPTConfiguration)initWithAssetType:(unint64_t)a3 count:(unint64_t)a4
{
  PXStoryPPTConfiguration *v6;
  PXStoryPPTConfiguration *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *contentDescription;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryPPTConfiguration;
  v6 = -[PXStoryPPTConfiguration init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_assetType = a3;
    v6->_assetCount = a4;
    -[PXStoryPPTConfiguration _stringFromAssetCount:](v6, "_stringFromAssetCount:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTConfiguration _stringFromAssetType:](v7, "_stringFromAssetType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v8, v9);
    contentDescription = v7->_contentDescription;
    v7->_contentDescription = (NSString *)v10;

  }
  return v7;
}

- (NSString)name
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryPPTConfiguration contentDescription](self, "contentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = -[PXStoryPPTConfiguration subpreset](self, "subpreset");
  if (v5)
  {
    if (v5 > 3)
      v6 = CFSTR("??");
    else
      v6 = off_1E5122088[v5];
    v7 = v6;
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)requestStoryConfigurationWithOptions:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  unint64_t v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("storyDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v11 > 0.0)
  {
    self->_assetCount = vcvtmd_u64_f64(v11);
    -[PXStoryPPTConfiguration setPreferredStoryDuration:](self, "setPreferredStoryDuration:", v11);
  }
  v12 = -[PXStoryPPTConfiguration subpreset](self, "subpreset");
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __78__PXStoryPPTConfiguration_requestStoryConfigurationWithOptions_resultHandler___block_invoke;
  v21 = &unk_1E51415D8;
  v23 = v12;
  v13 = v8;
  v22 = v13;
  v14 = _Block_copy(&v18);
  -[PXStoryPPTConfiguration assetCollection](self, "assetCollection", v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[PXStoryPPTConfiguration _completeConfigurationRequestWithAssetCollection:resultHandler:](self, "_completeConfigurationRequestWithAssetCollection:resultHandler:", v15, v14);
  }
  else if (-[PXStoryPPTConfiguration collectionType](self, "collectionType") == 1
         || -[PXStoryPPTConfiguration collectionType](self, "collectionType") == 4)
  {
    -[PXStoryPPTConfiguration _fetchLatestAssetCollectionOfType:resultHandler:](self, "_fetchLatestAssetCollectionOfType:resultHandler:", -[PXStoryPPTConfiguration collectionType](self, "collectionType"), v14);
  }
  else if (-[PXStoryPPTConfiguration useDefaultMemory](self, "useDefaultMemory"))
  {
    -[PXStoryPPTConfiguration _fetchDefaultMemoryWithResultHandler:](self, "_fetchDefaultMemoryWithResultHandler:", v14);
  }
  else
  {
    v16 = -[PXStoryPPTConfiguration assetType](self, "assetType");
    if (v16 - 2 < 2)
    {
      -[PXStoryPPTConfiguration _fetchAssetsWithResultHandler:](self, "_fetchAssetsWithResultHandler:", v14);
    }
    else if (v16 == 1)
    {
      -[PXStoryPPTConfiguration _createSyntheticAssetsWithResultHandler:](self, "_createSyntheticAssetsWithResultHandler:", v14);
    }
    else if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTConfiguration.m"), 199, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }

}

- (void)_fetchDefaultMemoryWithResultHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PXStoryPPTDefaultMemoryLocalIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PXStoryPPTDefaultMemoryName"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    -[PXStoryPPTConfiguration _fetchMemoryByLocalIdentifier:resultHandler:](self, "_fetchMemoryByLocalIdentifier:resultHandler:", v6, v4);
  }
  else if (v7)
  {
    -[PXStoryPPTConfiguration _fetchMemoryByName:resultHandler:](self, "_fetchMemoryByName:resultHandler:", v7, v4);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "User default PXStoryPPTDefaultMemoryLocalIdentifier or PXStoryPPTDefaultMemoryName should be set for this preset", v10, 2u);
    }

    -[PXStoryPPTConfiguration _completeConfigurationRequestWithAssetCollection:resultHandler:](self, "_completeConfigurationRequestWithAssetCollection:resultHandler:", 0, v4);
  }

}

- (void)_fetchMemoryByLocalIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PXStoryPPTConfiguration__fetchMemoryByLocalIdentifier_resultHandler___block_invoke;
  v8[3] = &unk_1E5141600;
  v9 = v6;
  v7 = v6;
  -[PXStoryPPTConfiguration _configureWithMemoryFetchResultProvider:resultHandler:](self, "_configureWithMemoryFetchResultProvider:resultHandler:", v8, a4);

}

- (void)_fetchMemoryByName:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PXStoryPPTConfiguration__fetchMemoryByName_resultHandler___block_invoke;
  v8[3] = &unk_1E5141600;
  v9 = v6;
  v7 = v6;
  -[PXStoryPPTConfiguration _configureWithMemoryFetchResultProvider:resultHandler:](self, "_configureWithMemoryFetchResultProvider:resultHandler:", v8, a4);

}

- (void)_configureWithMemoryFetchResultProvider:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PXStoryPPTConfiguration__configureWithMemoryFetchResultProvider_resultHandler___block_invoke;
  v11[3] = &unk_1E5141628;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  -[PXStoryPPTConfiguration _performPhotoLibraryFetch:](self, "_performPhotoLibraryFetch:", v11);

}

- (void)_fetchLatestAssetCollectionOfType:(int64_t)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  _QWORD v10[5];
  _QWORD v11[2];
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = v6;
  if (a3 == 4)
  {
    v8 = (void *)objc_opt_class();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke;
    v12[3] = &unk_1E5141650;
    v12[4] = self;
    v9 = &v13;
    v13 = v7;
    objc_msgSend(v8, "_fetchLatestMemoriesWithMaximumCount:resultHandler:", 1, v12);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke_2;
    v10[3] = &unk_1E5141678;
    v11[1] = a3;
    v10[4] = self;
    v9 = (id *)v11;
    v11[0] = v6;
    -[PXStoryPPTConfiguration _performPhotoLibraryFetch:](self, "_performPhotoLibraryFetch:", v10);
  }

}

- (void)_fetchAssetsWithResultHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__263100;
  v9[4] = __Block_byref_object_dispose__263101;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PXStoryPPTConfiguration__fetchAssetsWithResultHandler___block_invoke;
  v6[3] = &unk_1E51416C8;
  v6[4] = self;
  v8 = v9;
  v5 = v4;
  v7 = v5;
  -[PXStoryPPTConfiguration _performPhotoLibraryFetch:](self, "_performPhotoLibraryFetch:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)_createSyntheticAssetsWithResultHandler:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PXStoryPPTConfiguration assetCount](self, "assetCount"))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = objc_alloc((Class)off_1E50B5AF0);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __67__PXStoryPPTConfiguration__createSyntheticAssetsWithResultHandler___block_invoke;
      v11[3] = &__block_descriptor_40_e35_v16__0___PXMutableSyntheticAsset__8l;
      v11[4] = v5;
      v8 = (void *)objc_msgSend(v7, "initWithConfiguration:", v11);
      objc_msgSend(v4, "addObject:", v8);

      ++v5;
    }
    while (v5 < -[PXStoryPPTConfiguration assetCount](self, "assetCount"));
  }
  PXDisplayAssetFetchResultFromArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTConfiguration _completeConfigurationRequestWithFetchResult:resultHandler:](self, "_completeConfigurationRequestWithFetchResult:resultHandler:", v9, v10);

}

- (void)_completeConfigurationRequestWithAssetCollection:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXStoryConfiguration *v9;
  _QWORD block[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = -[PXStoryConfiguration initWithAssetCollection:]([PXStoryConfiguration alloc], "initWithAssetCollection:", v6);
    -[PXStoryPPTConfiguration _completeConfigurationRequestWithStoryConfiguration:resultHandler:](self, "_completeConfigurationRequestWithStoryConfiguration:resultHandler:", v9, v8);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PXStoryPPTConfiguration__completeConfigurationRequestWithAssetCollection_resultHandler___block_invoke;
    block[3] = &unk_1E5148A40;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_completeConfigurationRequestWithFetchResult:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  PXStoryConfiguration *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PXStoryConfiguration initWithAssets:]([PXStoryConfiguration alloc], "initWithAssets:", v7);

  -[PXStoryPPTConfiguration _completeConfigurationRequestWithStoryConfiguration:resultHandler:](self, "_completeConfigurationRequestWithStoryConfiguration:resultHandler:", v8, v6);
}

- (void)_completeConfigurationRequestWithStoryConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[PXStoryPPTConfiguration assetType](self, "assetType") == 1)
  {
    v8 = objc_alloc_init((Class)off_1E50B5AF8);
    objc_msgSend(v6, "setMediaProvider:", v8);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__PXStoryPPTConfiguration__completeConfigurationRequestWithStoryConfiguration_resultHandler___block_invoke;
  v11[3] = &unk_1E5148CE0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

- (void)_performPhotoLibraryFetch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryPPTConfiguration__performPhotoLibraryFetch___block_invoke;
  v6[3] = &unk_1E5141738;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_requestPhotoLibraryWithResultHandler:", v6);

}

- (id)_stringFromAssetCount:(unint64_t)a3
{
  void *v3;

  if (a3 < 0x3E8)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), a3);
  else
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%luk"), a3 / 0x3E8);
  return v3;
}

- (id)_stringFromAssetType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E5141758[a3 - 1];
}

- (PXStoryPPTConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTConfiguration.m"), 406, CFSTR("%s is not available as initializer"), "-[PXStoryPPTConfiguration init]");

  abort();
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)useDefaultMemory
{
  return self->_useDefaultMemory;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (double)preferredStoryDuration
{
  return self->_preferredStoryDuration;
}

- (void)setPreferredStoryDuration:(double)a3
{
  self->_preferredStoryDuration = a3;
}

- (unint64_t)subpreset
{
  return self->_subpreset;
}

- (void)setSubpreset:(unint64_t)a3
{
  self->_subpreset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
}

void __53__PXStoryPPTConfiguration__performPhotoLibraryFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "librarySpecificFetchOptions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __93__PXStoryPPTConfiguration__completeConfigurationRequestWithStoryConfiguration_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __90__PXStoryPPTConfiguration__completeConfigurationRequestWithAssetCollection_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PXStoryPPTConfiguration__createSyntheticAssetsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("A%li"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setLabel:", v4);

}

uint64_t __57__PXStoryPPTConfiguration__fetchAssetsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v3, "assetCount"));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  if (objc_msgSend(*(id *)(a1 + 32), "assetType") == 2)
    v7 = 4;
  else
    v7 = 1;
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("playbackStyle IN %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v4);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  return objc_msgSend(*(id *)(a1 + 32), "_completeConfigurationRequestWithFetchResult:resultHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

void __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_completeConfigurationRequestWithAssetCollection:resultHandler:", v3, *(_QWORD *)(a1 + 40));

}

void __75__PXStoryPPTConfiguration__fetchLatestAssetCollectionOfType_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v5);

  }
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", *(_QWORD *)(a1 + 48), 0x7FFFFFFFFFFFFFFFLL, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_completeConfigurationRequestWithAssetCollection:resultHandler:", v7, *(_QWORD *)(a1 + 40));

}

void __81__PXStoryPPTConfiguration__configureWithMemoryFetchResultProvider_resultHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(v3, "setIncludeRejectedMemories:", 1);
  objc_msgSend(v3, "setIncludeLocalMemories:", 1);
  objc_msgSend(v3, "setIncludeStoryMemories:", 1);
  (*(void (**)(void))(a1[5] + 16))();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1[7];
      v7 = a1[4];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXStoryPPTConfiguration.m"), 261, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("fetchResult.firstObject"), v9, v10);

    }
  }
  objc_msgSend((id)a1[4], "_completeConfigurationRequestWithAssetCollection:resultHandler:", v4, a1[6]);

}

id __60__PXStoryPPTConfiguration__fetchMemoryByName_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title == %@"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v3, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v9);

  }
  else
  {
    objc_msgSend(v3, "setPredicate:", v4);
  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __71__PXStoryPPTConfiguration__fetchMemoryByLocalIdentifier_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD13B8];
  v8 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, v5, v4, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __78__PXStoryPPTConfiguration_requestStoryConfigurationWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  +[PXStoryPPTConfiguration _configureConfiguration:forSubpreset:](PXStoryPPTConfiguration, "_configureConfiguration:forSubpreset:", v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)configurationsForPreset:(unint64_t)a3 subpreset:(unint64_t)a4 testOptions:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  NSObject *v18;
  dispatch_semaphore_t v19;
  uint64_t v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  dispatch_semaphore_t v26;
  _QWORD v27[2];
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  NSObject *v30;
  _QWORD aBlock[4];
  id v32;
  unint64_t v33;

  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke;
  aBlock[3] = &unk_1E5141538;
  v33 = a4;
  v12 = v10;
  v32 = v12;
  v13 = _Block_copy(aBlock);
  v14 = v13;
  if (a3 == 1)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dataSet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dataSetLimit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && !objc_msgSend(v15, "isEqualToString:", CFSTR("Default")))
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("Memories")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryPPTConfiguration.m"), 73, CFSTR("invalid dataSet option: %@"), v15);

        abort();
      }
      v19 = dispatch_semaphore_create(0);
      v20 = objc_msgSend(v16, "integerValue");
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_3;
      v24[3] = &unk_1E51415B0;
      v25 = v12;
      v26 = v19;
      v18 = v19;
      objc_msgSend(a1, "_fetchLatestMemoriesWithMaximumCount:resultHandler:", v20, v24);
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      v27[0] = v11;
      v27[1] = 3221225472;
      v28 = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_2;
      v29 = &unk_1E5141560;
      v30 = v14;
      for (i = 1; i != 8; ++i)
        v28((uint64_t)v27, i);
      v18 = v30;
    }

  }
  else
  {
    (*((void (**)(void *, unint64_t))v13 + 2))(v13, a3);
  }
  v21 = v12;

  return v21;
}

+ (void)_configureConfiguration:(id)a3 forSubpreset:(unint64_t)a4
{
  id v5;
  PXStoryPrecomposedTimelineProducer *v6;
  id v7;

  v5 = a3;
  if (a4 - 1 <= 2)
  {
    v7 = v5;
    v6 = -[PXStoryPrecomposedTimelineProducer initWithTimelineKind:]([PXStoryPrecomposedTimelineProducer alloc], "initWithTimelineKind:", a4);
    objc_msgSend(v7, "setTimelineProducer:", v6);

    v5 = v7;
  }

}

+ (void)_fetchLatestMemoriesWithMaximumCount:(int64_t)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;
  SEL v12;
  id v13;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryPPTConfiguration__fetchLatestMemoriesWithMaximumCount_resultHandler___block_invoke;
  v9[3] = &unk_1E51416A0;
  v12 = a2;
  v13 = a1;
  v10 = v7;
  v11 = a3;
  v8 = v7;
  objc_msgSend(a1, "_requestPhotoLibraryWithResultHandler:", v9);

}

+ (void)_requestPhotoLibraryWithResultHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CD16F8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke;
  v8[3] = &unk_1E5141710;
  v10 = a2;
  v11 = a1;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "requestAuthorizationForAccessLevel:handler:", 2, v8);

}

void __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a2 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("PXStoryPPTConfiguration.m"), 367, CFSTR("No photo library access"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __65__PXStoryPPTConfiguration__requestPhotoLibraryWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__PXStoryPPTConfiguration__fetchLatestMemoriesWithMaximumCount_resultHandler___block_invoke(_QWORD *a1, void *a2)
{
  PXMemoriesFeedDataSourceManager *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  PXMemoriesFeedDataSourceManager *v31;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v3 = -[PXMemoriesFeedDataSourceManager initWithPhotoLibrary:]([PXMemoriesFeedDataSourceManager alloc], "initWithPhotoLibrary:", v32);
  -[PXMemoriesFeedDataSourceManager startGeneratingMemories](v3, "startGeneratingMemories");
  v31 = v3;
  -[PXSectionedDataSourceManager dataSource](v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if ((uint64_t)a1[5] <= 1)
    v6 = 1;
  else
    v6 = a1[5];
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", v6);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = v4;
  objc_msgSend(v4, "entries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v42;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v36 = v8;
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v9, "memories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v14), "assetCollection");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  goto LABEL_16;
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = a1[7];
                v29 = a1[6];
                v21 = (objc_class *)objc_opt_class();
                NSStringFromClass(v21);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "px_descriptionForAssertionMessage");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v29, v27, CFSTR("PXStoryPPTConfiguration.m"), 297, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("memoryInfo.assetCollection"), v20, v25);

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = a1[7];
                v28 = a1[6];
                v19 = (objc_class *)objc_opt_class();
                NSStringFromClass(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v28, v26, CFSTR("PXStoryPPTConfiguration.m"), 297, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("memoryInfo.assetCollection"), v20);
              }

LABEL_16:
              objc_msgSend(v7, "addObject:", v15);
              v16 = objc_msgSend(v7, "count");
              v17 = a1[5];

              if (v16 >= v17)
                goto LABEL_23;
              ++v14;
            }
            while (v12 != v14);
            v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            v12 = v22;
          }
          while (v22);
        }
LABEL_23:

        if ((unint64_t)objc_msgSend(v7, "count") >= a1[5])
          goto LABEL_26;
        v8 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v35);
  }
LABEL_26:

  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:identifier:photoLibrary:", v7, 0, 0, v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();

}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  PXStoryPPTConfiguration *v3;

  v3 = -[PXStoryPPTConfiguration initWithPreset:]([PXStoryPPTConfiguration alloc], "initWithPreset:", a2);
  -[PXStoryPPTConfiguration setSubpreset:](v3, "setSubpreset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 != 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_4;
  v4[3] = &unk_1E5141588;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __73__PXStoryPPTConfiguration_configurationsForPreset_subpreset_testOptions___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PXStoryPPTConfiguration *v6;
  void *v7;
  PXStoryPPTConfiguration *v8;

  v5 = a2;
  v6 = [PXStoryPPTConfiguration alloc];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("LatestMemory%li"), a3);
  v8 = -[PXStoryPPTConfiguration initWithAssetCollection:name:](v6, "initWithAssetCollection:name:", v5, v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

@end
