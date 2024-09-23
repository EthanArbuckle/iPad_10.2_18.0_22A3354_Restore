@implementation PXLinkPresentationImageForAsset

uint64_t __PXLinkPresentationImageForAsset_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  PLPhysicalScreenScale();
  PXSizeScale();
  v5 = v4;
  v7 = v6;
  v8 = objc_alloc_init((Class)off_1E50B3068);
  objc_msgSend(v8, "setVersion:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v8, "setDeliveryMode:", 1);
  objc_msgSend(v8, "setResizeMode:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v9);
  }
  else
  {
    objc_msgSend(off_1E50B3348, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageProviderForAsset:", *(_QWORD *)(a1 + 32));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PXLinkPresentationImageForAsset_block_invoke_2;
  v14[3] = &unk_1E5147AB8;
  v15 = v3;
  v12 = v3;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 0, v8, v14, v5, v7);

  return 0;
}

void __PXLinkPresentationImageForAsset_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
      v6 = 136315394;
      v7 = "LPImage * _Nonnull PXLinkPresentationImageForAsset(__strong id<PXDisplayAsset> _Nonnull, CGSize, BOOL)_block_invoke_2";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
