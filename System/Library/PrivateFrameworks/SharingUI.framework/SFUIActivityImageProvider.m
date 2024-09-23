@implementation SFUIActivityImageProvider

- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7
{
  return -[SFUIActivityImageProvider requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:](self, "requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:", a3, a4, a5, 2, 0, a7);
}

- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 iconFormat:(int)a6 synchronous:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  SFUIActivityImageRequest *v23;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v27 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a8;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  sharing_ui_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_212728000, v17, OS_LOG_TYPE_DEFAULT, "request image for bundle identifier:%@", buf, 0xCu);
  }

  if (objc_msgSend(v14, "length"))
  {
    -[SFUIImageProvider imageCache](self, "imageCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      sharing_ui_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v19;
        _os_log_impl(&dword_212728000, v20, OS_LOG_TYPE_DEFAULT, "found cached image:%@", buf, 0xCu);
      }

      (*((void (**)(id, void *, _QWORD, _QWORD))v16 + 2))(v16, v19, 0, 0);
      LODWORD(v21) = 0;
    }
    else
    {
      v21 = -[SFUIImageProvider nextRequestID](self, "nextRequestID");
      v23 = -[SFUIActivityImageRequest initWithRequestID:identifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:]([SFUIActivityImageRequest alloc], "initWithRequestID:identifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:", v21, v14, a4, v15, v10, v9, v16);
      -[SFUIImageProvider scheduleImageRequest:](self, "scheduleImageRequest:", v23);

    }
  }
  else
  {
    sharing_ui_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SFUIActivityImageProvider requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:].cold.1(v22);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v16 + 2))(v16, 0, 0, 0);
    LODWORD(v21) = 0;
  }

  return v21;
}

- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 resultHandler:(id)a6
{
  return -[SFUIActivityImageProvider requestImageForActivity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:](self, "requestImageForActivity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:", a3, a4, a5, 0, a6);
}

- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  SFUIActivityImageRequest *v23;
  int v25;
  id v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v8 = a6;
  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "activityUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();

    sharing_ui_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_212728000, v18, OS_LOG_TYPE_DEFAULT, "requestImageForActivity:%@ identifier:%@", (uint8_t *)&v25, 0x16u);
    }

    -[SFUIImageProvider imageCache](self, "imageCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      sharing_ui_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v20;
        _os_log_impl(&dword_212728000, v21, OS_LOG_TYPE_DEFAULT, "found cached image:%@", (uint8_t *)&v25, 0xCu);
      }

      (*((void (**)(id, void *, _QWORD, _QWORD))v15 + 2))(v15, v20, 0, 0);
      LODWORD(v22) = 0;
    }
    else
    {
      v22 = -[SFUIImageProvider nextRequestID](self, "nextRequestID");
      v23 = -[SFUIActivityImageRequest initWithRequestID:activity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:]([SFUIActivityImageRequest alloc], "initWithRequestID:activity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:", v22, v12, v13, v14, v8, v15);
      -[SFUIImageProvider scheduleImageRequest:](self, "scheduleImageRequest:", v23);

    }
  }
  else
  {
    sharing_ui_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SFUIActivityImageProvider requestImageForActivity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:].cold.1((uint64_t)v12, v17);
    LODWORD(v22) = 0;
  }

  return v22;
}

- (void)performImageRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFUIActivityImageProvider.m"), 123, CFSTR("request is not a SFUIActivityImageRequest type."));

  }
  v12 = v5;
  objc_msgSend(v12, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageSymbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUIActivityImageProvider _fetchImageForActivity:contentSizeCategory:imageSymbolConfiguration:](self, "_fetchImageForActivity:contentSizeCategory:imageSymbolConfiguration:", v7, v8, v9);

  }
  else
  {
    objc_msgSend(v12, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "activityCategory");
    objc_msgSend(v12, "contentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUIActivityImageProvider _fetchBundleImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:](self, "_fetchBundleImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:", v7, v10, v8, objc_msgSend(v12, "iconFormat"));
  }

}

- (void)_fetchBundleImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 iconFormat:(int)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  char v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  id v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  sharing_ui_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412802;
    v31 = v10;
    v32 = 2048;
    v33 = a4;
    v34 = 2048;
    v35 = a6;
    _os_log_impl(&dword_212728000, v12, OS_LOG_TYPE_DEFAULT, "fetch bundle image for bundle identifier:%@ activityCategory:%ld iconFormat:%ld", (uint8_t *)&v30, 0x20u);
  }

  v13 = objc_alloc_init(MEMORY[0x24BE51AC0]);
  objc_msgSend(v13, "setSymbolSize:", 3);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  objc_msgSend(v13, "setScale:");

  v15 = a6 == 0;
  v16 = (id *)MEMORY[0x24BE51AF0];
  if (a6)
    v16 = (id *)MEMORY[0x24BE51AC8];
  v17 = *v16;
  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTemplateVariant:", a4 == 0);
  objc_msgSend(v18, "setDrawBorder:", v15);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v10);
  sharing_ui_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (a4)
      v21 = v18;
    else
      v21 = v13;
    v30 = 138412290;
    v31 = v21;
    _os_log_impl(&dword_212728000, v20, OS_LOG_TYPE_DEFAULT, "fetching fast image with descriptor:%@", (uint8_t *)&v30, 0xCu);
  }
  else if (a4)
  {
    v21 = v18;
  }
  else
  {
    v21 = v13;
  }

  objc_msgSend(v19, "imageForDescriptor:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!a4 && !v22)
  {
    sharing_ui_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v18;
      _os_log_impl(&dword_212728000, v24, OS_LOG_TYPE_DEFAULT, "fetching fast action image with image descriptor:%@", (uint8_t *)&v30, 0xCu);
    }

    objc_msgSend(v19, "imageForDescriptor:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = 0;
  else
    v25 = objc_msgSend(v23, "placeholder");
  if (a4)
    v26 = 0;
  else
    v26 = v25;
  if (v23 && (v26 & 1) == 0)
    -[SFUIActivityImageProvider _handleIconImage:bundleIdentifier:activityCategory:contentSizeCategory:placeholder:](self, "_handleIconImage:bundleIdentifier:activityCategory:contentSizeCategory:placeholder:", v23, v10, a4, v11, v25);
  if (v23)
    v27 = v25;
  else
    v27 = 1;
  if (v27 == 1)
  {
    sharing_ui_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v18;
      _os_log_impl(&dword_212728000, v28, OS_LOG_TYPE_DEFAULT, "fetching final image with descriptor:%@", (uint8_t *)&v30, 0xCu);
    }

    objc_msgSend(v19, "prepareImageForDescriptor:", v18);
    v29 = objc_claimAutoreleasedReturnValue();

    -[SFUIActivityImageProvider _handleIconImage:bundleIdentifier:activityCategory:contentSizeCategory:placeholder:](self, "_handleIconImage:bundleIdentifier:activityCategory:contentSizeCategory:placeholder:", v29, v10, a4, v11, 0);
    v23 = (void *)v29;
  }

}

- (void)_fetchImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "activityUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  sharing_ui_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SFUIActivityImageProvider _fetchImageForActivity:contentSizeCategory:imageSymbolConfiguration:].cold.1((uint64_t)v8, (uint64_t)v12, v13);

  if (objc_msgSend((id)objc_opt_class(), "activityCategory"))
    objc_msgSend(v8, "_activityImage");
  else
    -[SFUIActivityImageProvider _fetchActionImageForActivity:contentSizeCategory:imageSymbolConfiguration:](self, "_fetchActionImageForActivity:contentSizeCategory:imageSymbolConfiguration:", v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  v15 = v14;
  v16 = v12;
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __97__SFUIActivityImageProvider__fetchImageForActivity_contentSizeCategory_imageSymbolConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

- (id)_fetchActionImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "_systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v7, "_systemImageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_systemImageNamed:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "activityImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "symbolConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "activityImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "_wantsOriginalImageColor"))
    {
      v18 = (void *)MEMORY[0x24BE8F640];
      objc_msgSend(v7, "_activityImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_actionImageForActionRepresentationImage:contentSizeCategory:monochrome:", v12, v8, 0);
    }
    else
    {
      objc_msgSend(v7, "setContentSizeCategory:", v8);
      objc_msgSend(v7, "_actionImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithRenderingMode:", 2);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v14;
}

- (void)_handleIconImage:(id)a3 bundleIdentifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 placeholder:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _BYTE buf[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  sharing_ui_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v12;
    v26 = 2048;
    v27 = objc_msgSend(v12, "CGImage");
    v28 = 2112;
    v29 = v13;
    v30 = 2048;
    v31 = a5;
    _os_log_impl(&dword_212728000, v15, OS_LOG_TYPE_DEFAULT, "handle icon image:%@ CGImage:%p bundleIdentifier:%@ activityCategory:%ld", buf, 0x2Au);
  }

  v16 = (void *)MEMORY[0x24BEBD640];
  v17 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    sharing_ui_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_212728000, v19, OS_LOG_TYPE_DEFAULT, "render action image for image:%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE8F640], "_actionImageForActionRepresentationImage:contentSizeCategory:", v18, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "imageWithRenderingMode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v23, (id *)buf);
  v21 = v18;
  v22 = v13;
  v24 = a7;
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

void __112__SFUIActivityImageProvider__handleIconImage_bundleIdentifier_activityCategory_contentSizeCategory_placeholder___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);

}

- (void)requestImageForBundleIdentifier:(os_log_t)log activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212728000, log, OS_LOG_TYPE_ERROR, "bundle identifier is nil.", v1, 2u);
}

- (void)requestImageForActivity:(uint64_t)a1 contentSizeCategory:(NSObject *)a2 imageSymbolConfiguration:synchronous:resultHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_212728000, a2, OS_LOG_TYPE_ERROR, "request activity image for non-activity object:%@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchImageForActivity:(uint64_t)a1 contentSizeCategory:(uint64_t)a2 imageSymbolConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_212728000, log, OS_LOG_TYPE_DEBUG, "_fetchImageForActivity:%@ identifier:%@", (uint8_t *)&v3, 0x16u);
}

@end
