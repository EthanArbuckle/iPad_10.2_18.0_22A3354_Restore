@implementation ImageFileLoader

- (id)cardLoader
{
  return 0;
}

- (id)moreResultsLoader
{
  return 0;
}

- (BOOL)canLoadImage:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "source"))
  {
    objc_msgSend(v6, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v8 = 1;
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ImageFileLoader urlForImage:context:](self, "urlForImage:context:", v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v11, "scheme");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "hasPrefix:", CFSTR("file"));

        goto LABEL_5;
      }
    }
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (void)loadImage:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  void (**v18)(id, id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  objc_msgSend(v8, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v10[2](v10, v8, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ImageFileLoader urlForImage:context:](self, "urlForImage:context:", v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__ImageFileLoader_SFImageResourceLoader__loadImage_context_completionHandler___block_invoke;
    block[3] = &unk_1E40418F0;
    v16 = v12;
    v17 = v8;
    v18 = v10;
    v14 = v12;
    dispatch_async(v13, block);

  }
}

- (id)urlForImage:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "darkUrlValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasDarkAppearance");

  if (v8 && v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "urlValue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v7;
    v9 = v12;

  }
  return v9;
}

void __78__ImageFileLoader_SFImageResourceLoader__loadImage_context_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:options:error:", v3, 1, &v7);
  v5 = v7;
  if (!v4)
  {
    if (PARLogHandleForCategory_onceToken_63033 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_63033, &__block_literal_global_105);
    v6 = PARLogHandleForCategory_logHandles_1_63034;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_63034, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_19E535000, v6, OS_LOG_TYPE_ERROR, "-[ImageFileLoader loadImage:withCompletionHandler:] error: %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setImageData:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
