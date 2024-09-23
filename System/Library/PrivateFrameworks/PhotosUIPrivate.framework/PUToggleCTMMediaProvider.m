@implementation PUToggleCTMMediaProvider

- (PUToggleCTMMediaProvider)initWithViewModel:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  PUToggleCTMMediaProvider *v9;
  PUToggleCTMMediaProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUToggleCTMMediaProvider;
  v9 = -[PUToggleCTMMediaProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

- (BOOL)_shouldToggleCTMForAsset:(id)a3
{
  return 0;
}

- (id)_imageWithSize:(CGSize)a3 string:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PUToggleCTMMediaProvider__imageWithSize_string___block_invoke;
  v11[3] = &unk_1E58A5EF8;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "imageWithActions:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_resourceOfType:(int64_t)a3 forAsset:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PUToggleCTMMediaProvider__resourceOfType_forAsset___block_invoke;
  v9[3] = &__block_descriptor_40_e32_B32__0__PHAssetResource_8Q16_B24l;
  v9[4] = a3;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_ctmImageResourceForAsset:(id)a3
{
  return -[PUToggleCTMMediaProvider _resourceOfType:forAsset:](self, "_resourceOfType:forAsset:", 13, a3);
}

- (id)_ctmVideoResourceForAsset:(id)a3
{
  return -[PUToggleCTMMediaProvider _resourceOfType:forAsset:](self, "_resourceOfType:forAsset:", 14, a3);
}

- (id)_ctmPairedVideoResourceForAsset:(id)a3
{
  return -[PUToggleCTMMediaProvider _resourceOfType:forAsset:](self, "_resourceOfType:forAsset:", 15, a3);
}

- (id)_requestOptions
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CD1470]);
  objc_msgSend(v2, "setNetworkAccessAllowed:", 1);
  return v2;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  height = a4.height;
  width = a4.width;
  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  if (-[PUToggleCTMMediaProvider _shouldToggleCTMForAsset:](self, "_shouldToggleCTMForAsset:", v13))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && height > 150.0)
    {
      v16 = v13;
      -[PUToggleCTMMediaProvider _ctmImageResourceForAsset:](self, "_ctmImageResourceForAsset:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "privateFileURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19
          || (v20 = objc_alloc(MEMORY[0x1E0DC3870]),
              objc_msgSend(v19, "path"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = (void *)objc_msgSend(v20, "initWithContentsOfFile:", v21),
              v21,
              !v22))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating image for resource:%@ fileURL:%@"), v18, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PLOneUpGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v22;
            _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          -[PUToggleCTMMediaProvider _imageWithSize:string:](self, "_imageWithSize:string:", v22, width, height);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v15[2](v15, v24, 0);

          goto LABEL_15;
        }
      }
      else
      {
        PLOneUpGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v16;
          _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No matching CTM resource type for asset:%@"), v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUToggleCTMMediaProvider _imageWithSize:string:](self, "_imageWithSize:string:", v19, width, height);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15[2](v15, v22, 0);
LABEL_15:

      v25 = 0;
      goto LABEL_16;
    }
  }
  v25 = -[PUMediaProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:](self->_mediaProvider, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
LABEL_16:

  return v25;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSObject *, void *, uint64_t, _QWORD);
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v21;
  id v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSObject *, void *, uint64_t, _QWORD))a5;
  if (-[PUToggleCTMMediaProvider _shouldToggleCTMForAsset:](self, "_shouldToggleCTMForAsset:", v8)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v8;
    -[PUToggleCTMMediaProvider _ctmImageResourceForAsset:](self, "_ctmImageResourceForAsset:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "privateFileURL");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14
        && (v15 = objc_alloc(MEMORY[0x1E0C99D50]),
            -[NSObject path](v14, "path"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v15, "initWithContentsOfFile:", v16),
            v16,
            v17))
      {
        objc_msgSend(v13, "uniformTypeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v17, v18, objc_msgSend(v11, "imageOrientation"), 0);

      }
      else
      {
        PLOneUpGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412546;
          v22 = v13;
          v23 = 2112;
          v24 = v14;
          _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Error retrieving data for resource:%@ fileURL:%@", (uint8_t *)&v21, 0x16u);
        }
      }

    }
    else
    {
      PLOneUpGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v11;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", (uint8_t *)&v21, 0xCu);
      }
    }

    v19 = 0;
  }
  else
  {
    v19 = -[PUMediaProvider requestImageDataForAsset:options:resultHandler:](self->_mediaProvider, "requestImageDataForAsset:options:resultHandler:", v8, v9, v10);
  }

  return v19;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSObject *, void *);
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSObject *, void *))a5;
  if (-[PUToggleCTMMediaProvider _shouldToggleCTMForAsset:](self, "_shouldToggleCTMForAsset:", v8)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v8;
    -[PUToggleCTMMediaProvider _ctmImageResourceForAsset:](self, "_ctmImageResourceForAsset:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "privateFileURL");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v26[0] = *MEMORY[0x1E0CD1C20];
        objc_msgSend(v13, "uniformTypeIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = &stru_1E58AD278;
        if (v15)
          v17 = (const __CFString *)v15;
        v27[0] = v17;
        v26[1] = *MEMORY[0x1E0CD1C08];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "imageOrientation"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v14, v19);

      }
      else
      {
        PLOneUpGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 138412546;
          v23 = v13;
          v24 = 2112;
          v25 = 0;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Error retrieving fileURL for resource:%@ fileURL:%@", (uint8_t *)&v22, 0x16u);
        }
      }

    }
    else
    {
      PLOneUpGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v11;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Missing CTM resource for asset:%@", (uint8_t *)&v22, 0xCu);
      }
    }

    v20 = 0;
  }
  else
  {
    v20 = -[PUMediaProvider requestImageURLForAsset:options:resultHandler:](self->_mediaProvider, "requestImageURLForAsset:options:resultHandler:", v8, v9, v10);
  }

  return v20;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[PUToggleCTMMediaProvider _shouldToggleCTMForAsset:](self, "_shouldToggleCTMForAsset:", v8)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PUToggleCTMMediaProvider _ctmVideoResourceForAsset:](self, "_ctmVideoResourceForAsset:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "privateFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v12);
      if (v13)
      {
        v14 = v13;
        v10[2](v10, v13, 0);
      }
      else
      {
        PLOneUpGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Error creating playerItem for resource:%@", (uint8_t *)&v18, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      PLOneUpGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "No private file url for resource:%@", (uint8_t *)&v18, 0xCu);
      }
    }

    v15 = 0;
  }
  else
  {
    v15 = -[PUMediaProvider requestPlayerItemForVideo:options:resultHandler:](self->_mediaProvider, "requestPlayerItemForVideo:options:resultHandler:", v8, v9, v10);
  }

  return v15;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *log;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSObject *v36;
  _QWORD v37[3];

  height = a4.height;
  width = a4.width;
  v37[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  if (-[PUToggleCTMMediaProvider _shouldToggleCTMForAsset:](self, "_shouldToggleCTMForAsset:", v13)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = v13;
    -[PUToggleCTMMediaProvider _ctmImageResourceForAsset:](self, "_ctmImageResourceForAsset:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUToggleCTMMediaProvider _ctmPairedVideoResourceForAsset:](self, "_ctmPairedVideoResourceForAsset:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "privateFileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "privateFileURL");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 && v20)
    {
      v29 = v17;
      v22 = (void *)MEMORY[0x1E0CD1608];
      v37[0] = v19;
      v37[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v22, "livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:prefersHDR:error:", v23, a5, 1, 0, &v30, width, height);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v30;

      if (v24)
      {
        v15[2](v15, v24, 0);
        v17 = v29;
      }
      else
      {
        PLOneUpGetLog();
        log = objc_claimAutoreleasedReturnValue();
        v17 = v29;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v29;
          v33 = 2112;
          v34 = v18;
          v35 = 2112;
          v36 = v25;
          _os_log_impl(&dword_1AAB61000, log, OS_LOG_TYPE_DEFAULT, "Error creating live photo from resources image:%@ video:%@ error:%@", buf, 0x20u);
        }

      }
    }
    else
    {
      PLOneUpGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v17;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "Error creating live photo from resources, missing file URLs for: image:%@ video:%@", buf, 0x16u);
      }
    }

    v26 = 0;
  }
  else
  {
    v26 = -[PUMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:](self->_mediaProvider, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
  }

  return v26;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  return -[PUMediaProvider requestAnimatedImageForAsset:options:resultHandler:](self->_mediaProvider, "requestAnimatedImageForAsset:options:resultHandler:", a3, a4, a5);
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = -[PUMediaProvider requestAVAssetForVideo:options:resultHandler:](self->_mediaProvider, "requestAVAssetForVideo:options:resultHandler:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = -[PUMediaProvider requestAsynchronousVideoURLForAsset:options:resultHandler:](self->_mediaProvider, "requestAsynchronousVideoURLForAsset:options:resultHandler:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[PUMediaProvider cancelImageRequest:](self->_mediaProvider, "cancelImageRequest:");
  objc_msgSend(MEMORY[0x1E0CD1608], "cancelLivePhotoRequestWithRequestID:", v3);
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

BOOL __53__PUToggleCTMMediaProvider__resourceOfType_forAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

void __50__PUToggleCTMMediaProvider__imageWithSize_string___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v14 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 28.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawInRect:withAttributes:", v13, v5, v7, v9, v11);

}

@end
