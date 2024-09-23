@implementation WBSStartPageBackgroundManager

uint64_t __64__WBSStartPageBackgroundManager_loadImageFromDiskForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageFromDiskForIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)_loadImageFromDiskForIdentifier:(id)a3
{
  id v4;
  void *v5;
  const __CFURL *v6;
  CGImageSource *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *internalQueue;
  const __CFURL *v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  CGImageSource *v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  const __CFURL *v26;
  id v27;

  v4 = a3;
  if ((-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v4)|| -[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v4))&& objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_startPageBackgroundImageFileURLForIdentifier:", v4);
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    v7 = CGImageSourceCreateWithURL(v6, 0);
    if (!v7)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke;
      v25[3] = &unk_1E5441410;
      v25[4] = self;
      v26 = v6;
      v27 = v4;
      v14 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v25);

      goto LABEL_16;
    }

    v8 = 1;
  }
  else
  {
    v7 = CGImageSourceCreateWithURL((CFURLRef)self->_imageURL, 0);
    if (!v7)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_2;
      v24[3] = &unk_1E54425B0;
      v24[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v24);
      goto LABEL_16;
    }
    v8 = 0;
  }
  -[WBSStartPageBackgroundManager _readImagePropertiesFromImageSource:forImageIdentifier:isNonGlobalBackgroundImage:](self, "_readImagePropertiesFromImageSource:forImageIdentifier:isNonGlobalBackgroundImage:", v7, v4, v8);
  objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(v7, 0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerForKey:", *MEMORY[0x1E0D8A430]);

  v23 = v11;
  if (v21[3] == 1)
    v12 = 1;
  else
    v12 = 2;
  v21[3] = v12;
  if (v9)
    -[WBSStartPageBackgroundManager _setImageOnAnyQueue:withAppearance:forIdentifier:](self, "_setImageOnAnyQueue:withAppearance:forIdentifier:", v9);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_3;
  block[3] = &unk_1E54464A0;
  v19 = v8;
  v17 = &v20;
  v18 = v7;
  block[4] = self;
  v16 = v4;
  dispatch_async(internalQueue, block);

  _Block_object_dispose(&v20, 8);
LABEL_16:

}

- (BOOL)hasTabGroupSpecificBackgroundImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0D8A6A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v3);
  return (char)v4;
}

- (BOOL)hasProfileSpecificBackgroundImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0D8A548]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v3);
  return (char)v4;
}

- (id)imageForIdentifier:(id)a3 forProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  BOOL v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WBSCGImage *v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "kind") == 1)
  {
    objc_msgSend(v8, "settingForKey:", *MEMORY[0x1E0D8A628]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D8A628]);
  }
  v11 = v10;

  if ((v11 & 1) != 0)
  {
    if (objc_msgSend(v6, "length")
      && (-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v6)|| -[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v6)|| (objc_msgSend(v8, "identifier"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = -[WBSStartPageBackgroundManager _tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:](self, "_tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:", v6, v12), v12, v13)))
    {
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[WBSStartPageBackgroundManager _tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:](self, "_tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:", v6, v14);

      if (v15)
      {
        objc_msgSend(v8, "identifier");
        v16 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v16;
      }
      v17 = (void *)MEMORY[0x1E0D8A0C0];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToImage, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageWithCGImage:", v18);
      v19 = (WBSCGImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = self->_image;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __47__WBSStartPageBackgroundManager_defaultManager__block_invoke()
{
  WBSStartPageBackgroundManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [WBSStartPageBackgroundManager alloc];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[WBSStartPageBackgroundManager initWithImageURL:](v0, "initWithImageURL:", v1);
  v3 = (void *)+[WBSStartPageBackgroundManager defaultManager]::instance;
  +[WBSStartPageBackgroundManager defaultManager]::instance = v2;

}

- (void)getHasGeneratedBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *internalQueue;
  _QWORD block[4];
  id v18;
  WBSStartPageBackgroundManager *v19;
  void (**v20)(id, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if (-[WBSStartPageBackgroundManager _tabGroupShouldUseGlobalBackgroundImage:forProfileWithIdentifier:](self, "_tabGroupShouldUseGlobalBackgroundImage:forProfileWithIdentifier:", v8, v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[WBSStartPageBackgroundManager _tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:](self, "_tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:", v8, v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForIdentifier:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForIdentifier:", v8);
    }
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_imageURLToTileRequired, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v10)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_imageURLToTileRequired, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, objc_msgSend(v15, "BOOLValue"));

    }
  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E5441AD8;
    v18 = v13;
    v19 = self;
    v20 = v10;
    dispatch_async(internalQueue, block);

  }
}

- (BOOL)_tabGroupShouldUseGlobalBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8A2D8]))
      v8 = !-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v6);
    else
      LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (WBSStartPageBackgroundManager)initWithImageURL:(id)a3
{
  id v5;
  WBSStartPageBackgroundManager *v6;
  uint64_t v7;
  NSMutableDictionary *backgroundImageIdentifierToImage;
  uint64_t v9;
  NSMutableDictionary *backgroundImageIdentifierToLuminance;
  uint64_t v11;
  NSMutableDictionary *imageURLToTileRequired;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *imageReadWriteQueue;
  NSObject *v19;
  WBSStartPageBackgroundManager *v20;
  WBSStartPageBackgroundManager *v21;
  _QWORD block[4];
  WBSStartPageBackgroundManager *v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSStartPageBackgroundManager;
  v6 = -[WBSStartPageBackgroundManager init](&v25, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundImageIdentifierToImage = v6->_backgroundImageIdentifierToImage;
    v6->_backgroundImageIdentifierToImage = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundImageIdentifierToLuminance = v6->_backgroundImageIdentifierToLuminance;
    v6->_backgroundImageIdentifierToLuminance = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    imageURLToTileRequired = v6->_imageURLToTileRequired;
    v6->_imageURLToTileRequired = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v6->_imageURL, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.Safari.StartPageBackgroundManager.ThumbnailLoadingQueue", v13);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.Safari.StartPageBackgroundManager", v16);
    imageReadWriteQueue = v6->_imageReadWriteQueue;
    v6->_imageReadWriteQueue = (OS_dispatch_queue *)v17;

    v19 = v6->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__WBSStartPageBackgroundManager_initWithImageURL___block_invoke;
    block[3] = &unk_1E54425B0;
    v20 = v6;
    v24 = v20;
    dispatch_async(v19, block);
    v21 = v20;

  }
  return v6;
}

+ (void)warmUp
{
  id v2;

  v2 = +[WBSStartPageBackgroundManager defaultManager](WBSStartPageBackgroundManager, "defaultManager");
}

+ (WBSStartPageBackgroundManager)defaultManager
{
  if (+[WBSStartPageBackgroundManager defaultManager]::once != -1)
    dispatch_once(&+[WBSStartPageBackgroundManager defaultManager]::once, &__block_literal_global_40);
  return (WBSStartPageBackgroundManager *)(id)+[WBSStartPageBackgroundManager defaultManager]::instance;
}

uint64_t __50__WBSStartPageBackgroundManager_initWithImageURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageFromDiskForIdentifier:", &stru_1E5449658);
}

- (BOOL)isCorrectBackgroundImageLoadedForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  WBSCGImage *image;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  image = self->_image;
  if (v5)
  {
    if (!image
      || -[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v4)|| -[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v4))
    {
      goto LABEL_5;
    }
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  if (image)
    goto LABEL_7;
LABEL_5:
  v7 = (void *)MEMORY[0x1E0D8A0C0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToImage, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithCGImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9 != 0;
LABEL_8:

  return v10;
}

uint64_t __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56));
  return result;
}

- (void)loadImageFromDiskForIdentifier:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSStartPageBackgroundManager_loadImageFromDiskForIdentifier___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  CGImageSourceRef v2;
  CGImageSourceRef v3;
  char v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;
  char v10;

  v2 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 40), "_isGeneratedBackgroundImageInImageSource:", v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E5446608;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v10 = v4;
  v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)reloadTabGroupSpecificBackgroundImageFromDisk:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__WBSStartPageBackgroundManager_reloadTabGroupSpecificBackgroundImageFromDisk___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __79__WBSStartPageBackgroundManager_reloadTabGroupSpecificBackgroundImageFromDisk___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageFromDiskForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)reloadProfileSpecificBackgroundImageFromDisk:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSStartPageBackgroundManager_reloadProfileSpecificBackgroundImageFromDisk___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __78__WBSStartPageBackgroundManager_reloadProfileSpecificBackgroundImageFromDisk___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageFromDiskForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (id)presetIconColorForSymbol:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  {
    objc_msgSend(MEMORY[0x1E0D8A0F8], "orderedProfileColorOptions");
    -[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors = objc_claimAutoreleasedReturnValue();
  }
  if (-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::onceToken != -1)
    dispatch_once(&-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::onceToken, &__block_literal_global_53);
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __58__WBSStartPageBackgroundManager_presetIconColorForSymbol___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("person.lanyardcard.fill");
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors, "objectAtIndexedSubscript:", 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("graduationcap.fill");
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors, "objectAtIndexedSubscript:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("bag.fill");
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors, "objectAtIndexedSubscript:", 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("hammer.fill");
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors, "objectAtIndexedSubscript:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("building.2.fill");
  objc_msgSend((id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors, "objectAtIndexedSubscript:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors;
  -[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors = v5;

}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(id)a3 forProfile:(id)a4 withColor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  __CFString *v56;
  CGImageDestination *v57;
  const __CFURL *v58;
  NSObject *v59;
  const __CFURL *url;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  v67 = v11;
  if (v10 && v11)
  {
    v15 = -[WBSStartPageBackgroundManager _generatedImageScaleWithSymbol:](self, "_generatedImageScaleWithSymbol:", v10);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, v15, 30.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "imageWithSymbolConfiguration:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "size");
    v17 = v16;
    v19 = v18;
    if (v12 && (objc_msgSend(v12, "isClearColor") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithWBSNamedColorOption:", v12);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithRGBColorComponents:", &unk_1E547C228);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
    -[WBSStartPageBackgroundManager _iconOpacityForBackgroundColor:forDarkIcon:](self, "_iconOpacityForBackgroundColor:forDarkIcon:", v20, 0);
    v23 = v22;
    -[WBSStartPageBackgroundManager _iconOpacityForBackgroundColor:forDarkIcon:](self, "_iconOpacityForBackgroundColor:forDarkIcon:", v21, 1);
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0CEA478];
    if (v12)
      v27 = objc_msgSend(v12, "isClearColor") ^ 1;
    else
      v27 = 0;
    objc_msgSend(v26, "colorWithWhite:alpha:", (double)v27, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSStartPageBackgroundManager _templateImageWithImage:color:](self, "_templateImageWithImage:color:", v66, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CEA478];
    if (v12)
      v31 = objc_msgSend(v12, "isClearColor") ^ 1;
    else
      v31 = 0;
    objc_msgSend(v30, "colorWithWhite:alpha:", (double)v31, v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSStartPageBackgroundManager _templateImageWithImage:color:](self, "_templateImageWithImage:color:", v66, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CEA638];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke_2;
    v69[3] = &unk_1E5446450;
    v35 = v21;
    v74 = xmmword_1A84E3710;
    v75 = xmmword_1A84E36C0;
    v70 = v35;
    v73 = &__block_literal_global_67;
    v76 = v17;
    v77 = v19;
    v78 = xmmword_1A84E36D0;
    v36 = v29;
    v71 = v36;
    v79 = xmmword_1A84E36E0;
    v80 = xmmword_1A84E36F0;
    v81 = xmmword_1A84E3700;
    v63 = v33;
    v72 = v63;
    objc_msgSend(v34, "safari_imageWithSize:flipped:actions:", 0, v69, 240.0, 320.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "safari_startPageBackgroundImageFolderURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "path");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v38, "fileExistsAtPath:", v40);

      if ((v41 & 1) == 0
        && (objc_msgSend(v38, "safari_startPageBackgroundImageFolderURL"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v38, "safari_ensureDirectoryExists:", v42),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = v43 == 0,
            v43,
            v42,
            v44))
      {
        v14[2](v14, 0);
      }
      else
      {
        objc_msgSend(v38, "safari_startPageBackgroundImageFileURLForIdentifier:", v67);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        objc_msgSend(v38, "safari_createTemporaryDirectoryAppropriateForURL:error:", v45, &v68);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v68;

        if (v62)
        {
          v46 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v62, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:].cold.3();
          }

          v14[2](v14, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GeneratedProfileBackground.png"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "URLByAppendingPathComponent:", v55);
          url = (const __CFURL *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v57 = CGImageDestinationCreateWithURL(url, v56, 1uLL, 0);

          CGImageDestinationAddImage(v57, (CGImageRef)objc_msgSend(objc_retainAutorelease(v37), "CGImage"), 0);
          if (CGImageDestinationFinalize(v57))
          {
            CFRelease(v57);
            v58 = url;
          }
          else
          {
            v59 = WBS_LOG_CHANNEL_PREFIXStartPage();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:].cold.2((uint64_t)url, v59);
            CFRelease(v57);
            v58 = 0;
          }
          ((void (**)(_QWORD, const __CFURL *))v14)[2](v14, v58);

        }
      }

    }
    else
    {
      v47 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:].cold.1(v47, v48, v49, v50, v51, v52, v53, v54);
      v14[2](v14, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

double __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke(double a1, double a2, double a3)
{
  return a3 - a1 * 0.5;
}

void __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke_2(uint64_t a1, CGContext *a2)
{
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGImage *v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGImage *v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGImage *v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGImage *v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGImage *v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGImage *v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGImage *v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGImage *v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  CGContextFillRect(a2, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(a2, kCGBlendModeNormal);
  v4 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "CGImage");
  v68.origin.x = v4;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  CGContextDrawImage(a2, v68, v11);
  v12 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 128), *(double *)(a1 + 136));
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "CGImage");
  v69.origin.x = v12;
  v69.origin.y = v14;
  v69.size.width = v16;
  v69.size.height = v18;
  CGContextDrawImage(a2, v69, v19);
  v20 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 144), *(double *)(a1 + 152));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "CGImage");
  v70.origin.x = v20;
  v70.origin.y = v22;
  v70.size.width = v24;
  v70.size.height = v26;
  CGContextDrawImage(a2, v70, v27);
  v28 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 160), *(double *)(a1 + 168));
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "CGImage");
  v71.origin.x = v28;
  v71.origin.y = v30;
  v71.size.width = v32;
  v71.size.height = v34;
  CGContextDrawImage(a2, v71, v35);
  v36 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 152));
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v43 = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
  v72.origin.x = v36;
  v72.origin.y = v38;
  v72.size.width = v40;
  v72.size.height = v42;
  CGContextDrawImage(a2, v72, v43);
  v44 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 128), *(double *)(a1 + 168));
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v51 = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
  v73.origin.x = v44;
  v73.origin.y = v46;
  v73.size.width = v48;
  v73.size.height = v50;
  CGContextDrawImage(a2, v73, v51);
  v52 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 144), *(double *)(a1 + 120));
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v59 = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
  v74.origin.x = v52;
  v74.origin.y = v54;
  v74.size.width = v56;
  v74.size.height = v58;
  CGContextDrawImage(a2, v74, v59);
  v60 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 160), *(double *)(a1 + 136));
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v67 = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
  v75.origin.x = v60;
  v75.origin.y = v62;
  v75.size.width = v64;
  v75.size.height = v66;
  CGContextDrawImage(a2, v75, v67);
}

- (double)_iconOpacityForBackgroundColor:(id)a3 forDarkIcon:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  BOOL v11;
  double v12;
  int v13;
  int v14;
  double v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.91, 0.95, 0.56, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithRGBColorComponents:", &unk_1E547C240);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = objc_msgSend(v5, "isEqual:", v6);
    v9 = objc_msgSend(v5, "isEqual:", v7);
    v10 = 0.1;
    if (v8)
      v10 = 0.3;
    v11 = v9 == 0;
    v12 = 0.05;
  }
  else
  {
    v13 = objc_msgSend(v5, "isEqual:", v6);
    v14 = objc_msgSend(v5, "isEqual:", v7);
    v10 = 0.2;
    if (v13)
      v10 = 0.5;
    v11 = v14 == 0;
    v12 = 0.02;
  }
  if (v11)
    v15 = v10;
  else
    v15 = v12;

  return v15;
}

- (int64_t)_generatedImageScaleWithSymbol:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bicycle")))
    return 2;
  else
    return 3;
}

- (id)_templateImageWithImage:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, CGContext *);
  void *v22;
  id v23;
  id v24;
  double v25;
  double v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "size");
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0CEA638];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __63__WBSStartPageBackgroundManager__templateImageWithImage_color___block_invoke;
  v22 = &unk_1E5446478;
  v12 = v6;
  v23 = v12;
  v25 = v8;
  v26 = v10;
  v13 = v5;
  v24 = v13;
  objc_msgSend(v11, "safari_imageWithSize:flipped:actions:", 0, &v19, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D8A0C0];
  v16 = objc_retainAutorelease(v14);
  objc_msgSend(v15, "imageWithCGImage:", objc_msgSend(v16, "CGImage", v19, v20, v21, v22));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __63__WBSStartPageBackgroundManager__templateImageWithImage_color___block_invoke(uint64_t a1, CGContext *a2)
{
  CGFloat v4;
  CGFloat v5;
  CGImage *v6;
  CGRect v7;
  CGRect v8;

  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v7.size.width = *(CGFloat *)(a1 + 48);
  v7.size.height = *(CGFloat *)(a1 + 56);
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  CGContextFillRect(a2, v7);
  CGContextSetBlendMode(a2, kCGBlendModeDestinationIn);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = v4;
  v8.size.height = v5;
  CGContextDrawImage(a2, v8, v6);
}

void __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKeyedSubscript:", 0, a1[5]);
  objc_msgSend(*(id *)(a1[4] + 88), "setObject:forKeyedSubscript:", 0, a1[6]);
  objc_msgSend(*(id *)(a1[4] + 96), "setObject:forKeyedSubscript:", 0, a1[6]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("StartPageBackgroundImageDidChangeNotification"), a1[4]);

}

void __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  char v5;
  int v6;
  int v7;
  double v8;
  char v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(*(CGImageSourceRef *)(a1 + 56), 0, 0));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("StartPagePopoverUsesDefaultBackground"));
  v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DidRecomputeStartPageAppearanceAfterFixes"));
  v5 = v4;
  v6 = *(unsigned __int8 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 64))
    v7 = 1;
  else
    v7 = v3;
  if (((v7 | v4) & 1) == 0)
  {
    v8 = WBSComputeAverageLuminance((CGImage *)objc_msgSend(v10, "CGImage"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = appearanceNameForLuminance(v8);
    objc_msgSend(v2, "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *MEMORY[0x1E0D8A430]);
    v6 = *(unsigned __int8 *)(a1 + 64);
  }
  if (v6)
    v9 = 1;
  else
    v9 = v5;
  if ((v9 & 1) == 0)
    objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("DidRecomputeStartPageAppearanceAfterFixes"));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_setImage:withAppearance:forIdentifier:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40));

}

- (void)_setExtendedAttributesOnBackgroundImage
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to set iCloud backup exclusion for Safari's background image: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_readImagePropertiesFromImageSource:(CGImageSource *)a3 forImageIdentifier:(id)a4 isNonGlobalBackgroundImage:(BOOL)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  CGImageSource *v13;
  BOOL v14;

  v8 = a4;
  CFRetain(a3);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke;
  v11[3] = &unk_1E54464F0;
  v12 = v8;
  v13 = a3;
  v14 = a5;
  v11[4] = self;
  v10 = v8;
  dispatch_async(internalQueue, v11);

}

void __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2;
  const CGImageMetadata *v3;
  const CGImageMetadata *v4;
  CGImageMetadataTag *v5;
  CGImageMetadataTag *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  _QWORD v19[5];
  id v20;
  char v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;

  v2 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, 0);
  v3 = CGImageSourceCopyMetadataAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, 0);
  v4 = v3;
  if (v3)
  {
    v5 = CGImageMetadataCopyTagWithPath(v3, 0, CFSTR("safari:fileName"));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)CGImageMetadataTagCopyValue(v5);
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v4);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, *MEMORY[0x1E0D8A438]);

    }
  }
  else
  {
    v7 = 0;
  }
  v9 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_11;
  -[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCB0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_2;
  block[3] = &unk_1E5441410;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_startPageBackgroundImageFileURLForIdentifier:", *(_QWORD *)(a1 + 40));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_11:
    v16 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  }
  v17 = objc_msgSend(*(id *)(a1 + 32), "_isGeneratedBackgroundImageInImageSource:", *(_QWORD *)(a1 + 48));
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_3;
  v19[3] = &unk_1E54464C8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v18 = v16;
  v20 = v18;
  v21 = v17;
  dispatch_async(MEMORY[0x1E0C80D38], v19);
  CFRelease(*(CFTypeRef *)(a1 + 48));

}

_QWORD *__115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (v1)
    return (_QWORD *)objc_msgSend(*(id *)(result[5] + 96), "setObject:forKeyedSubscript:", v1, result[6]);
  return result;
}

void __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:");

}

- (void)_setImageOnAnyQueue:(id)a3 withAppearance:(int64_t)a4 forIdentifier:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  int64_t v16;
  NSURL *v17;
  BOOL v18;
  NSURL *v19;
  void *v20;
  _QWORD v21[4];
  NSURL *v22;
  WBSStartPageBackgroundManager *v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[5];
  NSURL *v27;
  _QWORD block[5];
  id v29;
  id v30;

  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "length");
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke;
    block[3] = &unk_1E5441410;
    block[4] = self;
    v29 = v10;
    v30 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_storeStrong((id *)&self->_image, a3);
  }
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_startPageBackgroundImageFileURLForIdentifier:", v10);
    v14 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = self->_imageURL;
  }
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_2;
  v26[3] = &unk_1E54413C0;
  v26[4] = self;
  v15 = v14;
  v27 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v26);
  if (!objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v9, "CGImage"))
      v16 = a4;
    else
      v16 = 0;
    self->_appearance = v16;
  }
  v17 = self->_prefetchedImageURL;
  if (v17)
    v18 = 0;
  else
    v18 = self->_lastPrefetchedFilePath == 0;
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_3;
  v21[3] = &unk_1E5446518;
  v24 = v9 != 0;
  v25 = v18;
  v22 = v17;
  v23 = self;
  v19 = v17;
  v20 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v21);

}

uint64_t __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(a1 + 48), "CGImage"), *(_QWORD *)(a1 + 40));
}

uint64_t __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

void __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_3(uint64_t a1)
{
  int v2;
  id v3;
  id v4;

  if (!*(_BYTE *)(a1 + 48)
    || *(_BYTE *)(a1 + 49)
    || (objc_msgSend(*(id *)(a1 + 32), "absoluteString"),
        v3 = (id)objc_claimAutoreleasedReturnValue(),
        v2 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40)),
        v3,
        v2))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("StartPageBackgroundImageDidChangeNotification"), *(_QWORD *)(a1 + 40));

  }
}

- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5
{
  -[WBSStartPageBackgroundManager processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:](self, "processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", a3, a4, a5, 0);
}

- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__WBSStartPageBackgroundManager_processImageForIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke;
  v15[3] = &unk_1E5446540;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(internalQueue, v15);

}

_QWORD *__108__WBSStartPageBackgroundManager_processImageForIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[3])
    return (_QWORD *)objc_msgSend(result, "_processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_saveImage:(id)a3 appearance:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *imageReadWriteQueue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  double v26;
  BOOL v27;
  BOOL v28;

  v15 = a3;
  v16 = a6;
  v17 = a9;
  imageReadWriteQueue = self->_imageReadWriteQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke;
  v22[3] = &unk_1E5446568;
  v22[4] = self;
  v23 = v16;
  v27 = a8;
  v26 = a5;
  v28 = a7;
  v24 = v15;
  v25 = v17;
  v19 = v17;
  v20 = v15;
  v21 = v16;
  dispatch_async(imageReadWriteQueue, v22);

}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  int v11;
  id v12;
  CGImageMetadata *Mutable;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  CGImageMetadataTag *v23;
  void *v24;
  uint64_t v25;
  CGImageMetadataTag *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  CGImageMetadataTag *v40;
  void *v41;
  __CFString *v42;
  CGImageDestination *v43;
  const __CFDictionary *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  CGImage *image;
  __CFString *v53;
  const __CFURL *url;
  id v55;
  void *v56;
  id v57;
  _QWORD block[5];
  const __CFURL *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v3, "_setHasProfileSpecificBackgroundImage:forIdentifier:", 1, v4);
    else
      objc_msgSend(v3, "_setHasTabGroupSpecificBackgroundImage:forIdentifier:", 1, v4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_startPageBackgroundImageFileURLForIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v6;
  }
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v56, "safari_ensureDirectoryExists:", v7);

  if (*(_QWORD *)(a1 + 48))
  {
    v51 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    image = (CGImage *)objc_msgSend(*(id *)(a1 + 48), "CGImage");
    v60 = *MEMORY[0x1E0CBC768];
    v61[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(double *)(a1 + 64);
    v11 = *(unsigned __int8 *)(a1 + 73);
    url = (const __CFURL *)v2;
    v12 = v51;
    v55 = v9;
    Mutable = CGImageMetadataCreateMutable();
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/safari"), CFSTR("safari"), 0))
    {
      v14 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v22 = CFSTR("True");
    if (!v11)
      v22 = CFSTR("False");
    v53 = v22;
    v23 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/safari"), CFSTR("safari"), CFSTR("startPageBackgroundTile"), kCGImageMetadataTypeString, v53);
    CGImageMetadataSetTagWithPath(Mutable, 0, CFSTR("safari:startPageBackgroundTile"), v23);
    CFRelease(v23);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CBC7E0];
    v26 = CGImageMetadataTagCreate((CFStringRef)*MEMORY[0x1E0CBC7D0], (CFStringRef)*MEMORY[0x1E0CBC7E0], CFSTR("luminance"), kCGImageMetadataTypeString, v24);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v25, *MEMORY[0x1E0CBCCB0]);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CGImageMetadataSetTagWithPath(Mutable, 0, v27, v26);
    CFRelease(v26);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E547C258);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByDeletingPathExtension");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "containsObject:", v30))
    {
      objc_msgSend(v12, "URLByDeletingPathExtension");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = CFSTR("custom");
    }

    +[WBSBackgroundImageAssetController mobileAssetBackgroundImageNamesOnDisk](WBSBackgroundImageAssetController, "mobileAssetBackgroundImageNamesOnDisk");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "containsObject:", v37);

    if (v38)
    {
      objc_msgSend(v12, "lastPathComponent");
      v39 = objc_claimAutoreleasedReturnValue();

      v32 = (__CFString *)v39;
    }
    v40 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/safari"), CFSTR("safari"), CFSTR("fileName"), kCGImageMetadataTypeString, v32);
    CGImageMetadataSetTagWithPath(Mutable, 0, CFSTR("safari:fileName"), v40);
    CFRelease(v40);
    v41 = (void *)objc_msgSend(v55, "mutableCopy");
    objc_msgSend(v41, "setObject:forKeyedSubscript:", Mutable, *MEMORY[0x1E0CBC798]);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC790]);
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v43 = CGImageDestinationCreateWithURL(url, v42, 1uLL, 0);

    if (v43)
    {
      v44 = (const __CFDictionary *)objc_msgSend(v41, "copy");
      CGImageDestinationAddImageAndMetadata(v43, image, Mutable, v44);

      v45 = CGImageDestinationFinalize(v43);
      CFRelease(v43);
      if (Mutable)
        CFRelease(Mutable);

      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByDeletingPathExtension");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "lastPathComponent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKey:", v48, *MEMORY[0x1E0D8A438]);

        objc_msgSend(v46, "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *MEMORY[0x1E0D8A430]);
        objc_msgSend(*(id *)(a1 + 32), "_setExtendedAttributesOnBackgroundImage");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_2;
        block[3] = &unk_1E54413C0;
        block[4] = *(_QWORD *)(a1 + 32);
        v59 = url;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        goto LABEL_32;
      }
    }
    else
    {
      if (Mutable)
        CFRelease(Mutable);

    }
    v49 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_2((uint64_t)url, v49);
  }
  else
  {
    v57 = 0;
    v33 = objc_msgSend(v56, "removeItemAtURL:error:", v2, &v57);
    v12 = v57;
    if ((v33 & 1) == 0)
    {
      v34 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_1();
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "removeObjectForKey:", *MEMORY[0x1E0D8A430]);

  }
LABEL_32:

  v50 = *(_QWORD *)(a1 + 56);
  if (v50)
    (*(void (**)(void))(v50 + 16))();

}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("StartPageBackgroundImageDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_updateThumbnailIfNeeded
{
  int v3;
  void *v4;
  void *v5;
  const __CFURL *v6;
  CGImageSource *v7;
  WBSCGImage *v8;
  WBSCGImage *prefetchedImageThumbnail;
  id v10;
  id v11;

  if (!self->_prefetchedImageThumbnail)
  {
    -[NSURL absoluteString](self->_prefetchedImageURL, "absoluteString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v10, "hasPrefix:", CFSTR("file:///System/Library/Desktop%20Pictures/"));

    if (v3)
    {
      -[NSURL lastPathComponent](self->_prefetchedImageURL, "lastPathComponent");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByDeletingLastPathComponent](self->_prefetchedImageURL, "URLByDeletingLastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR(".thumbnails"), 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v11, 0);
      v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v7 = CGImageSourceCreateWithURL(v6, 0);
      objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v7, 0, 0));
      v8 = (WBSCGImage *)objc_claimAutoreleasedReturnValue();
      prefetchedImageThumbnail = self->_prefetchedImageThumbnail;
      self->_prefetchedImageThumbnail = v8;

      CFRelease(v7);
    }
  }
}

- (void)commitPrefetchedImageWithLuminance:(double)a3 forIdentifier:(id)a4 isGeneratedImage:(BOOL)a5 withinProfile:(BOOL)a6
{
  id v10;
  NSObject *internalQueue;
  id v12;
  _QWORD v13[5];
  id v14;
  double v15;
  BOOL v16;
  BOOL v17;

  v10 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__WBSStartPageBackgroundManager_commitPrefetchedImageWithLuminance_forIdentifier_isGeneratedImage_withinProfile___block_invoke;
  v13[3] = &unk_1E5446590;
  v15 = a3;
  v13[4] = self;
  v14 = v10;
  v16 = a5;
  v17 = a6;
  v12 = v10;
  dispatch_async(internalQueue, v13);

}

uint64_t __113__WBSStartPageBackgroundManager_commitPrefetchedImageWithLuminance_forIdentifier_isGeneratedImage_withinProfile___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)(result + 32);
  v2 = v1[3];
  if (v2)
    return objc_msgSend(v1, "_commitImage:appearanceName:luminance:forIdentifier:isGeneratedImage:withinProfile:completionHandler:", v2, appearanceNameForLuminance(*(double *)(result + 48)), *(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 56), *(unsigned __int8 *)(result + 57), 0, *(double *)(result + 48));
  return result;
}

- (void)_commitImage:(id)a3 appearanceName:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  _QWORD block[5];
  id v27;
  double v28;

  v10 = a8;
  v11 = a7;
  v16 = a3;
  v17 = a6;
  v18 = a9;
  v19 = MEMORY[0x1E0C809B0];
  if (v17 && objc_msgSend(v16, "CGImage"))
  {
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke;
    block[3] = &unk_1E5445EC0;
    block[4] = self;
    v27 = v17;
    v28 = a5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  -[WBSStartPageBackgroundManager _clearPrefetchedImage](self, "_clearPrefetchedImage");
  -[WBSStartPageBackgroundManager _setImage:withAppearance:forIdentifier:](self, "_setImage:withAppearance:forIdentifier:", v16, a4, v17);
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_2;
  v22[3] = &unk_1E54465B8;
  v20 = v17;
  v23 = v20;
  v25 = v10;
  v21 = v18;
  v24 = v21;
  -[WBSStartPageBackgroundManager _saveImage:appearance:luminance:forIdentifier:isGeneratedImage:withinProfile:completion:](self, "_saveImage:appearance:luminance:forIdentifier:isGeneratedImage:withinProfile:completion:", v16, a4, v20, v11, v10, v22, a5);

}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:");

}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_3;
  block[3] = &unk_1E54465B8;
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("BackgroundImageIdentifier"));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ProfileBackgroundImageIsDefined"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("StartPageBackgroundImageNeedsCloudKitUpdateNotification"), 0, v3);

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)_processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[WBSStartPageBackgroundManager _updateThumbnailIfNeeded](self, "_updateThumbnailIfNeeded");
  v14 = 0.0;
  v15 = 0;
  -[WBSStartPageBackgroundManager analyzeImageAndThresholdIfNecessary:thumbnail:precomputedLuminance:getAppearance:luminance:](self, "analyzeImageAndThresholdIfNecessary:thumbnail:precomputedLuminance:getAppearance:luminance:", -[WBSCGImage CGImage](self->_prefetchedImage, "CGImage"), -[WBSCGImage CGImage](self->_prefetchedImageThumbnail, "CGImage"), &v15, &v14, self->_prefetchedImageLuminance);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSStartPageBackgroundManager assignImage:oldImage:](self, "assignImage:oldImage:", v12, self->_prefetchedImage);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSStartPageBackgroundManager _commitImage:appearanceName:luminance:forIdentifier:isGeneratedImage:withinProfile:completionHandler:](self, "_commitImage:appearanceName:luminance:forIdentifier:isGeneratedImage:withinProfile:completionHandler:", v13, v15, v10, v8, v7, v11, v14);
}

- (void)cacheImageFromURL:(id)a3 completion:(id)a4
{
  -[WBSStartPageBackgroundManager _prefetchImage:luminance:completion:withNanoSecondDelay:](self, "_prefetchImage:luminance:completion:withNanoSecondDelay:", a3, a4, 0, 0.0);
}

- (void)_clearPrefetchedImage
{
  WBSCGImage *prefetchedImage;
  WBSCGImage *prefetchedImageThumbnail;

  prefetchedImage = self->_prefetchedImage;
  self->_prefetchedImage = 0;

  prefetchedImageThumbnail = self->_prefetchedImageThumbnail;
  self->_prefetchedImageThumbnail = 0;

  self->_prefetchedImageLuminance = 0.0;
}

- (void)clearPrefetchedImage
{
  NSString *lastPrefetchedFilePath;
  NSObject *internalQueue;
  _QWORD block[5];

  lastPrefetchedFilePath = self->_lastPrefetchedFilePath;
  self->_lastPrefetchedFilePath = 0;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSStartPageBackgroundManager_clearPrefetchedImage__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __53__WBSStartPageBackgroundManager_clearPrefetchedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearPrefetchedImage");
}

- (void)clearImage
{
  NSObject *internalQueue;
  _QWORD block[5];

  -[WBSStartPageBackgroundManager clearPrefetchedImage](self, "clearPrefetchedImage");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WBSStartPageBackgroundManager_clearImage__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __43__WBSStartPageBackgroundManager_clearImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", &stru_1E5449658, 0, 0, 0);
}

- (void)clearImageWithIdentifier:(id)a3 withinProfile:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[WBSStartPageBackgroundManager _deleteImageWithIdentifier:](self, "_deleteImageWithIdentifier:", v6);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSStartPageBackgroundManager_clearImageWithIdentifier_withinProfile___block_invoke;
  block[3] = &unk_1E54464C8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __72__WBSStartPageBackgroundManager_clearImageWithIdentifier_withinProfile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), 0);
}

- (id)fetchImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  WBSCGImage *v9;
  WBSCGImage *v10;

  v4 = a3;
  v5 = v4;
  if (self->_prefetchedImage
    && (objc_msgSend(v4, "absoluteString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSURL absoluteString](self->_prefetchedImageURL, "absoluteString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToString:", v7),
        v7,
        v6,
        v8))
  {
    v9 = self->_prefetchedImage;
  }
  else
  {
    -[WBSStartPageBackgroundManager _fetchImage:source:adjustForDarkAppearance:](self, "_fetchImage:source:adjustForDarkAppearance:", v5, 0, 0);
    v9 = (WBSCGImage *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)_fetchImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  _BOOL8 v5;
  const __CFURL *v8;
  const __CFURL *v9;
  void *v10;
  void *v11;
  int v12;
  WBSCGImage *v13;
  size_t v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;

  v5 = a5;
  v8 = (const __CFURL *)a3;
  v9 = v8;
  if (self->_prefetchedImage
    && (-[__CFURL absoluteString](v8, "absoluteString"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSURL absoluteString](self->_prefetchedImageURL, "absoluteString"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "isEqualToString:", v11),
        v11,
        v10,
        v12))
  {
    v13 = self->_prefetchedImage;
  }
  else
  {
    if (a4)
    {
      CFRetain(a4);
    }
    else
    {
      a4 = CGImageSourceCreateWithURL(v9, 0);
      if (!a4)
      {
        v13 = 0;
        goto LABEL_8;
      }
    }
    v14 = -[WBSStartPageBackgroundManager _primaryIndexForImage:source:adjustForDarkAppearance:](self, "_primaryIndexForImage:source:adjustForDarkAppearance:", v9, a4, v5);
    v15 = CGImageSourceCopyPropertiesAtIndex(a4, v14, 0);
    objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(a4, v14, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(a4);
    -[WBSStartPageBackgroundManager normalizeImage:properties:](self, "normalizeImage:properties:", v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSStartPageBackgroundManager assignImage:oldImage:](self, "assignImage:oldImage:", v17, self->_prefetchedImage);
    v13 = (WBSCGImage *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v13;
}

- (unint64_t)_primaryIndexForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  return 0;
}

- (id)_thumbnailForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  size_t v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = -[WBSStartPageBackgroundManager _primaryIndexForImage:source:adjustForDarkAppearance:](self, "_primaryIndexForImage:source:adjustForDarkAppearance:", v8, a4, v5);
  objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(a4, v9, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5 withNanoSecondDelay:(int64_t)a6
{
  id v10;
  void (**v11)(id, WBSCGImage *);
  void *v12;
  void *v13;
  int v14;
  NSString *v15;
  NSString *lastPrefetchedFilePath;
  void *v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  id v20;
  WBSStartPageBackgroundManager *v21;
  void (**v22)(id, WBSCGImage *);
  double v23;
  char v24;

  v10 = a3;
  v11 = (void (**)(id, WBSCGImage *))a5;
  if (self->_prefetchedImage
    && (objc_msgSend(v10, "absoluteString"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSURL absoluteString](self->_prefetchedImageURL, "absoluteString"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToString:", v13),
        v13,
        v12,
        v14))
  {
    v11[2](v11, self->_prefetchedImage);
  }
  else
  {
    objc_msgSend(v10, "absoluteString");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastPrefetchedFilePath = self->_lastPrefetchedFilePath;
    self->_lastPrefetchedFilePath = v15;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke;
    v19[3] = &unk_1E54465E0;
    v20 = v10;
    v21 = self;
    v22 = v11;
    v24 = 0;
    v23 = a4;
    v17 = (void *)MEMORY[0x1A85D45E4](v19);
    if (a6)
    {
      v18 = dispatch_time(0, a6);
      dispatch_after(v18, (dispatch_queue_t)self->_internalQueue, v17);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_internalQueue, v17);
    }

  }
}

void __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  CGImageSourceRef v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40)))
  {

    goto LABEL_6;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 24))
  {
    v4 = objc_msgSend(*(id *)(v3 + 32), "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v4 & 1) == 0)
      goto LABEL_8;
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }

LABEL_8:
  v5 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
  v6 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke_2;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = v5;
  objc_msgSend(v6, "setHandler:", v11);
  objc_msgSend(*(id *)(a1 + 40), "_fetchImage:source:adjustForDarkAppearance:", *(_QWORD *)(a1 + 32), v5, *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v7);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
    atomic_store(0, (unint64_t *)(*(_QWORD *)(a1 + 40) + 48));
    objc_msgSend(*(id *)(a1 + 40), "_thumbnailForImage:source:adjustForDarkAppearance:", *(_QWORD *)(a1 + 32), v5, *(unsigned __int8 *)(a1 + 64));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v8;

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = *(_QWORD *)(a1 + 56);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (void)prefetchImage:(id)a3 completion:(id)a4
{
  -[WBSStartPageBackgroundManager prefetchImage:luminance:completion:](self, "prefetchImage:luminance:completion:", a3, a4, 0.0);
}

- (void)prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = 1000000000;
  v12 = a3;
  v9 = a5;
  v10 = atomic_load((unint64_t *)&self->_prefetchingCoalescingDelay);
  if (v10 < 1000000000)
    v8 = atomic_load((unint64_t *)&self->_prefetchingCoalescingDelay);
  -[WBSStartPageBackgroundManager _prefetchImage:luminance:completion:withNanoSecondDelay:](self, "_prefetchImage:luminance:completion:withNanoSecondDelay:", v12, v9, v8, a4);
  v11 = 100000000;
  if (v8 > 100000000)
    v11 = v8;
  atomic_store(2 * v11, (unint64_t *)&self->_prefetchingCoalescingDelay);

}

- (WBSCGImage)image
{
  void *v3;
  WBSCGImage *image;
  WBSCGImage *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D8A628]))
    image = self->_image;
  else
    image = 0;
  v5 = image;

  return v5;
}

- (BOOL)_tabGroupShouldInheritProfileBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;

  v6 = a3;
  v7 = a4;
  if (v7
    && (objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0
    && objc_msgSend(v6, "length")
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8A2D8]) & 1) == 0)
  {
    v8 = !-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v6);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_setHasTabGroupSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x1E0D8A6A8];
  if (v4)
    objc_msgSend(v5, "safari_addStringValue:toArrayWithKey:", v8, v7);
  else
    objc_msgSend(v5, "safari_removeStringValue:fromArrayWithKey:", v8, v7);

}

- (void)_setHasProfileSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x1E0D8A548];
  if (v4)
    objc_msgSend(v5, "safari_addStringValue:toArrayWithKey:", v8, v7);
  else
    objc_msgSend(v5, "safari_removeStringValue:fromArrayWithKey:", v8, v7);

}

- (BOOL)_isGeneratedBackgroundImageInImageSource:(CGImageSource *)a3
{
  const CGImageMetadata *v3;
  const CGImageMetadata *v4;
  CGImageMetadataTag *v5;
  CGImageMetadataTag *v6;
  void *v7;
  char v8;

  if (!a3)
    return 0;
  v3 = CGImageSourceCopyMetadataAtIndex(a3, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CGImageMetadataCopyTagWithPath(v3, 0, CFSTR("safari:startPageBackgroundTile"));
  if (v5)
  {
    v6 = v5;
    v7 = (void *)CGImageMetadataTagCopyValue(v5);
    v8 = objc_msgSend(v7, "BOOLValue");
    CFRelease(v6);

  }
  else
  {
    v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)hasGlobalBackgroundImage
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  return v5;
}

- (int64_t)appearanceForImage:(id)a3
{
  return -[WBSStartPageBackgroundManager appearanceIfImageExists:](self, "appearanceIfImageExists:", a3 != 0);
}

- (int64_t)appearanceIfImageExists:(BOOL)a3
{
  if (a3)
    return self->_appearance;
  else
    return 0;
}

- (int64_t)appearanceForImageWithIdentifier:(id)a3 forProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "kind") == 1)
  {
    objc_msgSend(v8, "settingForKey:", *MEMORY[0x1E0D8A628]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D8A628]);
  }
  v11 = v10;

  if ((v11 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "length"))
    goto LABEL_15;
  if (!-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v6)|| (-[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToImage, "objectForKeyedSubscript:", v6), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (!-[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v6)|| (-[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToImage, "objectForKeyedSubscript:", v6), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToImage, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImageIdentifierToLuminance, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "doubleValue");
          v12 = (void *)appearanceNameForLuminance(v16);
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_18;
      }
LABEL_15:
      v12 = -[WBSStartPageBackgroundManager appearanceIfImageExists:](self, "appearanceIfImageExists:", self->_image != 0);
    }
  }
LABEL_18:

  return (int64_t)v12;
}

- (id)prefetchedImageThumbnailForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  WBSCGImage *v9;

  v4 = a3;
  v5 = v4;
  if (self->_lastPrefetchedFilePath
    && (!v4 || objc_msgSend(v4, "kind") != 1
      ? (objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D8A628]))
      : (objc_msgSend(v5, "settingForKey:", *MEMORY[0x1E0D8A628]),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "BOOLValue")),
        v8 = v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = self->_prefetchedImage;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)prefetchedImageNameForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WBSStartPageBackgroundManager prefetchedImageThumbnailForProfile:](self, "prefetchedImageThumbnailForProfile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSString stringByDeletingPathExtension](self->_lastPrefetchedFilePath, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D8A438]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      _WBSLocalizedString();
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  return v7;
}

- (void)_deleteImageWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_startPageBackgroundImageFileURLForIdentifier:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundImageIdentifierToImage, "setObject:forKeyedSubscript:", 0, v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundImageIdentifierToLuminance, "setObject:forKeyedSubscript:", 0, v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageURLToTileRequired, "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("BackgroundImageIdentifier"));
    if (-[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v9))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ProfileBackgroundImageIsDefined"));
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("StartPageBackgroundImageNeedsCloudKitUpdateNotification"), 0, v8);

  }
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "removedTabGroupWithUUID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v10 = v5;
    v7 = objc_msgSend(v5, "isLocal");
    v6 = v10;
    if ((v7 & 1) == 0)
    {
      v8 = objc_msgSend(v10, "isPrivateBrowsing");
      v6 = v10;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v10, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v9))
        {
          -[WBSStartPageBackgroundManager _deleteImageWithIdentifier:](self, "_deleteImageWithIdentifier:", v9);
          -[WBSStartPageBackgroundManager _setHasTabGroupSpecificBackgroundImage:forIdentifier:](self, "_setHasTabGroupSpecificBackgroundImage:forIdentifier:", 0, v9);
        }

        v6 = v10;
      }
    }
  }

}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "profileWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v7))
    {
      -[WBSStartPageBackgroundManager _deleteImageWithIdentifier:](self, "_deleteImageWithIdentifier:", v7);
      -[WBSStartPageBackgroundManager _setHasProfileSpecificBackgroundImage:forIdentifier:](self, "_setHasProfileSpecificBackgroundImage:forIdentifier:", 0, v7);
      objc_msgSend(v6, "namedProfiles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __80__WBSStartPageBackgroundManager_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke;
        v11[3] = &unk_1E5446630;
        v11[4] = self;
        -[WBSStartPageBackgroundManager getHasGeneratedBackgroundImage:forProfileWithIdentifier:completionHandler:](self, "getHasGeneratedBackgroundImage:forProfileWithIdentifier:completionHandler:", &stru_1E5449658, v7, v11);
      }
    }
  }

}

uint64_t __80__WBSStartPageBackgroundManager_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "clearImageWithIdentifier:withinProfile:", &stru_1E5449658, 0);
  return result;
}

+ (id)ciColorKernel
{
  if (+[WBSStartPageBackgroundManager ciColorKernel]::once != -1)
    dispatch_once(&+[WBSStartPageBackgroundManager ciColorKernel]::once, &__block_literal_global_84);
  return (id)+[WBSStartPageBackgroundManager ciColorKernel]::kernel;
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v1, 0, v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9[0];
  if (v2)
  {
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("safari_threshold"), v2, &v8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v8;

    v6 = (void *)+[WBSStartPageBackgroundManager ciColorKernel]::kernel;
    +[WBSStartPageBackgroundManager ciColorKernel]::kernel = v4;

    if (!v5)
    {
      v3 = 0;
      goto LABEL_10;
    }
    v7 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_2();
    }
    v3 = v5;
  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_1();
    }
  }

LABEL_10:
}

- (id)ciContext
{
  if (-[WBSStartPageBackgroundManager ciContext]::once != -1)
    dispatch_once(&-[WBSStartPageBackgroundManager ciContext]::once, &__block_literal_global_94_0);
  return (id)-[WBSStartPageBackgroundManager ciContext]::ciContext;
}

void __42__WBSStartPageBackgroundManager_ciContext__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C9DD90];
  v1 = *MEMORY[0x1E0C9DF68];
  v8[0] = MEMORY[0x1E0C9AAA0];
  v2 = *MEMORY[0x1E0C9DFC8];
  v7[0] = v1;
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0C9E070]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contextWithOptions:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[WBSStartPageBackgroundManager ciContext]::ciContext;
  -[WBSStartPageBackgroundManager ciContext]::ciContext = v5;

}

- (id)thresholdImage:(CGImage *)a3 minValue:(double)a4 maxValue:(double)a5 multiplier:(double)a6
{
  void *v11;
  size_t Width;
  size_t Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGColorSpace *DeviceRGB;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  +[WBSStartPageBackgroundManager ciColorKernel](WBSStartPageBackgroundManager, "ciColorKernel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyWithExtent:arguments:", v18, 0.0, 0.0, (double)Width, (double)Height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v21 = (void *)MEMORY[0x1E0D8A0C0];
  -[WBSStartPageBackgroundManager ciContext](self, "ciContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extent");
  objc_msgSend(v21, "imageByAdoptingCGImage:", objc_msgSend(v22, "createCGImage:fromRect:format:colorSpace:deferred:", v19, *MEMORY[0x1E0C9E070], DeviceRGB, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(DeviceRGB);
  return v23;
}

- (id)assignImage:(id)a3 oldImage:(id)a4
{
  id v5;
  id v6;
  size_t Width;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  Width = CGImageGetWidth((CGImageRef)objc_msgSend(v5, "CGImage"));
  v8 = v6;
  if (Width)
  {
    if (CGImageGetHeight((CGImageRef)objc_msgSend(v5, "CGImage")))
      v8 = v5;
    else
      v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)normalizeImage:(id)a3 properties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  CGColorSpace *DeviceRGB;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_msgSend(v7, "intValue"), v8, (_DWORD)v9 != 1))
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", objc_msgSend(v6, "CGImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageByApplyingOrientation:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v14 = (void *)MEMORY[0x1E0D8A0C0];
    -[WBSStartPageBackgroundManager ciContext](self, "ciContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extent");
    objc_msgSend(v14, "imageByAdoptingCGImage:", objc_msgSend(v15, "createCGImage:fromRect:format:colorSpace:deferred:", v12, *MEMORY[0x1E0C9E070], DeviceRGB, 0));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)analyzeImageAndThresholdIfNecessary:(CGImage *)a3 thumbnail:(CGImage *)a4 precomputedLuminance:(double)a5 getAppearance:(int64_t *)a6 luminance:(double *)a7
{
  double v9;
  CGImage *v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  WBSStartPageBackgroundManager *v17;
  CGImage *v18;
  void *v19;
  void *v20;
  float v21;
  double v22;

  if (a3)
  {
    v9 = a5;
    if (a5 == 0.0)
    {
      if (a4)
        v12 = a4;
      else
        v12 = a3;
      v9 = WBSComputeAverageLuminance(v12);
    }
    v13 = appearanceNameForLuminance(v9);
    *a6 = v13;
    if (a7)
      *a7 = v9;
    if (v13 == 1)
    {
      v14 = 0.05;
      v15 = 1.0;
      v16 = 1.0;
      v17 = self;
      v18 = a3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatForKey:", *MEMORY[0x1E0D8A638]);
      if (v21 == 0.0)
        v22 = 0.9;
      else
        v22 = v21;

      v15 = 0.7;
      v14 = 0.0;
      v17 = self;
      v18 = a3;
      v16 = v22;
    }
    -[WBSStartPageBackgroundManager thresholdImage:minValue:maxValue:multiplier:](v17, "thresholdImage:minValue:maxValue:multiplier:", v18, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    *a6 = 1;
  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURLToTileRequired, 0);
  objc_storeStrong((id *)&self->_backgroundImageIdentifierToLuminance, 0);
  objc_storeStrong((id *)&self->_backgroundImageIdentifierToImage, 0);
  objc_storeStrong((id *)&self->_prefetchedImageThumbnail, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_lastPrefetchedFilePath, 0);
  objc_storeStrong((id *)&self->_prefetchedImageURL, 0);
  objc_storeStrong((id *)&self->_prefetchedImage, 0);
  objc_storeStrong((id *)&self->_imageReadWriteQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(uint64_t)a3 forProfile:(uint64_t)a4 withColor:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Failed to generate profile specific background image", a5, a6, a7, a8, 0);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(uint64_t)a1 forProfile:(NSObject *)a2 withColor:completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 141558275;
  v3 = 1752392040;
  v4 = 2117;
  v5 = a1;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Failed to save generated profile specific background image to %{sensitive, mask.hash}@", (uint8_t *)&v2, 0x16u);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to create directory for profile specific generated background image: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to clear wallpaper %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Unable to save image to path %@", (uint8_t *)&v2, 0xCu);
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Failed to register Safari metadata namespace for profile specific generated background image", a5, a6, a7, a8, 0);
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error loading metallib %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error loading CI kernel %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

@end
