@implementation WKLayeredStripeWallpaper

- (WKLayeredStripeWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColor:(id)a5 stripeAngleDegrees:(double)a6 stripeHeightFactor:(double)a7 firstStripeOffsetScaleFactor:(double)a8
{
  id v14;
  WKLayeredStripeWallpaper *v15;
  WKLayeredStripeWallpaperInput *v16;
  WKLayeredStripeWallpaperInput *wallpaperValue;
  objc_super v19;

  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredStripeWallpaper;
  v15 = -[WKAbstractWallpaper initWithIdentifier:name:type:representedType:backingType:](&v19, sel_initWithIdentifier_name_type_representedType_backingType_, a3, a4, 5, 5, 1);
  if (v15)
  {
    v16 = -[WKLayeredStripeWallpaperInput initWithBackgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:]([WKLayeredStripeWallpaperInput alloc], "initWithBackgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:", v14, a6, a7, a8);
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
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stripeAngleDegrees");
  v11 = v10;
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stripeHeightFactor");
  v14 = v13;
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstStripeOffsetScaleFactor");
  v17 = (void *)objc_msgSend(v4, "initWithIdentifier:name:backgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:", v5, v6, v8, v11, v14, v16);

  return v17;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WKLayeredStripeWallpaper;
  -[WKAbstractWallpaper propertyListRepresentation](&v19, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wk_colorHexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, CFSTR("backgroundColor"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stripeAngleDegrees");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, CFSTR("stripeAngleDegrees"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stripeHeightFactor");
  objc_msgSend(v12, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, CFSTR("stripeHeightFactor"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[WKLayeredStripeWallpaper wallpaperValue](self, "wallpaperValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstStripeOffsetScaleFactor");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v17, CFSTR("firstStripeVerticalOffsetScaleFactor"));

  return v5;
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
  v3[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __39__WKLayeredStripeWallpaper_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__WKLayeredStripeWallpaper_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0, block);
  return (id)_block_invoke_na_once_object_0;
}

void __39__WKLayeredStripeWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = v1;

}

id __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKLayeredStripeWallpaper;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__WKLayeredStripeWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
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
  v9.super_class = (Class)WKLayeredStripeWallpaper;
  -[WKAbstractWallpaper descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__WKLayeredStripeWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __51__WKLayeredStripeWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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

- (WKLayeredStripeWallpaperInput)_wallpaperValue
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
