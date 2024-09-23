@implementation SearchUIPhotosLibraryImage

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIPhotosLibraryImage;
  -[SearchUIImage size](&v12, sel_size);
  v4 = v3;
  v6 = v5;
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == v3 && v7 == v6)
  {
    -[SearchUIPhotosLibraryImage fetchAsset](self, "fetchAsset", *MEMORY[0x1E0C9D820], v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (double)(unint64_t)objc_msgSend(v9, "pixelWidth");
    v6 = (double)(unint64_t)objc_msgSend(v9, "pixelHeight");
    -[SearchUIPhotosLibraryImage setPixelSize:](self, "setPixelSize:", v4, v6);
    -[SearchUIPhotosLibraryImage setSize:](self, "setSize:", v4, v6);

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)photoIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIImage sfImage](self, "sfImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchAsset
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIPhotosLibraryImage asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SearchUIPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v20[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIImage sfImage](self, "sfImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIPhotosUtilities fetchResultForPhotoIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPhotoIdentifiers:isSyndicated:", v6, objc_msgSend(v7, "isSyndicated"));
      v8 = objc_claimAutoreleasedReturnValue();

      -[NSObject firstObject](v8, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIPhotosLibraryImage setAsset:](self, "setAsset:", v3);
      -[SearchUIPhotosLibraryImage setFetchResult:](self, "setFetchResult:", v8);
      if (!-[NSObject count](v8, "count"))
      {
        SearchUIGeneralLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)MEMORY[0x1E0CB37E8];
          -[SearchUIImage sfImage](self, "sfImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isSyndicated"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412802;
          v15 = v5;
          v16 = 2112;
          v17 = v8;
          v18 = 2112;
          v19 = v13;
          _os_log_error_impl(&dword_1DAD39000, v9, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: No assets fetched for photoIdentifier: %@ from fetchResult: %@ isSyndicated: %@", (uint8_t *)&v14, 0x20u);

        }
      }
    }
    else
    {
      SearchUIGeneralLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SearchUIPhotosLibraryImage fetchAsset].cold.1(self);
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)supportsFastPathShadow
{
  return 1;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;

  v7 = a5;
  -[SearchUIPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SearchUIPhotosLibraryImage pixelSize](self, "pixelSize");
    if (v10 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[SearchUIPhotosLibraryImage size](self, "size");
      v14 = v16 * a3;
      -[SearchUIPhotosLibraryImage size](self, "size");
      v12 = v17 * a3;
    }
    else
    {
      -[SearchUIPhotosLibraryImage pixelSize](self, "pixelSize");
      v14 = v13;
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v18[3] = &unk_1EA1F7230;
    v18[4] = self;
    v20 = v14;
    v21 = v12;
    v19 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v18);

  }
  else
  {
    SearchUIGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SearchUIPhotosLibraryImage loadImageWithScale:isDarkStyle:completionHandler:].cold.1(v15);

    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, 1);
  }

}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "fetchAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  if (v2 && (objc_msgSend(v2, "isHidden") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v6[3] = &unk_1EA1F7208;
    v7 = v2;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 1, v3, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
  else
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_cold_1(v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *MEMORY[0x1E0CD1C48];
  if (!v5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SearchUIGeneralLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "isHidden"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "syndicationState"));
      *(_DWORD *)buf = 138413826;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v26;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_error_impl(&dword_1DAD39000, v12, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: missing image for asset: %@ isHidden: %@ photoLibrary: %@ syndicationState: %@ isImageDegraded: %@ isImageCancelled: %@ error: %@", buf, 0x48u);

    }
  }
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v5, objc_msgSend(v14, "BOOLValue") ^ 1);

}

- (void)rejectPerson:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "photosIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSyndicated");

    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPersonIdentifiers:isSyndicated:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke;
    v13[3] = &unk_1EA1F6518;
    v13[4] = self;
    v14 = v9;
    v15 = v10;
    v11 = v10;
    v12 = v9;
    objc_msgSend(v11, "performChanges:completionHandler:", v13, &__block_literal_global_16);

  }
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "fetchAsset");
  objc_msgSend(*(id *)(a1 + 32), "fetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetForFace in (%@)"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetForTorso in (%@)"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orPredicateWithSubpredicates:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3528];
    v11 = (void *)MEMORY[0x1E0CB3880];
    v12 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuidFromLocalIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("noindex:(personForFace) = %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v16 = (void *)MEMORY[0x1E0CB3880];
    v17 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuidFromLocalIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("noindex:(personForTorso) = %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB3528];
    v31[0] = v30;
    v31[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUIPhotosUtilities fetchOptionsForLibrary:](SearchUIPhotosUtilities, "fetchOptionsForLibrary:", *(_QWORD *)(a1 + 48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setIncludeTorsoOnlyDetectionData:", 1);
    objc_msgSend(v26, "setInternalPredicate:", v25);
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fetchedObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 40));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isVerified") & 1) == 0)
      objc_msgSend(v29, "setVerified:", 1);
    objc_msgSend(v29, "removeFaces:", v28);
    objc_msgSend(v29, "addRejectedFaces:forCluster:", v28, 0);

  }
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    SearchUIGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2_cold_1((uint64_t)v4, v5);

  }
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PHFetchResult)fetchResult
{
  return (PHFetchResult *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFetchResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CGSize)pixelSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_pixelSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_pixelSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)fetchAsset
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sfImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAD39000, v2, v3, "SearchUIPhotosLibraryImage: missing photoIdentifier for image: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)loadImageWithScale:(os_log_t)log isDarkStyle:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: missing photoIdentifier. no asset to fetch", v1, 2u);
}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isHidden"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAD39000, v2, v3, "SearchUIPhotosLibraryImage: missing asset: isHidden: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: rejectPersonError: %@", (uint8_t *)&v2, 0xCu);
}

@end
