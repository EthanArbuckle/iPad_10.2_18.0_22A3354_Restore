@implementation SearchUIImage

+ (SearchUIImage)imageWithSFImage:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:", sanitizeSFImage(v4));
  else
    v5 = 4;
  objc_msgSend(a1, "imageWithSFImage:variantForAppIcon:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SearchUIImage *)v6;
}

+ (SearchUIImage)imageWithSFImage:(id)a3 variantForAppIcon:(unint64_t)a4
{
  id v5;
  SearchUIAvatarImage *v6;
  SearchUIDefaultBrowserAppIconImage *v7;
  __objc2_class *v8;
  id v10;
  void *v11;
  void *v12;
  double v13;
  SearchUICalendarIconImage *v14;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (SearchUIAvatarImage *)v5;
LABEL_12:
      v7 = (SearchUIDefaultBrowserAppIconImage *)v6;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[SearchUIAvatarImage initWithMonogramImage:]([SearchUIAvatarImage alloc], "initWithMonogramImage:", v5);
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[SearchUIAvatarImage initWithContactImage:]([SearchUIAvatarImage alloc], "initWithContactImage:", v5);
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = SearchUIQuickLookThumbnailImage;
LABEL_11:
      v6 = (SearchUIAvatarImage *)objc_msgSend([v8 alloc], "initWithSFImage:", v5);
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v7 = -[SearchUILocalImage initWithSFImage:]([SearchUILocalImage alloc], "initWithSFImage:", v5)) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v5;
        if (objc_msgSend(v10, "iconType") == 1)
        {
          v7 = -[SearchUIDefaultBrowserAppIconImage initWithVariant:]([SearchUIDefaultBrowserAppIconImage alloc], "initWithVariant:", a4);
        }
        else
        {
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "contentType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUIAppIconImage appIconForBundleIdentifier:variant:contentType:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:contentType:", v11, a4, v12);
          v7 = (SearchUIDefaultBrowserAppIconImage *)objc_claimAutoreleasedReturnValue();

        }
        -[SearchUIImage setSfImage:](v7, "setSfImage:", v10);
        if (sanitizeSFImage(v10) != *MEMORY[0x1E0C9D820] || v13 != *(double *)(MEMORY[0x1E0C9D820] + 8))
          -[SearchUIDefaultBrowserAppIconImage setSize:](v7, "setSize:");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = SearchUISymbolImage;
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = SearchUIPhotosLibraryImage;
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = SearchUIMediaArtworkImage;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v6 = -[SearchUIClockImage initWithClockImage:variant:]([SearchUIClockImage alloc], "initWithClockImage:variant:", v5, a4);
              goto LABEL_12;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v8 = SearchUIShortcutsImage;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v6 = -[SearchUIDefaultPunchoutAppIconImage initWithSFImage:variant:]([SearchUIDefaultPunchoutAppIconImage alloc], "initWithSFImage:variant:", v5, a4);
                goto LABEL_12;
              }
              v8 = SearchUIImage;
            }
          }
          goto LABEL_11;
        }
        v14 = [SearchUICalendarIconImage alloc];
        objc_msgSend(v5, "date");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v7 = -[SearchUICalendarIconImage initWithDate:variant:](v14, "initWithDate:variant:", v10, a4);
      }

    }
  }
  else
  {
    v7 = 0;
  }
LABEL_13:

  return (SearchUIImage *)v7;
}

- (SearchUIImage)initWithSFImage:(id)a3
{
  id v5;
  SearchUIImage *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  v6 = -[SearchUIImage init](&v8, sel_init);
  if (v6)
  {
    sanitizeSFImage(v5);
    objc_storeStrong((id *)&v6->_sfImage, a3);
  }

  return v6;
}

- (SearchUIImage)initWithImage:(id)a3
{
  id v4;
  SearchUIImage *v5;
  SearchUIImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  v5 = -[SearchUIImage init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SearchUIImage setUiImage:](v5, "setUiImage:", v4);
    objc_msgSend(v4, "size");
    -[SearchUIImage setSize:](v6, "setSize:");
    -[SearchUIImage setIsTemplate:](v6, "setIsTemplate:", objc_msgSend(v4, "renderingMode") == 2);
  }

  return v6;
}

- (int)cornerRoundingStyle
{
  void *v3;
  int v4;
  int v5;
  unsigned int v6;
  objc_super v8;
  objc_super v9;

  -[SearchUIImage sfImage](self, "sfImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cornerRoundingStyle");
  if (!v3 || (v5 = v4) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIImage;
    if (-[SearchUIImage cornerRoundingStyle](&v9, sel_cornerRoundingStyle))
    {
      v8.receiver = self;
      v8.super_class = (Class)SearchUIImage;
      v6 = -[SearchUIImage cornerRoundingStyle](&v8, sel_cornerRoundingStyle);
    }
    else
    {
      v6 = -[SearchUIImage defaultCornerRoundingStyle](self, "defaultCornerRoundingStyle");
    }
    v5 = v6;
  }

  return v5;
}

- (int)defaultCornerRoundingStyle
{
  double v4;

  if (-[SearchUIImage shouldCropToCircle](self, "shouldCropToCircle"))
    return 4;
  -[SearchUIImage cornerRadius](self, "cornerRadius");
  if (v4 <= 6.0)
    return 2;
  else
    return 3;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, void *, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, void *, uint64_t);
  double v20;
  BOOL v21;

  v5 = a4;
  v8 = (void (**)(id, void *, uint64_t))a5;
  -[SearchUIImage uiImage](self, "uiImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v9, 1);
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setUiScale:", a3);
    objc_msgSend(v10, "setHasDarkAppearance:", v5);
    -[SearchUIImage lastLoadedContext](self, "lastLoadedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIImage sfImage](self, "sfImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v11, "uiScale");
      if (v13 != a3 || objc_msgSend(v11, "hasDarkAppearance") != v5)
        objc_msgSend(v12, "setImageData:", 0);
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v16[3] = &unk_1EA1F7A20;
    v16[4] = self;
    v20 = a3;
    v21 = v5;
    v18 = v10;
    v19 = v8;
    v17 = v12;
    v14 = v10;
    v15 = v12;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v16);

  }
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(void);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  char v24;

  objc_msgSend(*(id *)(a1 + 32), "loadImageWithScale:isDarkStyle:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_3:
    v3();
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 40);
  if (!v4)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_3;
  }
  v5 = objc_msgSend(v4, "methodForSelector:", sel_loadImageDataWithCompletionAndErrorHandler_);
  v6 = objc_msgSend(MEMORY[0x1E0D8C418], "instanceMethodForSelector:", sel_loadImageDataWithCompletionAndErrorHandler_);
  v7 = *(void **)(a1 + 40);
  if (v5 == v6)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "methodForSelector:", sel_loadImageDataWithCompletionHandler_);
    if (v9 == objc_msgSend(MEMORY[0x1E0D8C418], "instanceMethodForSelector:", sel_loadImageDataWithCompletionHandler_))
    {
      objc_msgSend(*(id *)(a1 + 32), "setLastLoadedContext:", *(_QWORD *)(a1 + 48));
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_4;
      v13[3] = &unk_1EA1F79D0;
      v11 = *(void **)(a1 + 40);
      v13[4] = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 64);
      v16 = *(_BYTE *)(a1 + 72);
      v12 = *(_QWORD *)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v11, "loadImageDataWithContext:completionHandler:", v12, v13);
      v8 = v14;
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3;
      v17[3] = &unk_1EA1F79F8;
      v10 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 64);
      v20 = *(_BYTE *)(a1 + 72);
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v10, "loadImageDataWithCompletionHandler:", v17);
      v8 = v18;
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v21[3] = &unk_1EA1F79D0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 64);
    v24 = *(_BYTE *)(a1 + 72);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v7, "loadImageDataWithCompletionAndErrorHandler:", v21);
    v8 = v22;
  }

LABEL_12:
}

uint64_t __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeImageData:scale:isDarkStyle:completionHandler:", a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeImageData:scale:isDarkStyle:completionHandler:", a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "decodeImageData:scale:isDarkStyle:completionHandler:", a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "sfImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_5;
    v5[3] = &unk_1EA1F62F0;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DBDA48], "dispatchAsync:", v5);
  }
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sfImage");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setImageData:", 0);

}

- (void)decodeImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;
  BOOL v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__SearchUIImage_decodeImageData_scale_isDarkStyle_completionHandler___block_invoke;
  v14[3] = &unk_1EA1F77A0;
  v14[4] = self;
  v15 = v10;
  v17 = a4;
  v18 = a5;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v14);

}

void __69__SearchUIImage_decodeImageData_scale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "loadImageWithImageData:scale:isDarkStyle:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  v4 = a4;
  -[SearchUIImage imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIImage loadImageWithImageData:scale:isDarkStyle:](self, "loadImageWithImageData:scale:isDarkStyle:", v7, v4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[SearchUIImage uiImage](self, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v6);
  v10 = v9;

  return v10;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)SearchUIImage;
  -[SearchUIImage size](&v13, sel_size);
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v5 = v9;
    v6 = v10;

  }
  v11 = v5;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)cornerRadius
{
  double v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  -[SearchUIImage cornerRadius](&v8, sel_cornerRadius);
  if (v3 != 0.0)
    return v3;
  -[SearchUIImage sfImage](self, "sfImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  v6 = v5;

  return v6;
}

- (BOOL)shouldCropToCircle
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIImage;
  if (-[SearchUIImage shouldCropToCircle](&v6, sel_shouldCropToCircle))
    return 1;
  -[SearchUIImage sfImage](self, "sfImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "shouldCropToCircle");

  return v3;
}

- (BOOL)isTemplate
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIImage;
  if (-[SearchUIImage isTemplate](&v6, sel_isTemplate))
    return 1;
  -[SearchUIImage sfImage](self, "sfImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isTemplate");

  return v3;
}

- (id)badgingImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  -[SearchUIImage badgingImage](&v8, sel_badgingImage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "badgingImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)scale
{
  double v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  -[SearchUIImage scale](&v8, sel_scale);
  if (v3 != 0.0)
    return v3;
  -[SearchUIImage sfImage](self, "sfImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  return v6;
}

- (id)imageData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  -[SearchUIImage imageData](&v8, sel_imageData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageData");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double result;

  -[SearchUIImage size](self, "size");
  result = v2 / v3;
  if (v3 == 0.0)
    return 0.0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SearchUIImage *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = (SearchUIImage *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    if (-[SearchUIImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      -[SearchUIImage sfImage](self, "sfImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {

      }
      else
      {
        -[SearchUIImage sfImage](v4, "sfImage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          -[SearchUIImage uiImage](self, "uiImage");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIImage uiImage](v4, "uiImage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v8, "isEqual:", v9))
          {
            v6 = 0;
            goto LABEL_10;
          }
          v12.receiver = self;
          v12.super_class = (Class)SearchUIImage;
          v10 = -[SearchUIImage isEqual:](&v12, sel_isEqual_, v4);
LABEL_9:
          v6 = v10;
LABEL_10:

          goto LABEL_11;
        }
      }
      -[SearchUIImage sfImage](self, "sfImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIImage sfImage](v4, "sfImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);
      goto LABEL_9;
    }
    v6 = 0;
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[SearchUIImage sfImage](self, "sfImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "hash");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIImage;
    v5 = -[SearchUIImage hash](&v7, sel_hash);
  }

  return (unint64_t)v5;
}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
  objc_storeStrong((id *)&self->_uiImage, a3);
}

- (SFImageContext)lastLoadedContext
{
  return (SFImageContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastLoadedContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (SFImage)sfImage
{
  return self->_sfImage;
}

- (void)setSfImage:(id)a3
{
  objc_storeStrong((id *)&self->_sfImage, a3);
}

- (BOOL)supportsFastPathShadow
{
  return self->_supportsFastPathShadow;
}

- (void)setSupportsFastPathShadow:(BOOL)a3
{
  self->_supportsFastPathShadow = a3;
}

- (BOOL)needsTinting
{
  return self->_needsTinting;
}

- (void)setNeedsTinting:(BOOL)a3
{
  self->_needsTinting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_lastLoadedContext, 0);
  objc_storeStrong((id *)&self->_uiImage, 0);
}

@end
