@implementation WKAbstractWallpaper

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

- (WKAbstractWallpaper)init
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

- (WKAbstractWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7
{
  id v13;
  WKAbstractWallpaper *v14;
  WKAbstractWallpaper *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WKAbstractWallpaper;
  v14 = -[WKAbstractWallpaper init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_identifier = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_type = a5;
    v15->_representedType = a6;
    v15->_backingType = a7;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[WKAbstractWallpaper identifier](self, "identifier");
  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:name:type:representedType:backingType:", v5, v6, -[WKAbstractWallpaper type](self, "type"), -[WKAbstractWallpaper representedType](self, "representedType"), -[WKAbstractWallpaper backingType](self, "backingType"));

  return v7;
}

- (BOOL)supportsSerialization
{
  return 0;
}

- (BOOL)supportsCopying
{
  return 0;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WKAbstractWallpaper identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, CFSTR("identifier"));

  WKStringFromWallpaperType(-[WKAbstractWallpaper type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, CFSTR("type"));

  -[WKAbstractWallpaper name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v6, CFSTR("name"));

  return v3;
}

- (NSURL)thumbnailImageURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (UIImage)thumbnailImage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

id __34__WKAbstractWallpaper_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_5 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_5, &__block_literal_global_8);
  return (id)_block_invoke_na_once_object_0_5;
}

void __34__WKAbstractWallpaper_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __34__WKAbstractWallpaper_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_5;
  _block_invoke_na_once_object_0_5 = v0;

}

id __34__WKAbstractWallpaper_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_13);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_15_0);
  v3 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_16_1);
  v4 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_17);
  v5 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_18);
  v6 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_19);
  v7 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_20);
  objc_msgSend(v0, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type");
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedType");
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backingType");
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "supportsSerialization"));
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "supportsCopying"));
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
  v7[2] = __44__WKAbstractWallpaper_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __44__WKAbstractWallpaper_wk_descriptionBuilder__block_invoke(uint64_t a1)
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

  -[WKAbstractWallpaper wk_descriptionBuilder](self, "wk_descriptionBuilder");
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
  v4[2] = __46__WKAbstractWallpaper_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __46__WKAbstractWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "identifier"), CFSTR("identifier"));
  objc_msgSend(WeakRetained, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("name"));

  WKStringFromWallpaperType(objc_msgSend(WeakRetained, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("type"));

  WKStringFromWallpaperType(objc_msgSend(WeakRetained, "representedType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("representedType"));

  WKStringFromWallpaperBackingType(objc_msgSend(WeakRetained, "backingType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("backingType"));

  WKStringFromWallpaperBackingType(objc_msgSend(WeakRetained, "supportsSerialization"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("supportsSerialization"));

}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)representedType
{
  return self->_representedType;
}

- (void)setRepresentedType:(unint64_t)a3
{
  self->_representedType = a3;
}

- (unint64_t)backingType
{
  return self->_backingType;
}

- (void)setBackingType:(unint64_t)a3
{
  self->_backingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
