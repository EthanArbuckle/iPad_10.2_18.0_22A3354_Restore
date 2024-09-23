@implementation PXLinkPresentationActivityItemProvider

- (PXLinkPresentationActivityItemProvider)initWithConfiguration:(id)a3
{
  id v6;
  PXLinkPresentationActivityItemProvider *v7;
  PXLinkPresentationActivityItemProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLinkPresentationActivityItemProvider.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXLinkPresentationActivityItemProvider;
  v7 = -[PXLinkPresentationActivityItemProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_configuration, a3);

  return v8;
}

- (id)_linkMetadataForConfiguration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CC1120]);
  objc_msgSend(v4, "setPhotoCount:", objc_msgSend(v3, "photoCount"));
  objc_msgSend(v4, "setVideoCount:", objc_msgSend(v3, "videoCount"));
  objc_msgSend(v4, "setOtherItemCount:", objc_msgSend(v3, "otherItemCount"));
  objc_msgSend(v3, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setExpirationDate:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExpirationDate:", v6);

  }
  objc_msgSend(v3, "earliestAssetDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestAssetDate:", v7);

  objc_msgSend(v3, "latestAssetDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLatestAssetDate:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v9, "setSpecialization:", v4);
  v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v11 = objc_opt_class();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke;
  v17[3] = &unk_1E5141130;
  v12 = v3;
  v18 = v12;
  objc_msgSend(v10, "registerObjectOfClass:visibility:loadHandler:", v11, 0, v17);
  objc_msgSend(v12, "placeholderImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v13);
  else
    v14 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithItemProvider:properties:placeholderImage:", v10, 0, v14);
  objc_msgSend(v9, "setImage:", v15);

  return v9;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v4;
  void *v5;

  -[PXLinkPresentationActivityItemProvider configuration](self, "configuration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLinkPresentationActivityItemProvider _linkMetadataForConfiguration:](self, "_linkMetadataForConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXLinkPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  PLPhysicalScreenScale();
  PXSizeScale();
  v5 = v4;
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v8, "setDeliveryMode:", 1);
  objc_msgSend(v8, "setResizeMode:", 1);
  objc_msgSend(*(id *)(a1 + 32), "keyAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke_2;
  v13[3] = &unk_1E5147AB8;
  v14 = v3;
  v11 = v3;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 1, v8, v13, v5, v7);

  return 0;
}

void __72__PXLinkPresentationActivityItemProvider__linkMetadataForConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXLinkPresentationActivityItemProvider: Error fetching thumbnail image data: %@", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
