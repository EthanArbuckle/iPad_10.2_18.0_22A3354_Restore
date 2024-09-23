@implementation SearchUIAvatarImage

- (SearchUIAvatarImage)initWithMonogramImage:(id)a3
{
  id v4;
  SearchUIAvatarImage *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIAvatarImage;
  v5 = -[SearchUIImage initWithSFImage:](&v8, sel_initWithSFImage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "monogramLetters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAvatarImage setLetters:](v5, "setLetters:", v6);

    -[SearchUIImage setSupportsFastPathShadow:](v5, "setSupportsFastPathShadow:", 1);
    -[SearchUIAvatarImage setDefaultSizeIfNecessary](v5, "setDefaultSizeIfNecessary");
  }

  return v5;
}

- (SearchUIAvatarImage)initWithContactImage:(id)a3
{
  id v4;
  SearchUIAvatarImage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIAvatarImage;
  v5 = -[SearchUIImage initWithSFImage:](&v14, sel_initWithSFImage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAvatarImage setContactIdentifiers:](v5, "setContactIdentifiers:", v6);

    objc_msgSend(v4, "contactIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIImage setSupportsFastPathShadow:](v5, "setSupportsFastPathShadow:", objc_msgSend(v7, "count") == 1);

    -[SearchUIAvatarImage setDefaultSizeIfNecessary](v5, "setDefaultSizeIfNecessary");
    objc_msgSend(v4, "appIconBadgeBundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v4, "badgingImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v4, "appIconBadgeBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBundleIdentifier:", v12);

        -[SearchUIAvatarImage setBadgingImage:](v5, "setBadgingImage:", v11);
      }
    }
  }

  return v5;
}

- (int)defaultCornerRoundingStyle
{
  void *v2;
  int v3;

  -[SearchUIAvatarImage contactIdentifiers](self, "contactIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") > 1)
    v3 = 1;
  else
    v3 = 4;

  return v3;
}

+ (id)avatarImageRenderer
{
  if (avatarImageRenderer_onceToken != -1)
    dispatch_once(&avatarImageRenderer_onceToken, &__block_literal_global_12);
  return (id)avatarImageRenderer_avatarImageRenderer;
}

void __42__SearchUIAvatarImage_avatarImageRenderer__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0C97450]);
  v1 = (void *)MEMORY[0x1E0C97458];
  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settingsWithContactStore:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithSettings:", v3);
  v5 = (void *)avatarImageRenderer_avatarImageRenderer;
  avatarImageRenderer_avatarImageRenderer = v4;

}

- (void)setDefaultSizeIfNecessary
{
  double v3;
  double v4;
  double v6;

  -[SearchUIImage size](self, "size");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSize");
    -[SearchUIAvatarImage setSize:](self, "setSize:", v6, v6);
  }
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[4];
  char v25;
  BOOL v26;
  BOOL v27;
  id location;

  v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") ^ 1;
  -[SearchUIImage size](self, "size");
  v11 = v10;
  v13 = v12;
  -[SearchUIAvatarImage letters](self, "letters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAvatarImage contactIdentifiers](self, "contactIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SearchUIAvatarImage requiresImageDataToLoad](self, "requiresImageDataToLoad");
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
  v20[3] = &unk_1EA1F6C78;
  v24[1] = v11;
  v24[2] = v13;
  v24[3] = *(id *)&a3;
  v25 = v9;
  v26 = a4;
  v17 = v14;
  v21 = v17;
  objc_copyWeak(v24, &location);
  v18 = v8;
  v23 = v18;
  v19 = v15;
  v22 = v19;
  v27 = v16;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v20);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

void __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", *(unsigned __int8 *)(a1 + 88), 0, *(unsigned __int8 *)(a1 + 89), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend((id)objc_opt_class(), "avatarImageRenderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v13[3] = &unk_1EA1F6C28;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v4, "renderMonogramForString:scope:imageHandler:", v5, v2, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setRenderingToken:", v6);

  }
  else
  {
    +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3;
    v9[3] = &unk_1EA1F6C50;
    v12 = *(_BYTE *)(a1 + 90);
    v10 = v2;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "fetchContactsForIdentifiers:completionHandler:", v8, v9);

    WeakRetained = v10;
  }

}

uint64_t __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (*(_BYTE *)(a1 + 48)
    && (unint64_t)objc_msgSend(v7, "count") <= 1
    && (objc_msgSend(v7, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "imageDataAvailable"),
        v3,
        !v4))
  {
    v6 = 0;
  }
  else
  {
    +[SearchUIAvatarImage avatarImageRenderer](SearchUIAvatarImage, "avatarImageRenderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarImageForContacts:scope:", v7, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)requiresImageDataToLoad
{
  return self->_requiresImageDataToLoad;
}

- (void)setRequiresImageDataToLoad:(BOOL)a3
{
  self->_requiresImageDataToLoad = a3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)letters
{
  return self->_letters;
}

- (void)setLetters:(id)a3
{
  objc_storeStrong((id *)&self->_letters, a3);
}

- (CNCancelable)renderingToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRenderingToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingToken, 0);
  objc_storeStrong((id *)&self->_letters, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end
