@implementation WKBokehWallpaper

- (WKBokehWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColors:(id)a5 bubbleColors:(id)a6 bubbleCount:(unint64_t)a7 bubbleScale:(double)a8 parallaxMultiplier:(double)a9 thumbnailSeed:(unint64_t)a10
{
  id v18;
  id v19;
  WKBokehWallpaper *v20;
  WKBokehWallpaperInput *v21;
  WKBokehWallpaperInput *wallpaperValue;
  objc_super v24;

  v18 = a5;
  v19 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WKBokehWallpaper;
  v20 = -[WKAbstractWallpaper initWithIdentifier:name:type:representedType:backingType:](&v24, sel_initWithIdentifier_name_type_representedType_backingType_, a3, a4, 6, 6, 1);
  if (v20)
  {
    v21 = -[WKBokehWallpaperInput initWithBackgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:]([WKBokehWallpaperInput alloc], "initWithBackgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v18, v19, a7, a10, a8, a9);
    wallpaperValue = v20->__wallpaperValue;
    v20->__wallpaperValue = v21;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int64_t v20;
  void *v21;

  v21 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v20 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bubbleColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "bubbleCount");
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bubbleScale");
  v13 = v12;
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parallaxMultiplier");
  v16 = v15;
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v21, "initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v20, v4, v6, v8, v10, objc_msgSend(v17, "thumbnailSeed"), v13, v16);

  return v18;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WKBokehWallpaper;
  -[WKAbstractWallpaper propertyListRepresentation](&v25, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, CFSTR("backgroundColors"));
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bubbleColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_map:", &__block_literal_global_4_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, CFSTR("bubbleColors"));
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "bubbleCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, CFSTR("bubbleCount"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bubbleScale");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v17, CFSTR("bubbleScale"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "parallaxMultiplier");
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v20, CFSTR("parallaxMultiplier"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[WKBokehWallpaper wallpaperValue](self, "wallpaperValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "thumbnailSeed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v23, CFSTR("thumbnailSeed"));

  return v5;
}

uint64_t __46__WKBokehWallpaper_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wk_colorHexString");
}

uint64_t __46__WKBokehWallpaper_propertyListRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wk_colorHexString");
}

- (NSURL)thumbnailImageURL
{
  return 0;
}

- (UIImage)thumbnailImage
{
  void *v3;
  void *v4;

  -[WKBokehWallpaper _thumbnailImage](self, "_thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[WKBokehView thumbnailImageWithBokehInput:](WKBokehView, "thumbnailImageWithBokehInput:", self->__wallpaperValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKBokehWallpaper set_thumbnailImage:](self, "set_thumbnailImage:", v4);

  }
  return -[WKBokehWallpaper _thumbnailImage](self, "_thumbnailImage");
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__WKBokehWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __31__WKBokehWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__WKBokehWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__WKBokehWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_2 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_2, block);
  return (id)_block_invoke_na_once_object_0_2;
}

void __31__WKBokehWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__WKBokehWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __31__WKBokehWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_2;
  _block_invoke_na_once_object_0_2 = v1;

}

id __31__WKBokehWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKBokehWallpaper;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_12_1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __31__WKBokehWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
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
  v9.super_class = (Class)WKBokehWallpaper;
  -[WKAbstractWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__WKBokehWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __43__WKBokehWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnailImage, a3);
}

- (WKBokehWallpaperInput)_wallpaperValue
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
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
}

@end
