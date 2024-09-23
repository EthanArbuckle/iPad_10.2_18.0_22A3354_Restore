@implementation WKBokehWallpaperInput

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Attempted to initialize %@ without using designated initializer."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (WKBokehWallpaperInput)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Attempted to initialize %@ without using designated initializer."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (WKBokehWallpaperInput)initWithBackgroundColors:(id)a3 bubbleColors:(id)a4 bubbleCount:(unint64_t)a5 bubbleScale:(double)a6 parallaxMultiplier:(double)a7 thumbnailSeed:(unint64_t)a8
{
  id v14;
  id v15;
  WKBokehWallpaperInput *v16;
  uint64_t v17;
  NSArray *backgroundColors;
  uint64_t v19;
  NSArray *bubbleColors;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WKBokehWallpaperInput;
  v16 = -[WKBokehWallpaperInput init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    backgroundColors = v16->_backgroundColors;
    v16->_backgroundColors = (NSArray *)v17;

    v19 = objc_msgSend(v15, "copy");
    bubbleColors = v16->_bubbleColors;
    v16->_bubbleColors = (NSArray *)v19;

    v16->_bubbleCount = a5;
    v16->_bubbleScale = a6;
    v16->_parallaxMultiplier = a7;
    v16->_thumbnailSeed = a8;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKBokehWallpaperInput backgroundColors](self, "backgroundColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKBokehWallpaperInput bubbleColors](self, "bubbleColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WKBokehWallpaperInput bubbleCount](self, "bubbleCount");
  -[WKBokehWallpaperInput bubbleScale](self, "bubbleScale");
  v9 = v8;
  -[WKBokehWallpaperInput parallaxMultiplier](self, "parallaxMultiplier");
  v11 = (void *)objc_msgSend(v4, "initWithBackgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v5, v6, v7, -[WKBokehWallpaperInput thumbnailSeed](self, "thumbnailSeed"), v9, v10);

  return v11;
}

id __36__WKBokehWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_1 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_1, &__block_literal_global_4);
  return (id)_block_invoke_na_once_object_0_1;
}

void __36__WKBokehWallpaperInput_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __36__WKBokehWallpaperInput_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_1;
  _block_invoke_na_once_object_0_1 = v0;

}

id __36__WKBokehWallpaperInput_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10);
  v3 = (id)objc_msgSend(v0, "appendUnsignedIntegerCharacteristic:", &__block_literal_global_12_0);
  v4 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_14);
  v5 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_15);
  v6 = (id)objc_msgSend(v0, "appendUnsignedIntegerCharacteristic:", &__block_literal_global_16_0);
  objc_msgSend(v0, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundColors");
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bubbleColors");
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bubbleCount");
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bubbleScale");
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parallaxMultiplier");
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "thumbnailSeed");
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

- (id)wk_descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WKBokehWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __46__WKBokehWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "descriptionBuilderBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (id)description
{
  void *v2;
  void *v3;

  -[WKBokehWallpaperInput wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilderBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WKBokehWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __48__WKBokehWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v12, "appendObject:withName:", v4, CFSTR("backgroundColors"));

  objc_msgSend(WeakRetained, "bubbleColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:", v6, CFSTR("bubbleColors"));

  v8 = (id)objc_msgSend(v12, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "bubbleCount"), CFSTR("bubbleCount"));
  objc_msgSend(WeakRetained, "bubbleScale");
  v9 = (id)objc_msgSend(v12, "appendDouble:withName:decimalPrecision:", CFSTR("bubbleScale"), 2);
  objc_msgSend(WeakRetained, "parallaxMultiplier");
  v10 = (id)objc_msgSend(v12, "appendDouble:withName:decimalPrecision:", CFSTR("parallaxMultiplier"), 2);
  v11 = (id)objc_msgSend(v12, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "thumbnailSeed"), CFSTR("thumbnailSeed"));

}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (NSArray)bubbleColors
{
  return self->_bubbleColors;
}

- (unint64_t)bubbleCount
{
  return self->_bubbleCount;
}

- (double)bubbleScale
{
  return self->_bubbleScale;
}

- (double)parallaxMultiplier
{
  return self->_parallaxMultiplier;
}

- (unint64_t)thumbnailSeed
{
  return self->_thumbnailSeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleColors, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
}

@end
