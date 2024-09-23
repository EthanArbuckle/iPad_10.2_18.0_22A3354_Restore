@implementation WKLayeredStillWallpaperInput

- (WKLayeredStillWallpaperInput)initWithBackgroundThumbnailImageURL:(id)a3 foregroundThumbnailImageURL:(id)a4 floatingThumbnailImageURL:(id)a5 backgroundFullSizeImageURL:(id)a6 foregroundFullSizeImageURL:(id)a7 floatingFullSizeImageURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  WKLayeredStillWallpaperInput *v17;
  uint64_t v18;
  NSURL *backgroundFullSizeImageURL;
  uint64_t v20;
  NSURL *foregroundFullSizeImageURL;
  uint64_t v22;
  NSURL *floatingFullSizeImageURL;
  objc_super v25;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WKLayeredStillWallpaperInput;
  v17 = -[WKLayeredThumbnailWallpaperInput initWithBackgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:](&v25, sel_initWithBackgroundThumbnailImageURL_foregroundThumbnailImageURL_floatingThumbnailImageURL_, a3, a4, a5);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    backgroundFullSizeImageURL = v17->_backgroundFullSizeImageURL;
    v17->_backgroundFullSizeImageURL = (NSURL *)v18;

    v20 = objc_msgSend(v15, "copy");
    foregroundFullSizeImageURL = v17->_foregroundFullSizeImageURL;
    v17->_foregroundFullSizeImageURL = (NSURL *)v20;

    v22 = objc_msgSend(v16, "copy");
    floatingFullSizeImageURL = v17->_floatingFullSizeImageURL;
    v17->_floatingFullSizeImageURL = (NSURL *)v22;

  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKLayeredThumbnailWallpaperInput backgroundThumbnailImageURL](self, "backgroundThumbnailImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredThumbnailWallpaperInput foregroundThumbnailImageURL](self, "foregroundThumbnailImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredThumbnailWallpaperInput floatingThumbnailImageURL](self, "floatingThumbnailImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaperInput backgroundFullSizeImageURL](self, "backgroundFullSizeImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaperInput foregroundFullSizeImageURL](self, "foregroundFullSizeImageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKLayeredStillWallpaperInput floatingFullSizeImageURL](self, "floatingFullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithBackgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:", v5, v6, v7, v8, v9, v10);

  return v11;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__WKLayeredStillWallpaperInput_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __43__WKLayeredStillWallpaperInput_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__WKLayeredStillWallpaperInput_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_na_once_token_0_12 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_12, block);
  return (id)_block_invoke_na_once_object_0_12;
}

void __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_na_once_object_0_12;
  _block_invoke_na_once_object_0_12 = v1;

}

id __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___WKLayeredStillWallpaperInput;
  objc_msgSendSuper2(&v9, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_13);
  v5 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_4_4);
  v6 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_5);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundFullSizeImageURL");
}

uint64_t __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "foregroundFullSizeImageURL");
}

uint64_t __43__WKLayeredStillWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "floatingFullSizeImageURL");
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
  v7[2] = __53__WKLayeredStillWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __53__WKLayeredStillWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
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

  -[WKLayeredStillWallpaperInput wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v9.super_class = (Class)WKLayeredStillWallpaperInput;
  -[WKLayeredThumbnailWallpaperInput descriptionBuilderBlock](&v9, sel_descriptionBuilderBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__WKLayeredStillWallpaperInput_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6EF95C0;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __55__WKLayeredStillWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "backgroundFullSizeImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v13, "appendObject:withName:", v5, CFSTR("backgroundFullSizeImageURL"));

  objc_msgSend(WeakRetained, "foregroundFullSizeImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v13, "appendObject:withName:", v8, CFSTR("foregroundFullSizeImageURL"));

  objc_msgSend(WeakRetained, "floatingFullSizeImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v13, "appendObject:withName:", v11, CFSTR("floatingFullSizeImageURL"));

}

- (NSURL)backgroundFullSizeImageURL
{
  return self->_backgroundFullSizeImageURL;
}

- (NSURL)foregroundFullSizeImageURL
{
  return self->_foregroundFullSizeImageURL;
}

- (NSURL)floatingFullSizeImageURL
{
  return self->_floatingFullSizeImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingFullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_foregroundFullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_backgroundFullSizeImageURL, 0);
}

@end
