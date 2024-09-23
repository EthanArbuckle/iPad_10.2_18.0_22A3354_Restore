@implementation QLDataFetcher

- (QLDataFetcher)initWithItem:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  QLDataFetcher *v8;
  QLDataFetcher *v9;
  id WeakRetained;
  uint64_t v11;
  NSString *previewItemTitle;
  QLDataFetcher *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)QLDataFetcher;
  v8 = -[QLItemFetcher init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    objc_storeStrong((id *)&v9->_contentType, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_item);
    objc_msgSend(WeakRetained, "previewItemTitle");
    v11 = objc_claimAutoreleasedReturnValue();
    previewItemTitle = v9->_previewItemTitle;
    v9->_previewItemTitle = (NSString *)v11;

    v13 = v9;
  }

  return v9;
}

- (QLDataFetcher)initWithData:(id)a3 contentType:(id)a4 previewItemTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  QLDataFetcher *v12;
  QLDataFetcher *v13;
  QLDataFetcher *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)QLDataFetcher;
  v12 = -[QLItemFetcher init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v13->_contentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    v14 = v13;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[QLDataFetcher _deleteTempraryFileIfNeeded](self, "_deleteTempraryFileIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)QLDataFetcher;
  -[QLDataFetcher dealloc](&v3, sel_dealloc);
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v9 = a3;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__QLDataFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v13[3] = &unk_1E9EFC1C8;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a4, "addOperationWithBlock:", v13);

}

void __90__QLDataFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1)
{
  void (*v2)(void);
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "loadDataIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_opt_class()))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFetchingState:", 1);
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_7:
    v2();
    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_opt_class()))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_createTemporaryFileIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFetchingState:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.fetcher.data"), 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (id)itemSize
{
  NSData *data;
  void *v3;

  data = self->_data;
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](data, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &unk_1E9F080A8;
  }
  return v3;
}

- (id)_createTemporaryFileIfNeeded
{
  NSURL **p_temporaryURL;
  NSURL *temporaryURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject **v17;
  NSObject *v18;
  NSURL *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSData *data;
  id v24;
  NSObject **v25;
  NSObject *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_temporaryURL = &self->_temporaryURL;
  temporaryURL = self->_temporaryURL;
  if (temporaryURL)
    return temporaryURL;
  -[QLDataFetcher loadDataIfNeeded](self, "loadDataIfNeeded");
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  LODWORD(v9) = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v28);
  v14 = v28;

  if (!(_DWORD)v9 || v14)
  {
    v17 = (NSObject **)MEMORY[0x1E0D83678];
    v18 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v18 = *v17;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1D936E000, v18, OS_LOG_TYPE_ERROR, "Could not create temporary folder for data item with error: %@ #PreviewItem", buf, 0xCu);
    }
    v19 = 0;
  }
  else
  {
    if (self->_contentType)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredFilenameExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    -[QLDataFetcher _temporaryFilename](self, "_temporaryFilename");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21, "URLByAppendingPathExtension:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    data = self->_data;
    v27 = 0;
    LOBYTE(v21) = -[NSData writeToURL:options:error:](data, "writeToURL:options:error:", v22, 1, &v27);
    v24 = v27;
    if ((v21 & 1) != 0)
    {
      objc_storeStrong((id *)p_temporaryURL, v22);
      v19 = *p_temporaryURL;
    }
    else
    {
      v25 = (NSObject **)MEMORY[0x1E0D83678];
      v26 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v26 = *v25;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v24;
        _os_log_impl(&dword_1D936E000, v26, OS_LOG_TYPE_ERROR, "Writting data on disk failed with error: %@ #PreviewItem", buf, 0xCu);
      }
      v19 = 0;
    }

  }
  return v19;
}

- (void)_deleteTempraryFileIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  NSURL *temporaryURL;
  char v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  NSURL *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_temporaryURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_temporaryURL, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      temporaryURL = self->_temporaryURL;
      v12 = 0;
      v7 = objc_msgSend(v3, "removeItemAtURL:error:", temporaryURL, &v12);
      v8 = v12;
      if ((v7 & 1) == 0)
      {
        v9 = (NSObject **)MEMORY[0x1E0D83678];
        v10 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          QLSInitLogging();
          v10 = *v9;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v8;
          _os_log_impl(&dword_1D936E000, v10, OS_LOG_TYPE_ERROR, "Could not delete temporary folder for data item with error: %@ #PreviewItem", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
    }
    v11 = self->_temporaryURL;
    self->_temporaryURL = 0;

LABEL_10:
  }
}

- (id)_temporaryFilename
{
  NSString *previewItemTitle;
  NSString *v4;

  previewItemTitle = self->_previewItemTitle;
  if (previewItemTitle && -[NSString length](previewItemTitle, "length"))
  {
    v4 = self->_previewItemTitle;
  }
  else
  {
    QLLocalizedString(CFSTR("asset"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)shareableItem
{
  void *temporaryURL;

  temporaryURL = self->_temporaryURL;
  if (!temporaryURL)
    temporaryURL = self->_data;
  return temporaryURL;
}

- (void)prepareShareableItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[QLDataFetcher _createTemporaryFileIfNeeded](self, "_createTemporaryFileIfNeeded");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (id)fetchedContent
{
  id v3;
  void *temporaryURL;

  v3 = -[QLItemFetcher fetchingState](self, "fetchingState");
  if (v3)
  {
    temporaryURL = self->_temporaryURL;
    if (!temporaryURL)
    {
      -[QLDataFetcher loadDataIfNeeded](self, "loadDataIfNeeded");
      temporaryURL = self->_data;
    }
    v3 = temporaryURL;
  }
  return v3;
}

- (void)loadDataIfNeeded
{
  QLItem **p_item;
  void *v4;
  id v5;
  NSData *v6;
  NSData *data;
  id WeakRetained;

  if (!self->_data)
  {
    p_item = &self->_item;
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    objc_msgSend(WeakRetained, "previewItemDataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)p_item);
    objc_msgSend(v4, "provideDataForItem:", v5);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v6;

  }
}

- (id)newItemProvider
{
  void *v3;
  void *v4;
  NSString *contentType;
  id *v6;
  NSString *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new();
  -[QLDataFetcher shareableItem](self, "shareableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    contentType = self->_contentType;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__QLDataFetcher_newItemProvider__block_invoke;
    v12[3] = &unk_1E9EFC140;
    v6 = &v13;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", contentType, 0, 0, v12);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = self->_contentType;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__QLDataFetcher_newItemProvider__block_invoke_2;
    v10[3] = &unk_1E9EFC1F0;
    v6 = &v11;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, v10);
  }
  objc_destroyWeak(v6);
  v8 = v3;
LABEL_7:

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __32__QLDataFetcher_newItemProvider__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "shareableItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, _QWORD))a2)[2](v4, v6, 1, 0);

  return 0;
}

uint64_t __32__QLDataFetcher_newItemProvider__block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "shareableItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v6, 0);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLDataFetcher;
  v4 = a3;
  -[QLItemFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[QLDataFetcher loadDataIfNeeded](self, "loadDataIfNeeded", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentType, CFSTR("contentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previewItemTitle, CFSTR("previewItemTitle"));

}

- (QLDataFetcher)initWithCoder:(id)a3
{
  id v4;
  QLDataFetcher *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *contentType;
  uint64_t v10;
  NSString *previewItemTitle;
  QLDataFetcher *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLDataFetcher;
  v5 = -[QLItemFetcher initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewItemTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    previewItemTitle = v5->_previewItemTitle;
    v5->_previewItemTitle = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_temporaryURL, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
