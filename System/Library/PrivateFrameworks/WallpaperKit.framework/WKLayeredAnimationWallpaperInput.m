@implementation WKLayeredAnimationWallpaperInput

- (WKLayeredAnimationWallpaperInput)initWithBackgroundAnimationFileURL:(id)a3 foregroundAnimationFileURL:(id)a4 floatingAnimationFileURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  WKLayeredAnimationWallpaperInput *v11;
  uint64_t v12;
  NSURL *backgroundAnimationFileURL;
  uint64_t v14;
  NSURL *foregroundAnimationFileURL;
  uint64_t v16;
  NSURL *floatingAnimationFileURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredAnimationWallpaperInput;
  v11 = -[WKLayeredAnimationWallpaperInput init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    backgroundAnimationFileURL = v11->_backgroundAnimationFileURL;
    v11->_backgroundAnimationFileURL = (NSURL *)v12;

    v14 = objc_msgSend(v9, "copy");
    foregroundAnimationFileURL = v11->_foregroundAnimationFileURL;
    v11->_foregroundAnimationFileURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    floatingAnimationFileURL = v11->_floatingAnimationFileURL;
    v11->_floatingAnimationFileURL = (NSURL *)v16;

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
  -[WKLayeredAnimationWallpaperInput backgroundAnimationFileURL](self, "backgroundAnimationFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredAnimationWallpaperInput foregroundAnimationFileURL](self, "foregroundAnimationFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredAnimationWallpaperInput floatingAnimationFileURL](self, "floatingAnimationFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithBackgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:", v5, v6, v7);

  return v8;
}

id __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_8 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_8, &__block_literal_global_2);
  return (id)_block_invoke_na_once_object_0_8;
}

void __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_8;
  _block_invoke_na_once_object_0_8 = v0;

}

id __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_6);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_7_0);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_8_0);
  objc_msgSend(v0, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundAnimationFileURL");
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "foregroundAnimationFileURL");
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "floatingAnimationFileURL");
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
  v7[2] = __57__WKLayeredAnimationWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __57__WKLayeredAnimationWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
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

  -[WKLayeredAnimationWallpaperInput wk_descriptionBuilder](self, "wk_descriptionBuilder");
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
  v4[2] = __59__WKLayeredAnimationWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKLayeredAnimationWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundAnimationFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", v4, CFSTR("backgroundAnimationFileURL"));

  objc_msgSend(WeakRetained, "foregroundAnimationFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v10, "appendObject:withName:", v6, CFSTR("foregroundAnimationFileURL"));

  objc_msgSend(WeakRetained, "floatingAnimationFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "appendObject:withName:", v8, CFSTR("floatingAnimationFileURL"));

}

- (NSURL)backgroundAnimationFileURL
{
  return self->_backgroundAnimationFileURL;
}

- (NSURL)foregroundAnimationFileURL
{
  return self->_foregroundAnimationFileURL;
}

- (NSURL)floatingAnimationFileURL
{
  return self->_floatingAnimationFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAnimationFileURL, 0);
  objc_storeStrong((id *)&self->_foregroundAnimationFileURL, 0);
  objc_storeStrong((id *)&self->_backgroundAnimationFileURL, 0);
}

@end
