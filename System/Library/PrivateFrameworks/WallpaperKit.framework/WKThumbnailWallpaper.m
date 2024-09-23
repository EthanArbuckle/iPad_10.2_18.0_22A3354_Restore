@implementation WKThumbnailWallpaper

- (WKThumbnailWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7 thumbnailImageURL:(id)a8
{
  id v14;
  WKThumbnailWallpaper *v15;
  uint64_t v16;
  NSURL *thumbnailImageURL;
  objc_super v19;

  v14 = a8;
  v19.receiver = self;
  v19.super_class = (Class)WKThumbnailWallpaper;
  v15 = -[WKAbstractWallpaper initWithIdentifier:name:type:representedType:backingType:](&v19, sel_initWithIdentifier_name_type_representedType_backingType_, a3, a4, a5, a6, a7);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    thumbnailImageURL = v15->_thumbnailImageURL;
    v15->_thumbnailImageURL = (NSURL *)v16;

  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WKAbstractWallpaper type](self, "type");
  v8 = -[WKAbstractWallpaper representedType](self, "representedType");
  v9 = -[WKAbstractWallpaper backingType](self, "backingType");
  -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:", v5, v6, v7, v8, v9, v10);

  return v11;
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
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WKThumbnailWallpaper;
  -[WKAbstractWallpaper propertyListRepresentation](&v15, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("thumbnailImageFileName"));

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    WKStringFromWallpaperType(-[WKAbstractWallpaper representedType](self, "representedType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v13, CFSTR("representedType"));

  }
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
  char v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v8 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "copyItemAtURL:toURL:error:", v14, v9, a4);

  }
  return v12;
}

- (id)thumbnailImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WKThumbnailWallpaper _thumbnailImage](self, "_thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKThumbnailWallpaper set_thumbnailImage:](self, "set_thumbnailImage:", v7);

  }
  return -[WKThumbnailWallpaper _thumbnailImage](self, "_thumbnailImage");
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __35__WKThumbnailWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __35__WKThumbnailWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_6 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_6, block);
  return (id)_block_invoke_na_once_object_0_6;
}

void __35__WKThumbnailWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __35__WKThumbnailWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_6;
  _block_invoke_na_once_object_0_6 = v1;

}

id __35__WKThumbnailWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKThumbnailWallpaper;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_7);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __35__WKThumbnailWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "thumbnailImageURL");
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
  v9.super_class = (Class)WKThumbnailWallpaper;
  -[WKAbstractWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WKThumbnailWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __47__WKThumbnailWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "thumbnailImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("thumbnailImageURL"));

}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnailImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
}

@end
