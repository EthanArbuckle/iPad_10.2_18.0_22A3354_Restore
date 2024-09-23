@implementation SearchUIQuickLookThumbnailImage

- (SearchUIQuickLookThumbnailImage)initWithSFImage:(id)a3
{
  id v4;
  SearchUIQuickLookThumbnailImage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIQuickLookThumbnailImage;
  v5 = -[SearchUIImage initWithSFImage:](&v16, sel_initWithSFImage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIQuickLookThumbnailImage setUrl:](v5, "setUrl:", v6);

    objc_msgSend(v4, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIQuickLookThumbnailImage setContentType:](v5, "setContentType:", v7);

    objc_msgSend(v4, "coreSpotlightIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v4, "fileProviderIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileProviderIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:](SearchUIUtilities, "fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIQuickLookThumbnailImage setFpItemID:](v5, "setFpItemID:", v13);

    }
    else
    {
      -[SearchUIQuickLookThumbnailImage url](v5, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_9:
        -[SearchUIQuickLookThumbnailImage updateSize](v5, "updateSize");
        goto LABEL_10;
      }
      SearchUIGeneralLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SearchUIQuickLookThumbnailImage initWithSFImage:].cold.1(v4, v11);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (SearchUIQuickLookThumbnailImage)initWithResult:(id)a3 url:(id)a4 isCompact:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SearchUIQuickLookThumbnailImage *v10;
  SearchUIQuickLookThumbnailImage *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIQuickLookThumbnailImage;
  v10 = -[SearchUIQuickLookThumbnailImage init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SearchUIQuickLookThumbnailImage setUrl:](v10, "setUrl:", v9);
    +[SearchUIUtilities fileProviderItemIDForFileResult:](SearchUIUtilities, "fileProviderItemIDForFileResult:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIQuickLookThumbnailImage setFpItemID:](v11, "setFpItemID:", v12);

    -[SearchUIQuickLookThumbnailImage setIsCompact:](v11, "setIsCompact:", v5);
    -[SearchUIQuickLookThumbnailImage updateSize](v11, "updateSize");
  }

  return v11;
}

- (int)defaultCornerRoundingStyle
{
  return 1;
}

- (void)updateSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;

  -[SearchUIImage sfImage](self, "sfImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v8 == v5 && v9 == v7)
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSize");
    -[SearchUIQuickLookThumbnailImage setSize:](self, "setSize:", v11, v11);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SearchUIQuickLookThumbnailImage request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequest:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)SearchUIQuickLookThumbnailImage;
  -[SearchUIQuickLookThumbnailImage dealloc](&v5, sel_dealloc);
}

- (void)generateImageWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke;
  v13 = &unk_1EA1F6850;
  v8 = v6;
  v14 = v8;
  objc_copyWeak(&v16, &location);
  v9 = v7;
  v15 = v9;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", &v10);
  -[SearchUIQuickLookThumbnailImage setRequest:](self, "setRequest:", v8, v10, v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_2;
  v4[3] = &unk_1EA1F6828;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "generateRepresentationsForRequest:updateHandler:", v3, v4);

  objc_destroyWeak(&v6);
}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];

  v7 = a2;
  v8 = a4;
  objc_msgSend(v7, "UIImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_3;
  v11[3] = &unk_1EA1F6800;
  v14[1] = a3;
  v10 = v9;
  v12 = v10;
  objc_copyWeak(v14, (id *)(a1 + 40));
  v13 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v11);

  objc_destroyWeak(v14);
}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (v2 > objc_msgSend(WeakRetained, "bestRepresentationTypeLoaded"))
    {

LABEL_5:
      v6 = *(_QWORD *)(a1 + 56);
      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v7, "setBestRepresentationTypeLoaded:", v6);

      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v9, "setUiImage:", v8);

      goto LABEL_6;
    }
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "uiImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_5;
  }
LABEL_6:
  v10 = (id *)(a1 + 48);
  v11 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v11, "uiImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 || v2 == 2)
  {
    v13 = *(_QWORD *)(a1 + 40);
    v15 = objc_loadWeakRetained(v10);
    objc_msgSend(v15, "uiImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, BOOL))(v13 + 16))(v13, v14, v2 == 2);

  }
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  SearchUIQuickLookThumbnailImage *v24;
  id v25;
  id v26[4];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[SearchUIImage size](self, "size");
  v9 = v8;
  v11 = v10;
  -[SearchUIQuickLookThumbnailImage fpItemID](self, "fpItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    SearchUIGeneralLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "coreSpotlightIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "providerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v12;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1DAD39000, v13, OS_LOG_TYPE_DEFAULT, "SearchUIQuickLookThumbnailImage loadImageWithScale fpItemId: %@ coreSpotlightIdentifier: %@ fileProviderIdentifier: %@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v22[3] = &unk_1EA1F68A0;
    v23 = v12;
    v26[1] = v9;
    v26[2] = v11;
    v26[3] = *(id *)&a3;
    objc_copyWeak(v26, (id *)buf);
    v24 = self;
    v25 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v22);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SearchUIQuickLookThumbnailImage url](self, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      SearchUIGeneralLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[SearchUIQuickLookThumbnailImage url](self, "url");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_impl(&dword_1DAD39000, v17, OS_LOG_TYPE_DEFAULT, "SearchUIQuickLookThumbnailImage loadImageWithScale url: %@", buf, 0xCu);

      }
      v19 = objc_alloc(MEMORY[0x1E0CD32C8]);
      -[SearchUIQuickLookThumbnailImage url](self, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithFileAtURL:size:scale:representationTypes:", v20, -[SearchUIQuickLookThumbnailImage representationType](self, "representationType"), *(double *)&v9, *(double *)&v11, a3);

      -[SearchUIQuickLookThumbnailImage setupRequest:](self, "setupRequest:", v21);
      -[SearchUIQuickLookThumbnailImage generateImageWithRequest:completionHandler:](self, "generateImageWithRequest:completionHandler:", v21, v7);

    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, 1);
    }
  }

}

void __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  v5[3] = &unk_1EA1F6878;
  v8 = *(_OWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 80);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  objc_msgSend(v2, "fetchItemForItemID:completionHandler:", v3, v5);

  objc_destroyWeak(&v7);
}

void __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = objc_alloc(MEMORY[0x1E0CD32C8]);
    v4 = *(double *)(a1 + 72);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = (void *)objc_msgSend(v3, "initWithFPItem:size:scale:representationTypes:", v8, objc_msgSend(WeakRetained, "representationType"), *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

    objc_msgSend(*(id *)(a1 + 32), "setupRequest:", v6);
    v7 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v7, "generateImageWithRequest:completionHandler:", v6, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setupRequest:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setIconVariant:", 1);
  objc_msgSend(v11, "setIconMode:", 1);
  -[SearchUIImage sfImage](self, "sfImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  if (v6 != *MEMORY[0x1E0C9D820] || v8 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (v6 >= v8)
      v10 = v8;
    else
      v10 = v6;
    objc_msgSend(v11, "setMinimumDimension:", v10);
  }

}

- (unint64_t)representationType
{
  if (-[SearchUIQuickLookThumbnailImage isCompact](self, "isCompact"))
    return 1;
  else
    return -1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void)setFpItemID:(id)a3
{
  objc_storeStrong((id *)&self->_fpItemID, a3);
}

- (QLThumbnailGenerationRequest)request
{
  return (QLThumbnailGenerationRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (int64_t)bestRepresentationTypeLoaded
{
  return self->_bestRepresentationTypeLoaded;
}

- (void)setBestRepresentationTypeLoaded:(int64_t)a3
{
  self->_bestRepresentationTypeLoaded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithSFImage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "coreSpotlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileProviderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "SearchUIQuickLookThumbnailImage: missing info for quicklookthumbnail: corespotlightIdentifier: %@ fileprovideridentifier: %@", (uint8_t *)&v6, 0x16u);

}

@end
