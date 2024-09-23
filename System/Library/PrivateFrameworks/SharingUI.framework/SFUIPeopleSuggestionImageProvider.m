@implementation SFUIPeopleSuggestionImageProvider

- (SFUIPeopleSuggestionImageProvider)initWithTargetSize:(CGSize)a3 layoutDirection:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  SFUIPeopleSuggestionImageProvider *v7;
  SFUIPeopleSuggestionImageProvider *v8;
  uint64_t v9;
  SFUIAvatarImageRenderer *imageRenderer;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *placeholderImageQueue;
  NSObject *v14;
  _QWORD block[4];
  SFUIPeopleSuggestionImageProvider *v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)SFUIPeopleSuggestionImageProvider;
  v7 = -[SFUIImageProvider init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_targetSize.width = width;
    v7->_targetSize.height = height;
    v7->_layoutDirection = a4;
    +[SFUIAvatarImageRenderer avatarImageRender](SFUIAvatarImageRenderer, "avatarImageRender");
    v9 = objc_claimAutoreleasedReturnValue();
    imageRenderer = v8->_imageRenderer;
    v8->_imageRenderer = (SFUIAvatarImageRenderer *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.SharingUI.SFUIPeopleSuggestionImageProvider.placeholderImageQueue", v11);
    placeholderImageQueue = v8->_placeholderImageQueue;
    v8->_placeholderImageQueue = (OS_dispatch_queue *)v12;

    v14 = v8->_placeholderImageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SFUIPeopleSuggestionImageProvider_initWithTargetSize_layoutDirection___block_invoke;
    block[3] = &unk_24CE0ED80;
    v17 = v8;
    dispatch_async(v14, block);

  }
  return v8;
}

uint64_t __72__SFUIPeopleSuggestionImageProvider_initWithTargetSize_layoutDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPlaceholderImage");
}

- (void)_processPlaceholderImage
{
  NSObject *v3;
  UIImage *v4;
  UIImage *processedPlaceholderImage;
  id v6;

  -[SFUIPeopleSuggestionImageProvider placeholderImageQueue](self, "placeholderImageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  avatarImageScale();
  -[SFUIPeopleSuggestionImageProvider imageRenderer](self, "imageRenderer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUIPeopleSuggestionImageProvider targetSize](self, "targetSize");
  objc_msgSend(v6, "placeholderImageForSize:scale:");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  processedPlaceholderImage = self->_processedPlaceholderImage;
  self->_processedPlaceholderImage = v4;

}

- (UIImage)placeholderImage
{
  UIImage **p_placeholderImage;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  UIImage *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  p_placeholderImage = &self->_placeholderImage;
  v14 = self->_placeholderImage;
  v4 = (void *)v10[5];
  if (!v4)
  {
    -[SFUIPeopleSuggestionImageProvider placeholderImageQueue](self, "placeholderImageQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__SFUIPeopleSuggestionImageProvider_placeholderImage__block_invoke;
    v8[3] = &unk_24CE0FE08;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);

    objc_storeStrong((id *)p_placeholderImage, (id)v10[5]);
    v4 = (void *)v10[5];
  }
  v6 = v4;
  _Block_object_dispose(&v9, 8);

  return (UIImage *)v6;
}

void __53__SFUIPeopleSuggestionImageProvider_placeholderImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "processedPlaceholderImage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)requestAvatarImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  SFUIPeopleSuggestionImageRequest *v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  people_ui_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:].cold.2();

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUIImageProvider imageCache](self, "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    people_ui_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:].cold.1();

    if (v7)
      (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v11, 0, 0);
    LODWORD(v13) = 0;
  }
  else
  {
    if (v7)
    {
      -[SFUIPeopleSuggestionImageProvider placeholderImage](self, "placeholderImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, uint64_t, _QWORD))v7 + 2))(v7, v14, 1, 0);

    }
    v13 = -[SFUIImageProvider nextRequestID](self, "nextRequestID");
    v15 = -[SFUIPeopleSuggestionImageRequest initWithRequestID:peopleSuggestion:type:resultHandler:]([SFUIPeopleSuggestionImageRequest alloc], "initWithRequestID:peopleSuggestion:type:resultHandler:", v13, v6, 0, v7);
    -[SFUIImageProvider scheduleImageRequest:](self, "scheduleImageRequest:", v15);

  }
  return v13;
}

- (int)requestTransportImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  SFUIPeopleSuggestionImageRequest *v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  people_ui_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SFUIPeopleSuggestionImageProvider requestTransportImageForPeopleSuggestion:resultHandler:].cold.2();

  objc_msgSend(v6, "transportBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUIImageProvider imageCache](self, "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    people_ui_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:].cold.1();

    if (v7)
      (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v11, 0, 0);
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = -[SFUIImageProvider nextRequestID](self, "nextRequestID");
    v14 = -[SFUIPeopleSuggestionImageRequest initWithRequestID:peopleSuggestion:type:resultHandler:]([SFUIPeopleSuggestionImageRequest alloc], "initWithRequestID:peopleSuggestion:type:resultHandler:", v13, v6, 1, v7);
    -[SFUIImageProvider scheduleImageRequest:](self, "scheduleImageRequest:", v14);

  }
  return v13;
}

- (void)updateTargetSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  id v9;

  height = a3.height;
  width = a3.width;
  -[SFUIPeopleSuggestionImageProvider targetSize](self, "targetSize");
  if (v7 != width || v6 != height)
  {
    self->_targetSize.width = width;
    self->_targetSize.height = height;
    -[SFUIImageProvider imageCache](self, "imageCache");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

  }
}

- (void)performImageRequest:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFUIPeopleSuggestionImageProvider.m"), 192, CFSTR("request is not a SFUIPeopleSuggestionImageRequest type."));

  }
  v9 = v5;
  objc_msgSend(v9, "peopleSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "type");
  if (v7 == 1)
  {
    -[SFUIPeopleSuggestionImageProvider _fetchTransportImageForPeopleSuggestion:](self, "_fetchTransportImageForPeopleSuggestion:", v6);
  }
  else if (!v7)
  {
    -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:](self, "_fetchAvatarImageForPeopleSuggestion:", v6);
  }

}

- (void)_fetchAvatarImageForPeopleSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  id v33;

  v4 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v4, "donatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "donatedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sharing_ui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:].cold.3();

    objc_msgSend(v6, "_imageData");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(getINImageServiceConnectionClass(), "sharedConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v15, "loadDataImageFromImage:scaledSize:error:", v6, &v33, getINImageDefaultScaledSize());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v33;

      if (v10)
      {
        people_ui_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:].cold.2();

        v9 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v11, "_imageData");
      v8 = objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 0;
        v9 = 0;
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = (void *)v8;
LABEL_12:

LABEL_13:
    goto LABEL_18;
  }
  objc_msgSend(v4, "deviceModelIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v4, "deviceModelIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SFDeviceImageFromDeviceModel(60.0, 60.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    people_ui_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:].cold.1();

    v18 = -[SFUIPeopleSuggestionImageProvider layoutDirection](self, "layoutDirection") == 1;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 4 * (objc_msgSend(v19, "userInterfaceIdiom") == 4);

    avatarImageScale();
    -[SFUIPeopleSuggestionImageProvider targetSize](self, "targetSize");
    +[SFUIAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:](SFUIAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", v18, 1, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUIPeopleSuggestionImageProvider imageRenderer](self, "imageRenderer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "avatarImageForContacts:scope:", v22, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
LABEL_18:
  location = 0;
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __74__SFUIPeopleSuggestionImageProvider__fetchAvatarImageForPeopleSuggestion___block_invoke;
  v27[3] = &unk_24CE0FE30;
  objc_copyWeak(&v31, &location);
  v28 = v9;
  v29 = v4;
  v30 = v10;
  v23 = v10;
  v24 = v4;
  v25 = v9;
  v26 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __74__SFUIPeopleSuggestionImageProvider__fetchAvatarImageForPeopleSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", v2, v3, 0, *(_QWORD *)(a1 + 48));

}

- (void)_fetchTransportImageForPeopleSuggestion:(id)a3
{
  id v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v5 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v5, "transportBundleIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[SFUIPeopleSuggestionImageProvider _fetchNoAppTransportImageForIdentifier:](self, "_fetchNoAppTransportImageForIdentifier:", v6))
  {
    v7 = -[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("com.apple.InCallService"));
    v8 = CFSTR("com.apple.facetime");
    if (!v7)
      v8 = v6;
    v9 = v8;
    objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v9);
    people_ui_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SFUIPeopleSuggestionImageProvider _fetchTransportImageForPeopleSuggestion:].cold.2();

    objc_msgSend(v11, "imageForDescriptor:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      && (-[SFUIPeopleSuggestionImageProvider _deliverIconImage:identifier:error:](self, "_deliverIconImage:identifier:error:", v13, v6, 0), !objc_msgSend(v13, "placeholder")))
    {
      v15 = v13;
    }
    else
    {
      people_ui_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SFUIPeopleSuggestionImageProvider _fetchTransportImageForPeopleSuggestion:].cold.1();

      objc_msgSend(v11, "prepareImageForDescriptor:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "placeholder"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFUIPeopleSuggestionImageProvider.m"), 290, CFSTR("final icon image is still a placeholder."));

      }
      -[SFUIPeopleSuggestionImageProvider _deliverIconImage:identifier:error:](self, "_deliverIconImage:identifier:error:", v15, v6, 0);
    }

  }
}

- (BOOL)_fetchNoAppTransportImageForIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (_fetchNoAppTransportImageForIdentifier__onceToken != -1)
    dispatch_once(&_fetchNoAppTransportImageForIdentifier__onceToken, &__block_literal_global_10);
  objc_msgSend((id)_fetchNoAppTransportImageForIdentifier__transportImagesForIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    location = 0;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __76__SFUIPeopleSuggestionImageProvider__fetchNoAppTransportImageForIdentifier___block_invoke_2;
    v7[3] = &unk_24CE0FC48;
    objc_copyWeak(&v10, &location);
    v8 = v5;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v5 != 0;
}

void __76__SFUIPeopleSuggestionImageProvider__fetchNoAppTransportImageForIdentifier___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v0 = objc_alloc_init(MEMORY[0x24BE8F670]);
  objc_msgSend(v0, "activityImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, CFSTR("com.apple.telephonyutilities.callservicesd"));
  v2 = objc_alloc_init(MEMORY[0x24BE8F658]);
  objc_msgSend(v2, "_activityImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE8F690]);
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)_fetchNoAppTransportImageForIdentifier__transportImagesForIdentifiers;
  _fetchNoAppTransportImageForIdentifier__transportImagesForIdentifiers = v4;

}

void __76__SFUIPeopleSuggestionImageProvider__fetchNoAppTransportImageForIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

- (void)_deliverIconImage:(id)a3 identifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BEBD640];
  v10 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v7, "scale");
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__SFUIPeopleSuggestionImageProvider__deliverIconImage_identifier_error___block_invoke;
  block[3] = &unk_24CE0FE30;
  objc_copyWeak(&v19, &location);
  v16 = v11;
  v17 = v8;
  v18 = v7;
  v12 = v7;
  v13 = v8;
  v14 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __72__SFUIPeopleSuggestionImageProvider__deliverIconImage_identifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "placeholder"), 0);

}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (SFUIAvatarImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (OS_dispatch_queue)placeholderImageQueue
{
  return self->_placeholderImageQueue;
}

- (UIImage)processedPlaceholderImage
{
  return self->_processedPlaceholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderImageQueue, 0);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
}

- (void)requestAvatarImageForPeopleSuggestion:resultHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "cached image found for people suggestion:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)requestAvatarImageForPeopleSuggestion:resultHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "request avatar image for people suggestion:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)requestTransportImageForPeopleSuggestion:resultHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "request transport image for people suggestion:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "rendering avatar image for people suggestion:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_212728000, v0, OS_LOG_TYPE_ERROR, "Could not fetch donated image: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "fetching donated image for people suggestion:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchTransportImageForPeopleSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_212728000, v0, v1, "fetching final image with descriptor:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchTransportImageForPeopleSuggestion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_212728000, v1, OS_LOG_TYPE_DEBUG, "fetching fast image with descriptor:%@ identifier:%@", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
