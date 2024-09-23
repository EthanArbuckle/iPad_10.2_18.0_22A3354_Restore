@implementation QLSingleItemThumbnailGenerator

- (QLSingleItemThumbnailGenerator)initWithItem:(id)a3
{
  id v4;
  QLSingleItemThumbnailGenerator *v5;
  QLSingleItemThumbnailGenerator *v6;
  QLSingleItemThumbnailGenerator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLSingleItemThumbnailGenerator;
  v5 = -[QLSingleItemThumbnailGenerator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    v7 = v6;
  }

  return v6;
}

- (QLItemThumbnailGenerator)thumbnailGenerator
{
  QLItemThumbnailGenerator *thumbnailGenerator;
  QLSingleItemThumbnailGenerator *v4;
  QLItemThumbnailGenerator *v5;
  QLItemThumbnailGenerator *v6;

  thumbnailGenerator = self->_thumbnailGenerator;
  if (!thumbnailGenerator)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_thumbnailGenerator)
    {
      v5 = (QLItemThumbnailGenerator *)objc_opt_new();
      v6 = self->_thumbnailGenerator;
      self->_thumbnailGenerator = v5;

    }
    objc_sync_exit(v4);

    thumbnailGenerator = self->_thumbnailGenerator;
  }
  return thumbnailGenerator;
}

- (void)_thumbnailVersionForItem:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "fpItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editedFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CD32F8]);
    objc_msgSend(v6, "editedFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFileURL:automaticallyGenerated:", v11, 1);

LABEL_5:
    v7[2](v7, v12);
    goto LABEL_6;
  }
  if (v8)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32F8]), "initWithFPItem:automaticallyGenerated:", v8, 1);
    goto LABEL_5;
  }
  objc_msgSend(v6, "fetcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urlForThumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32F8]), "initWithFileURL:automaticallyGenerated:", v13, 1);
    v7[2](v7, v14);

  }
  else
  {
    -[QLSingleItemThumbnailGenerator thumbnailGenerator](self, "thumbnailGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetcherClassesForPreviewItem:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__QLSingleItemThumbnailGenerator__thumbnailVersionForItem_completionBlock___block_invoke;
    v18[3] = &unk_1E9EFC118;
    v19 = v7;
    objc_msgSend(v12, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v16, v17, 0, v18);

  }
LABEL_6:

}

void __75__QLSingleItemThumbnailGenerator__thumbnailVersionForItem_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject **v17;
  NSObject **v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (NSObject **)MEMORY[0x1E0D83678];
    v10 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v19 = 138412290;
    v20 = v7;
    v11 = "Could not generate thumbnail because an error occurred while fetching the contents of the item: %@. #Thumbnail";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 12;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        v17 = (NSObject **)MEMORY[0x1E0D83678];
        QLSInitLogging();
        v15 = *v17;
      }
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      LOWORD(v19) = 0;
      v11 = "Could not get thumbnail version because no versions can be created for data and spotlight contents. #Thumbnail";
      v12 = v15;
      v13 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v16 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        v18 = (NSObject **)MEMORY[0x1E0D83678];
        QLSInitLogging();
        v16 = *v18;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      LOWORD(v19) = 0;
      v11 = "Could not get thumbnail version because content of the item is not supported. #Thumbnail";
      v12 = v16;
      v13 = OS_LOG_TYPE_ERROR;
    }
    v14 = 2;
LABEL_20:
    _os_log_impl(&dword_1D936E000, v12, v13, v11, (uint8_t *)&v19, v14);
LABEL_21:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
    goto LABEL_22;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32F8]), "initWithFileURL:automaticallyGenerated:", v5, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_22:
}

- (void)generateThumbnailWithSize:(CGSize)a3 completionBlock:(id)a4
{
  -[QLSingleItemThumbnailGenerator generateThumbnailWithSize:contentMode:completionBlock:](self, "generateThumbnailWithSize:contentMode:completionBlock:", 1, a4, a3.width, a3.height);
}

- (void)generateThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 completionBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  QLThumbnailVersion *v10;
  QLThumbnailRepresentation *v11;
  id WeakRetained;
  QLSingleItemThumbnailGenerator *v13;
  QLThumbnailRepresentation *v14;
  QLThumbnailVersion *v15;
  _QWORD v16[5];
  QLThumbnailRepresentation *v17;
  QLThumbnailVersion *v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  unint64_t v22;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (v9)
  {
    v10 = self->_version;
    v11 = self->_thumbnailRepresentation;
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    v13 = self;
    objc_sync_enter(v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__QLSingleItemThumbnailGenerator_generateThumbnailWithSize_contentMode_completionBlock___block_invoke;
    v16[3] = &unk_1E9EFC898;
    v16[4] = v13;
    v20 = width;
    v21 = height;
    v14 = v11;
    v17 = v14;
    v15 = v10;
    v18 = v15;
    v19 = v9;
    v22 = a4;
    -[QLSingleItemThumbnailGenerator _thumbnailVersionForItem:completionBlock:](v13, "_thumbnailVersionForItem:completionBlock:", WeakRetained, v16);

    objc_sync_exit(v13);
  }

}

void __88__QLSingleItemThumbnailGenerator_generateThumbnailWithSize_contentMode_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(double *)(v5 + 24) == *(double *)(a1 + 64) && *(double *)(v5 + 32) == *(double *)(a1 + 72);
  v12 = v3;
  v7 = 1;
  if (v6 && v3 && *(_QWORD *)(a1 + 40))
  {
    v8 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48));
    v4 = v12;
    v7 = v8 ^ 1;
  }
  v9 = *(void **)(a1 + 40);
  if (!v9)
    goto LABEL_13;
  if (!*(_QWORD *)(a1 + 48))
    v7 = 1;
  if ((v7 & 1) == 0)
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v9, "UIImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));

  }
  else
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_generateUncachedThumbnailWithSize:contentMode:thumbnailVersion:completionBlock:", *(_QWORD *)(a1 + 80), v4, *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }

}

- (void)_generateUncachedThumbnailWithSize:(CGSize)a3 contentMode:(unint64_t)a4 thumbnailVersion:(id)a5 completionBlock:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  double v25;
  double v26;

  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = a6;
  if (width >= height)
    v13 = height;
  else
    v13 = width;
  if (a4 == 2)
    v14 = v13;
  else
    v14 = 0.0;
  -[QLSingleItemThumbnailGenerator thumbnailGenerator](self, "thumbnailGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __114__QLSingleItemThumbnailGenerator__generateUncachedThumbnailWithSize_contentMode_thumbnailVersion_completionBlock___block_invoke;
  v22[3] = &unk_1E9EFC8C0;
  v25 = width;
  v26 = height;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v15, "generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:completionBlock:", WeakRetained, v22, width, height, v14, v19);

}

uint64_t __114__QLSingleItemThumbnailGenerator__generateUncachedThumbnailWithSize_contentMode_thumbnailVersion_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleThumbnailGenerationFinishedWithThumbnailRepresentation:size:version:clientCompletionBlock:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)genericIconWithSize:(CGSize)a3
{
  double height;
  double width;
  QLItem **p_item;
  id WeakRetained;
  uint64_t v7;
  double v8;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;

  height = a3.height;
  width = a3.width;
  p_item = &self->_item;
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v7 = objc_msgSend(WeakRetained, "previewItemType");

  if (v7 != 14)
  {
    v19 = (void *)MEMORY[0x1E0CA58C8];
    v20 = objc_loadWeakRetained((id *)p_item);
    objc_msgSend(v20, "previewItemContentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "documentProxyForName:type:MIMEType:", &stru_1E9EFCB88, v21, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (width == QLCGSizeFromQLItemThumbnailSize(0) && height == v22)
    {
      v23 = 13;
    }
    else
    {
      v11 = 0;
      if (width != QLCGSizeFromQLItemThumbnailSize(1) || height != v25)
        goto LABEL_18;
      v23 = 12;
    }
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v13, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    return v11;
  }
  if (width == QLCGSizeFromQLItemThumbnailSize(0) && height == v8)
  {
    v24 = (void *)MEMORY[0x1E0CEA638];
    v13 = objc_loadWeakRetained((id *)p_item);
    objc_msgSend(v13, "searchableItemApplicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v16 = v24;
    v17 = v14;
    v18 = 13;
    goto LABEL_13;
  }
  v11 = 0;
  if (width == QLCGSizeFromQLItemThumbnailSize(1) && height == v10)
  {
    v12 = (void *)MEMORY[0x1E0CEA638];
    v13 = objc_loadWeakRetained((id *)p_item);
    objc_msgSend(v13, "searchableItemApplicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v16 = v12;
    v17 = v14;
    v18 = 12;
LABEL_13:
    objc_msgSend(v16, "_applicationIconImageForBundleIdentifier:format:scale:", v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  return v11;
}

- (void)_handleThumbnailGenerationFinishedWithThumbnailRepresentation:(id)a3 size:(CGSize)a4 version:(id)a5 clientCompletionBlock:(id)a6
{
  double height;
  double width;
  QLThumbnailRepresentation *v11;
  QLThumbnailVersion *v12;
  void *v13;
  _BOOL8 v14;
  QLSingleItemThumbnailGenerator *v15;
  QLThumbnailRepresentation *thumbnailRepresentation;
  QLThumbnailRepresentation *v17;
  QLThumbnailVersion *version;
  void (**v19)(id, void *, _BOOL8);

  height = a4.height;
  width = a4.width;
  v11 = (QLThumbnailRepresentation *)a3;
  v12 = (QLThumbnailVersion *)a5;
  v19 = (void (**)(id, void *, _BOOL8))a6;
  -[QLThumbnailRepresentation UIImage](v11, "UIImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[QLThumbnailRepresentation type](v11, "type") != QLThumbnailRepresentationTypeIcon;
  if (!v13)
  {
    -[QLSingleItemThumbnailGenerator genericIconWithSize:](self, "genericIconWithSize:", width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  v15 = self;
  objc_sync_enter(v15);
  v15->_thumbnailSize.width = width;
  v15->_thumbnailSize.height = height;
  thumbnailRepresentation = v15->_thumbnailRepresentation;
  v15->_thumbnailRepresentation = v11;
  v17 = v11;

  version = v15->_version;
  v15->_version = v12;

  v15->_isRepresentative = v14;
  objc_sync_exit(v15);

  if (v19)
    v19[2](v19, v13, v14);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  QLItem **p_item;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_item = &self->_item;
  WeakRetained = objc_loadWeakRetained((id *)p_item);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_item);
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("generatorItem"));

  }
}

- (QLSingleItemThumbnailGenerator)initWithCoder:(id)a3
{
  id v4;
  QLSingleItemThumbnailGenerator *v5;
  void *v6;
  QLSingleItemThumbnailGenerator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLSingleItemThumbnailGenerator;
  v5 = -[QLSingleItemThumbnailGenerator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generatorItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_item, v6);

    v7 = v5;
  }

  return v5;
}

- (void)setThumbnailGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, a3);
}

- (QLItem)item
{
  return (QLItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_thumbnailRepresentation, 0);
}

@end
