@implementation WKLayeredThumbnailWallpaperInput

+ (WKLayeredThumbnailWallpaperInput)new
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

- (WKLayeredThumbnailWallpaperInput)init
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

- (WKLayeredThumbnailWallpaperInput)initWithBackgroundThumbnailImageURL:(id)a3 foregroundThumbnailImageURL:(id)a4 floatingThumbnailImageURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  WKLayeredThumbnailWallpaperInput *v11;
  uint64_t v12;
  NSURL *backgroundThumbnailImageURL;
  uint64_t v14;
  NSURL *foregroundThumbnailImageURL;
  uint64_t v16;
  NSURL *floatingThumbnailImageURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredThumbnailWallpaperInput;
  v11 = -[WKLayeredThumbnailWallpaperInput init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    backgroundThumbnailImageURL = v11->_backgroundThumbnailImageURL;
    v11->_backgroundThumbnailImageURL = (NSURL *)v12;

    v14 = objc_msgSend(v9, "copy");
    foregroundThumbnailImageURL = v11->_foregroundThumbnailImageURL;
    v11->_foregroundThumbnailImageURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    floatingThumbnailImageURL = v11->_floatingThumbnailImageURL;
    v11->_floatingThumbnailImageURL = (NSURL *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKLayeredThumbnailWallpaperInput backgroundThumbnailImageURL](self, "backgroundThumbnailImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredThumbnailWallpaperInput foregroundThumbnailImageURL](self, "foregroundThumbnailImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredThumbnailWallpaperInput floatingThumbnailImageURL](self, "floatingThumbnailImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithBackgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:", v5, v6, v7);

  return v8;
}

id __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_7 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_7, &__block_literal_global_4_1);
  return (id)_block_invoke_na_once_object_0_7;
}

void __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_7;
  _block_invoke_na_once_object_0_7 = v0;

}

id __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_0);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_11_0);
  objc_msgSend(v0, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundThumbnailImageURL");
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "foregroundThumbnailImageURL");
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "floatingThumbnailImageURL");
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
  v7[2] = __57__WKLayeredThumbnailWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __57__WKLayeredThumbnailWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
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

  -[WKLayeredThumbnailWallpaperInput wk_descriptionBuilder](self, "wk_descriptionBuilder");
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
  v4[2] = __59__WKLayeredThumbnailWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKLayeredThumbnailWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundThumbnailImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v13, "appendObject:withName:", v5, CFSTR("backgroundThumbnailImageURL"));

  objc_msgSend(WeakRetained, "foregroundThumbnailImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v13, "appendObject:withName:", v8, CFSTR("foregroundThumbnailImageURL"));

  objc_msgSend(WeakRetained, "floatingThumbnailImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v13, "appendObject:withName:", v11, CFSTR("floatingThumbnailImageURL"));

}

- (NSURL)backgroundThumbnailImageURL
{
  return self->_backgroundThumbnailImageURL;
}

- (NSURL)foregroundThumbnailImageURL
{
  return self->_foregroundThumbnailImageURL;
}

- (NSURL)floatingThumbnailImageURL
{
  return self->_floatingThumbnailImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingThumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_foregroundThumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_backgroundThumbnailImageURL, 0);
}

@end
