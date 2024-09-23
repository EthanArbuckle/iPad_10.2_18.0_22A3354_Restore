@implementation QLItemThumbnailGenerator

- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 completionBlock:(id)a7
{
  -[QLItemThumbnailGenerator generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:](self, "generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:", a3, 0, a7, a4.width, a4.height, a5, a6);
}

- (void)generateThumbnailForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  height = a4.height;
  width = a4.width;
  v15 = a8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __104__QLItemThumbnailGenerator_generateThumbnailForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke;
  v17[3] = &unk_1E9EFC410;
  v18 = v15;
  v16 = v15;
  -[QLItemThumbnailGenerator generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:](self, "generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:", a3, a7, v17, width, height, a5, a6);

}

void __104__QLItemThumbnailGenerator_generateThumbnailForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "UIImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8
{
  double height;
  double width;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  void *v18;
  NSObject **v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  void (**v29)(id, _QWORD);
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  uint8_t buf[16];

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = (void (**)(id, _QWORD))a8;
  if (v16)
  {
    objc_msgSend(v15, "fpItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "fpItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLItemThumbnailGenerator _generateThumbnailWithFPItem:size:minimumDimension:scale:badgeType:completionHandler:](self, "_generateThumbnailWithFPItem:size:minimumDimension:scale:badgeType:completionHandler:", v18, a7, v16, width, height, a5, a6);
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v15, "fetcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "fetchingState") == 1)
    {
      if (!v18)
        goto LABEL_14;
    }
    else
    {
      v21 = objc_msgSend(v18, "isLongFetchOperation");
      if (!v18 || (v21 & 1) != 0)
      {
LABEL_14:
        objc_msgSend(v18, "urlForThumbnail");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          -[QLItemThumbnailGenerator _generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:](self, "_generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:", v26, a7, v16, width, height, 0.0, a6);
        else
          v16[2](v16, 0);

        goto LABEL_18;
      }
    }
    objc_msgSend(v15, "previewItemContentType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemThumbnailGenerator fetcherClassesForPreviewItem:](self, "fetcherClassesForPreviewItem:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __118__QLItemThumbnailGenerator_generateThumbnailRepresentationForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke;
    v27[3] = &unk_1E9EFC438;
    v28 = v22;
    v29 = v16;
    v30 = width;
    v31 = height;
    v32 = a5;
    v33 = a6;
    v34 = a7;
    v27[4] = self;
    v25 = v22;
    objc_msgSend(v18, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v23, v24, 0, v27);

    goto LABEL_18;
  }
  v19 = (NSObject **)MEMORY[0x1E0D83678];
  v20 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v20, OS_LOG_TYPE_ERROR, "Called generateThumbnailWithSize with nil completion block. generateThumbnailWithSize should be called with a completion block. #Thumbnail", buf, 2u);
  }
LABEL_19:

}

void __118__QLItemThumbnailGenerator_generateThumbnailRepresentationForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Could not generate thumbnail because an error occurred while fetching the contents of the item: %@. #Thumbnail", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_11;
  }
  if (!v5)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailWithData:contentType:size:minimumDimension:scale:badgeType:completionHandler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:", v5, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
LABEL_12:

}

- (void)_generateThumbnailWithURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8
{
  double height;
  double width;
  objc_class *v15;
  id v16;
  id v17;
  id v18;

  height = a4.height;
  width = a4.width;
  v15 = (objc_class *)MEMORY[0x1E0CD32C8];
  v16 = a8;
  v17 = a3;
  v18 = (id)objc_msgSend([v15 alloc], "initWithFileAtURL:size:scale:representationTypes:", v17, -1, width, height, a6);

  objc_msgSend(v18, "setMinimumDimension:", a5);
  objc_msgSend(v18, "setBadgeType:", a7);
  -[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:](self, "_generateThumbnailForRequest:completionHandler:", v18, v16);

}

- (void)_generateThumbnailWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8
{
  double height;
  double width;
  objc_class *v15;
  id v16;
  id v17;
  id v18;

  height = a4.height;
  width = a4.width;
  v15 = (objc_class *)MEMORY[0x1E0CD32C8];
  v16 = a8;
  v17 = a3;
  v18 = (id)objc_msgSend([v15 alloc], "initWithFPItem:size:scale:representationTypes:", v17, -1, width, height, a6);

  objc_msgSend(v18, "setMinimumDimension:", a5);
  objc_msgSend(v18, "setBadgeType:", a7);
  -[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:](self, "_generateThumbnailForRequest:completionHandler:", v18, v16);

}

- (void)_generateThumbnailWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 minimumDimension:(double)a6 scale:(double)a7 badgeType:(unint64_t)a8 completionHandler:(id)a9
{
  double height;
  double width;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  height = a5.height;
  width = a5.width;
  v17 = (objc_class *)MEMORY[0x1E0CD32C8];
  v18 = a9;
  v19 = a4;
  v20 = a3;
  v21 = (id)objc_msgSend([v17 alloc], "initWithData:contentType:size:scale:representationTypes:", v20, v19, -1, width, height, a7);

  objc_msgSend(v21, "setMinimumDimension:", a6);
  objc_msgSend(v21, "setBadgeType:", a8);
  -[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:](self, "_generateThumbnailForRequest:completionHandler:", v21, v18);

}

- (void)_generateThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  if (!v6)
    -[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:].cold.1();
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__QLItemThumbnailGenerator__generateThumbnailForRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E9EFC460;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "generateBestRepresentationForRequest:completionHandler:", v5, v10);

}

void __75__QLItemThumbnailGenerator__generateThumbnailForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Could not generate thumbnail because an error occurred while generating best representation for contents of the item: %@. #Thumbnail", (uint8_t *)&v9, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)fetcherClassesForPreviewItem:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t *v6;
  id v7;

  v3 = a3;
  if (fetcherClassesForPreviewItem__onceToken != -1)
    dispatch_once(&fetcherClassesForPreviewItem__onceToken, &__block_literal_global_0);
  if (objc_msgSend(v3, "previewItemType") == 1)
  {
    objc_msgSend(v3, "UTIAnalyzer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAudioOnly");
    v6 = &fetcherClassesForPreviewItem__fetcherAllowedClasses;
    if (!v5)
      v6 = &fetcherClassesForPreviewItem__movieAllowedClasses;
    v7 = (id)*v6;

  }
  else
  {
    v7 = (id)fetcherClassesForPreviewItem__fetcherAllowedClasses;
  }

  return v7;
}

void __57__QLItemThumbnailGenerator_fetcherClassesForPreviewItem___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)fetcherClassesForPreviewItem__fetcherAllowedClasses;
  fetcherClassesForPreviewItem__fetcherAllowedClasses = v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)fetcherClassesForPreviewItem__movieAllowedClasses;
  fetcherClassesForPreviewItem__movieAllowedClasses = v5;

}

- (void)_generateThumbnailForRequest:completionHandler:.cold.1()
{
  __assert_rtn("-[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:]", "QLItemThumbnailGenerator.m", 125, "completionHandler != nil");
}

@end
