@implementation PXDisplayAssetViewPPTConfiguration

- (PXDisplayAssetViewPPTConfiguration)init
{
  return -[PXDisplayAssetViewPPTConfiguration initWithAssetViewFactory:label:photoLibraryAssetsWithPlaybackStyleFilter:](self, "initWithAssetViewFactory:label:photoLibraryAssetsWithPlaybackStyleFilter:", &__block_literal_global_258501, CFSTR("PXPhotoKitAssetView"), 0);
}

- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 photoLibraryAssetsWithPlaybackStyleFilter:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXDisplayAssetViewPPTConfiguration *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("playbackStyle == %li"), a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    PXDisplayAssetPlaybackStyleDescription();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("All");
  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v15);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v17);

  objc_msgSend(v11, "setFetchLimit:", 100);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PXDisplayAssetViewPPTConfiguration initWithAssetViewFactory:label:assets:label:](self, "initWithAssetViewFactory:label:assets:label:", v9, v8, v18, v14);
  return v19;
}

- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 assets:(id)a5 label:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXDisplayAssetViewPPTConfiguration *v15;
  uint64_t v16;
  id assetViewFactory;
  uint64_t v18;
  NSString *label;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTConfiguration.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetViewFactory != nil"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTConfiguration.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets != nil"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTConfiguration.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetViewFactoryLabel != nil"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTConfiguration.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsLabel != nil"));

LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)PXDisplayAssetViewPPTConfiguration;
  v15 = -[PXDisplayAssetViewPPTConfiguration init](&v25, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    assetViewFactory = v15->_assetViewFactory;
    v15->_assetViewFactory = (id)v16;

    objc_storeStrong((id *)&v15->_assets, a5);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@View-%@Assets"), v12, v14);
    label = v15->_label;
    v15->_label = (NSString *)v18;

  }
  return v15;
}

- (id)assetViewFactory
{
  return self->_assetViewFactory;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_assetViewFactory, 0);
}

PXPhotoKitAssetView *__42__PXDisplayAssetViewPPTConfiguration_init__block_invoke()
{
  return objc_alloc_init(PXPhotoKitAssetView);
}

+ (PHPhotoLibrary)defaultPhotoLibrary
{
  return (PHPhotoLibrary *)objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
}

+ (NSArray)defaultConfigurations
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, _QWORD *, const __CFString *);
  Class v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD aBlock[4];
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke;
  aBlock[3] = &unk_1E5140CA0;
  v13 = v3;
  v5 = v3;
  v6 = (void (**)(void *, _QWORD *, const __CFString *))_Block_copy(aBlock);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_3;
  v11[3] = &__block_descriptor_40_e25___PXDisplayAssetView_8__0l;
  v11[4] = a1;
  v6[2](v6, v11, CFSTR("PXDisplayAssetView"));
  v6[2](v6, __block_literal_global_166_258513, CFSTR("PXPhotoKitAssetView"));
  v7 = NSClassFromString(CFSTR("PHAssetView"));
  if (v7)
  {
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_5;
    v10[3] = &__block_descriptor_40_e5__8__0lu32l8;
    v10[4] = v7;
    v6[2](v6, v10, CFSTR("PHAssetView"));
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return (NSArray *)v8;
}

void __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, uint64_t);
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_2;
  aBlock[3] = &unk_1E5140C78;
  v7 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v5;
  v12 = v7;
  v8 = v6;
  v9 = v5;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v10[2](v10, 1);
  v10[2](v10, 3);
  v10[2](v10, 4);

}

PXDisplayAssetView *__59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_3()
{
  PXDisplayAssetView *v0;
  PXPhotoKitUIMediaProvider *v1;
  id v2;
  void *v3;
  PXPhotoKitUIMediaProvider *v4;

  v0 = objc_alloc_init(PXDisplayAssetView);
  v1 = [PXPhotoKitUIMediaProvider alloc];
  v2 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
  objc_msgSend((id)objc_opt_class(), "defaultPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:](v1, "initWithImageManager:library:", v2, v3);
  -[PXDisplayAssetView setMediaProvider:](v0, "setMediaProvider:", v4);

  return v0;
}

id __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_5(uint64_t a1)
{
  return objc_alloc_init(*(Class *)(a1 + 32));
}

PXPhotoKitAssetView *__59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_4()
{
  return objc_alloc_init(PXPhotoKitAssetView);
}

void __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v2;
  PXDisplayAssetViewPPTConfiguration *v3;

  v2 = (void *)a1[4];
  v3 = -[PXDisplayAssetViewPPTConfiguration initWithAssetViewFactory:label:photoLibraryAssetsWithPlaybackStyleFilter:]([PXDisplayAssetViewPPTConfiguration alloc], "initWithAssetViewFactory:label:photoLibraryAssetsWithPlaybackStyleFilter:", a1[6], a1[5], a2);
  objc_msgSend(v2, "addObject:", v3);

}

@end
