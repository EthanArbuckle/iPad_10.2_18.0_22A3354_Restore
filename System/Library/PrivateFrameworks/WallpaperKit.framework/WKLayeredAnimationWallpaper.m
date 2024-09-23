@implementation WKLayeredAnimationWallpaper

- (WKLayeredAnimationWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundAnimationFileURL:(id)a5 foregroundAnimationFileURL:(id)a6 floatingAnimationFileURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  WKLayeredAnimationWallpaper *v15;
  WKLayeredAnimationWallpaperInput *v16;
  WKLayeredAnimationWallpaperInput *wallpaperValue;
  objc_super v19;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredAnimationWallpaper;
  v15 = -[WKAbstractWallpaper initWithIdentifier:name:type:representedType:backingType:](&v19, sel_initWithIdentifier_name_type_representedType_backingType_, a3, a4, 7, 7, 1);
  if (v15)
  {
    v16 = -[WKLayeredAnimationWallpaperInput initWithBackgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:]([WKLayeredAnimationWallpaperInput alloc], "initWithBackgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:", v12, v13, v14);
    wallpaperValue = v15->__wallpaperValue;
    v15->__wallpaperValue = v16;

  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundAnimationFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foregroundAnimationFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatingAnimationFileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithIdentifier:name:backgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:", v5, v6, v8, v10, v12);

  return v13;
}

- (BOOL)supportsSerialization
{
  return 1;
}

- (BOOL)supportsCopying
{
  return 1;
}

- (id)propertyListRepresentation
{
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKLayeredAnimationWallpaper;
  -[WKAbstractWallpaper propertyListRepresentation](&v16, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundAnimationFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, CFSTR("backgroundAnimationFileName"));

  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foregroundAnimationFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, CFSTR("foregroundAnimationFileName"));

  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingAnimationFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, CFSTR("floatingAnimationFileNameKey"));

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WKLayeredAnimationWallpaper *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;

  v6 = a3;
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundAnimationFileURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v41 = a4;
  if (v8)
  {
    v38 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "backgroundAnimationFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundAnimationFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v10, v15, a4);

    self = v13;
    if (!v16)
      goto LABEL_13;
  }
  else
  {

  }
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "foregroundAnimationFileURL");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "foregroundAnimationFileURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "foregroundAnimationFileURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v21, v25, v41);

    if (!v37)
    {
      LOBYTE(v16) = 0;
      goto LABEL_13;
    }
  }
  else
  {

  }
  -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatingAnimationFileURL");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatingAnimationFileURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredAnimationWallpaper wallpaperValue](self, "wallpaperValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatingAnimationFileURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v40, "copyItemAtURL:toURL:error:", v30, v34, v41);

  }
  else
  {
    LOBYTE(v16) = 1;
  }

LABEL_13:
  return v16;
}

- (NSURL)thumbnailImageURL
{
  return 0;
}

- (UIImage)thumbnailImage
{
  return 0;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __42__WKLayeredAnimationWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__WKLayeredAnimationWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_3 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_3, block);
  return (id)_block_invoke_na_once_object_0_3;
}

void __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_3;
  _block_invoke_na_once_object_0_3 = v1;

}

id __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKLayeredAnimationWallpaper;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_4);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wallpaperValue");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (id)descriptionBuilderBlock
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKLayeredAnimationWallpaper;
  -[WKAbstractWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__WKLayeredAnimationWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __54__WKLayeredAnimationWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "wallpaperValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", v4, CFSTR("wallpaperValue"));

}

- (WKLayeredAnimationWallpaperInput)_wallpaperValue
{
  return self->__wallpaperValue;
}

- (void)set_wallpaperValue:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperValue, 0);
}

@end
