@implementation WKLayeredStillWallpaper

- (WKLayeredStillWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundThumbnailImageURL:(id)a5 foregroundThumbnailImageURL:(id)a6 floatingThumbnailImageURL:(id)a7 backgroundFullSizeImageURL:(id)a8 foregroundFullSizeImageURL:(id)a9 floatingFullSizeImageURL:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  WKLayeredStillWallpaper *v22;
  WKLayeredStillWallpaperInput *v23;
  WKLayeredStillWallpaperInput *wallpaperValue;
  objc_super v26;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v26.receiver = self;
  v26.super_class = (Class)WKLayeredStillWallpaper;
  v22 = -[WKLayeredThumbnailWallpaper initWithIdentifier:name:type:representedType:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:](&v26, sel_initWithIdentifier_name_type_representedType_backgroundThumbnailImageURL_foregroundThumbnailImageURL_floatingThumbnailImageURL_, a3, a4, 4, 4, v16, v17, v18);
  if (v22)
  {
    v23 = -[WKLayeredStillWallpaperInput initWithBackgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:]([WKLayeredStillWallpaperInput alloc], "initWithBackgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:", v16, v17, v18, v19, v20, v21);
    wallpaperValue = v22->__wallpaperValue;
    v22->__wallpaperValue = v23;

  }
  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v17 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v16 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "backgroundThumbnailImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "foregroundThumbnailImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatingThumbnailImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundFullSizeImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foregroundFullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatingFullSizeImageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v17, "initWithIdentifier:name:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:", v16, v15, v4, v5, v6, v8, v10, v12);

  return v13;
}

- (BOOL)supportsSerialization
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
  v16.super_class = (Class)WKLayeredStillWallpaper;
  -[WKLayeredThumbnailWallpaper propertyListRepresentation](&v16, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundFullSizeImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, CFSTR("backgroundFullSizeImageFileName"));

  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foregroundFullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, CFSTR("foregroundFullSizeImageFileName"));

  -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingFullSizeImageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, CFSTR("floatingFullSizeImageFileName"));

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
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
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  id *v43;
  int v44;
  objc_super v45;

  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)WKLayeredStillWallpaper;
  v43 = a4;
  LODWORD(a4) = -[WKLayeredThumbnailWallpaper copyWallpaperContentsToDestinationDirectoryURL:error:](&v45, sel_copyWallpaperContentsToDestinationDirectoryURL_error_, v5, a4);
  if ((_DWORD)a4)
  {
    -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundFullSizeImageURL");
    v8 = objc_claimAutoreleasedReturnValue();
    v42 = (char)a4;
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "backgroundFullSizeImageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "backgroundFullSizeImageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLByAppendingPathComponent:", v14);
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v16, v43);

      v5 = v15;
      if (!v38)
      {
LABEL_12:
        LOBYTE(a4) = 0;
        goto LABEL_14;
      }
    }
    else
    {

    }
    -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "foregroundFullSizeImageURL");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "foregroundFullSizeImageURL");
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "foregroundFullSizeImageURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLByAppendingPathComponent:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v22, v26, v43);

      v5 = v21;
      if (!v39)
        goto LABEL_12;
    }
    else
    {

    }
    -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatingFullSizeImageURL");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

      LOBYTE(a4) = v42;
      goto LABEL_14;
    }
    v29 = (void *)v28;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatingFullSizeImageURL");
    v32 = v5;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLayeredStillWallpaper wallpaperValue](self, "wallpaperValue");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "floatingFullSizeImageURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastPathComponent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URLByAppendingPathComponent:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v30, "copyItemAtURL:toURL:error:", v33, v36, v43);

    v5 = v32;
    LOBYTE(a4) = v42;
    if (!v44)
      goto LABEL_12;
  }
LABEL_14:

  return (char)a4;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __38__WKLayeredStillWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__WKLayeredStillWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_10 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_10, block);
  return (id)_block_invoke_na_once_object_0_10;
}

void __38__WKLayeredStillWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __38__WKLayeredStillWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_10;
  _block_invoke_na_once_object_0_10 = v1;

}

id __38__WKLayeredStillWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___WKLayeredStillWallpaper;
  objc_msgSendSuper2(&v6, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WKLayeredStillWallpaperInput)_wallpaperValue
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
