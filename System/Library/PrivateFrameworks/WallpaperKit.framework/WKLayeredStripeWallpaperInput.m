@implementation WKLayeredStripeWallpaperInput

+ (WKLayeredStripeWallpaperInput)new
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

- (WKLayeredStripeWallpaperInput)init
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

- (WKLayeredStripeWallpaperInput)initWithBackgroundColor:(id)a3 stripeAngleDegrees:(double)a4 stripeHeightFactor:(double)a5 firstStripeOffsetScaleFactor:(double)a6
{
  id v10;
  WKLayeredStripeWallpaperInput *v11;
  uint64_t v12;
  UIColor *backgroundColor;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WKLayeredStripeWallpaperInput;
  v11 = -[WKLayeredStripeWallpaperInput init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (UIColor *)v12;

    v11->_stripeAngleDegrees = a4;
    v11->_stripeHeightFactor = a5;
    v11->_firstStripeOffsetScaleFactor = a6;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKLayeredStripeWallpaperInput backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStripeWallpaperInput stripeAngleDegrees](self, "stripeAngleDegrees");
  v7 = v6;
  -[WKLayeredStripeWallpaperInput stripeHeightFactor](self, "stripeHeightFactor");
  v9 = v8;
  -[WKLayeredStripeWallpaperInput firstStripeOffsetScaleFactor](self, "firstStripeOffsetScaleFactor");
  v11 = (void *)objc_msgSend(v4, "initWithBackgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:", v5, v7, v9, v10);

  return v11;
}

id __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_11 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_11, &__block_literal_global_4_2);
  return (id)_block_invoke_na_once_object_0_11;
}

void __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_11;
  _block_invoke_na_once_object_0_11 = v0;

}

id __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_1);
  v2 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_11_1);
  v3 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_12_3);
  v4 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_13_0);
  objc_msgSend(v0, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundColor");
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stripeAngleDegrees");
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stripeHeightFactor");
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstStripeOffsetScaleFactor");
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

- (NADescriptionBuilder)wk_descriptionBuilder
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
  v7[2] = __54__WKLayeredStripeWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __54__WKLayeredStripeWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "descriptionBuilderBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[WKLayeredStripeWallpaperInput wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  v4[2] = __56__WKLayeredStripeWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __56__WKLayeredStripeWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v9, "appendObject:withName:", v4, CFSTR("backgroundColor"));

  objc_msgSend(WeakRetained, "stripeAngleDegrees");
  v6 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", CFSTR("stripeAngleDegrees"), 8);
  objc_msgSend(WeakRetained, "stripeHeightFactor");
  v7 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", CFSTR("stripeHeightFactor"), 8);
  objc_msgSend(WeakRetained, "firstStripeOffsetScaleFactor");
  v8 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", CFSTR("firstStripeOffsetScaleFactor"), 8);

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)stripeAngleDegrees
{
  return self->_stripeAngleDegrees;
}

- (double)stripeHeightFactor
{
  return self->_stripeHeightFactor;
}

- (double)firstStripeOffsetScaleFactor
{
  return self->_firstStripeOffsetScaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
