@implementation PXPlacesGeotaggableMediaProvider

- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  void *v12;
  id v13;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x1A85CE17C]();
  -[PXPlacesGeotaggableMediaProvider _imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:](self, "_imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v13, v7, v11, width, height);
  objc_autoreleasePoolPop(v12);

}

- (void)_imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[PXPlacesGeotaggableMediaProvider _fetchImageManagerAssetForPlacesAsset:](self, "_fetchImageManagerAssetForPlacesAsset:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0D71860];
    objc_msgSend(v12, "coarseLocationProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gpsHorizontalAccuracy");
    v16 = objc_msgSend(v14, "horizontalAccuracyIsCoarse:");

    v17 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(v17, "setResizeMode:", 2);
    objc_msgSend(v17, "setNetworkAccessAllowed:", v6);
    objc_msgSend(v17, "setDeliveryMode:", 1);
    if ((objc_msgSend(v13, "mediaSubtypes") & 1) != 0)
    {
      height = height * 3.0;
      width = width * 3.0;
    }
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__PXPlacesGeotaggableMediaProvider__imageForGeotaggable_ofSize_networkAccessAllowed_andCompletion___block_invoke;
    v19[3] = &unk_1E5133738;
    v21 = v11;
    v22 = v16;
    v20 = v13;
    objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v20, 1, v17, v19, width, height);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0, 0);
  }

}

- (id)_fetchImageManagerAssetForPlacesAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeGuestAssets:", 1);
  objc_msgSend(v5, "setIncludeHiddenAssets:", 1);
  v6 = *MEMORY[0x1E0CD1958];
  v15[0] = *MEMORY[0x1E0CD19C8];
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v7);

  objc_msgSend(v5, "setIncludeAssetSourceTypes:", 7);
  v8 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v3, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __99__PXPlacesGeotaggableMediaProvider__imageForGeotaggable_ofSize_networkAccessAllowed_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGImage *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v9 = v5;
    v6 = CGImageRetain((CGImageRef)objc_msgSend(objc_retainAutorelease(a2), "CGImage"));
    if (*(_BYTE *)(a1 + 48))
    {
      v7 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], PKPlacesCoarseLocationMediaInfoKey);

      v8 = v7;
    }
    else
    {
      v8 = v9;
    }
    v10 = v8;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CGImageRelease(v6);
    v5 = v10;
  }

}

@end
