@implementation WKStillWallpaper

- (WKStillWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 thumbnailImageURL:(id)a6 fullsizeImageURL:(id)a7
{
  id v12;
  WKStillWallpaper *v13;
  uint64_t v14;
  NSURL *fullsizeImageURL;
  objc_super v17;

  v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)WKStillWallpaper;
  v13 = -[WKThumbnailWallpaper initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:](&v17, sel_initWithIdentifier_name_type_representedType_backingType_thumbnailImageURL_, a3, a4, a5, a5, 0, a6);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    fullsizeImageURL = v13->_fullsizeImageURL;
    v13->_fullsizeImageURL = (NSURL *)v14;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WKAbstractWallpaper type](self, "type");
  -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:", v5, v6, v7, v8, v9);

  return v10;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKStillWallpaper;
  -[WKThumbnailWallpaper propertyListRepresentation](&v9, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("fullSizeImageFileName"));

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WKStillWallpaper;
  if (-[WKThumbnailWallpaper copyWallpaperContentsToDestinationDirectoryURL:error:](&v17, sel_copyWallpaperContentsToDestinationDirectoryURL_error_, v6, a4))
  {
    -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v12, v15, a4);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSURL)videoAssetURL
{
  return 0;
}

- (double)stillTimeInVideo
{
  return 0.0;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__WKStillWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __31__WKStillWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__WKStillWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__WKStillWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_9 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_9, block);
  return (id)_block_invoke_na_once_object_0_9;
}

void __31__WKStillWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__WKStillWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __31__WKStillWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_9;
  _block_invoke_na_once_object_0_9 = v1;

}

id __31__WKStillWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKStillWallpaper;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_10);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __31__WKStillWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fullsizeImageURL");
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
  v9.super_class = (Class)WKStillWallpaper;
  -[WKThumbnailWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__WKStillWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __43__WKStillWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "fullsizeImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("fullsizeImageURL"));

}

- (NSURL)fullsizeImageURL
{
  return self->_fullsizeImageURL;
}

- (void)setFullsizeImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullsizeImageURL, 0);
}

@end
