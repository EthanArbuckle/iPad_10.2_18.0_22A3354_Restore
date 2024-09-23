@implementation WKLiveWallpaper

- (WKLiveWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 thumbnailImageURL:(id)a6 fullsizeImageURL:(id)a7 videoAssetURL:(id)a8 stillTimeInVideo:(double)a9
{
  id v16;
  WKLiveWallpaper *v17;
  uint64_t v18;
  NSURL *videoAssetURL;
  objc_super v21;

  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WKLiveWallpaper;
  v17 = -[WKStillWallpaper initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:](&v21, sel_initWithIdentifier_name_type_thumbnailImageURL_fullsizeImageURL_, a3, a4, a5, a6, a7);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    videoAssetURL = v17->_videoAssetURL;
    v17->_videoAssetURL = (NSURL *)v18;

    v17->_stillTimeInVideo = a9;
  }

  return v17;
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
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WKAbstractWallpaper type](self, "type");
  -[WKThumbnailWallpaper thumbnailImageURL](self, "thumbnailImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKStillWallpaper fullsizeImageURL](self, "fullsizeImageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLiveWallpaper videoAssetURL](self, "videoAssetURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLiveWallpaper stillTimeInVideo](self, "stillTimeInVideo");
  v11 = (void *)objc_msgSend(v4, "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:videoAssetURL:stillTimeInVideo:", v5, v6, v7, v8, v9, v10);

  return v11;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKLiveWallpaper;
  -[WKStillWallpaper propertyListRepresentation](&v11, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKLiveWallpaper videoAssetURL](self, "videoAssetURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("videoFileName"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[WKLiveWallpaper stillTimeInVideo](self, "stillTimeInVideo");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v9, CFSTR("stillTimeInVideo"));

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WKLiveWallpaper;
  if (-[WKStillWallpaper copyWallpaperContentsToDestinationDirectoryURL:error:](&v14, sel_copyWallpaperContentsToDestinationDirectoryURL_error_, v6, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLiveWallpaper videoAssetURL](self, "videoAssetURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKLiveWallpaper videoAssetURL](self, "videoAssetURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v8, v11, a4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__WKLiveWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __30__WKLiveWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __30__WKLiveWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WKLiveWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_0, block);
  return (id)_block_invoke_na_once_object_0_0;
}

void __30__WKLiveWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__WKLiveWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __30__WKLiveWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_0;
  _block_invoke_na_once_object_0_0 = v1;

}

id __30__WKLiveWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___WKLiveWallpaper;
  objc_msgSendSuper2(&v8, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_1);
  v5 = (id)objc_msgSend(v3, "appendDoubleCharacteristic:", &__block_literal_global_12);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__WKLiveWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "videoAssetURL");
}

uint64_t __30__WKLiveWallpaper_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stillTimeInVideo");
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
  v9.super_class = (Class)WKLiveWallpaper;
  -[WKStillWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__WKLiveWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __42__WKLiveWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "videoAssetURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v5, CFSTR("videoAssetURL"));

  objc_msgSend(WeakRetained, "stillTimeInVideo");
  v6 = (id)objc_msgSend(v7, "appendTimeInterval:withName:decomposeUnits:", CFSTR("stillTimeInVideo"), 1);

}

- (NSURL)videoAssetURL
{
  return self->_videoAssetURL;
}

- (void)setVideoAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void)setStillTimeInVideo:(double)a3
{
  self->_stillTimeInVideo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAssetURL, 0);
}

@end
