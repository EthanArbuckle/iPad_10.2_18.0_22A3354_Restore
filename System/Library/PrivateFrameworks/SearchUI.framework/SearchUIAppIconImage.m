@implementation SearchUIAppIconImage

void __39__SearchUIAppIconImage_sizeForVariant___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sizeForVariant__sizeCache;
  sizeForVariant__sizeCache = v0;

}

+ (CGSize)sizeForVariant:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  if (sizeForVariant__onceToken != -1)
    dispatch_once(&sizeForVariant__onceToken, &__block_literal_global_19);
  v5 = (void *)sizeForVariant__sizeCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a3)
    {
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (a3 == 5)
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "iconImageInfo");
        v11 = v14;
        v10 = v15;

      }
      else
      {
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v11 = *MEMORY[0x1E0C9D820];
        if (a3 == 4)
        {
          if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isWideScreen"))
            v10 = 60.0;
          else
            v10 = 40.0;
          v11 = v10;
          goto LABEL_19;
        }
      }
      if (v11 == v8 && v10 == v9)
      {
        v17 = (void *)MEMORY[0x1E0D3A830];
        objc_msgSend(a1, "descriptorNameForVariant:", a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "imageDescriptorNamed:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "size");
        v11 = v20;
        v10 = v21;

      }
      goto LABEL_19;
    }
    v10 = 16.0;
    v11 = 16.0;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", v11, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)sizeForVariant__sizeCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v7, v23);

  }
  objc_msgSend(v7, "sizeValue");
  v25 = v24;
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

+ (unint64_t)bestVariantForSize:(CGSize)a3
{
  double width;
  unint64_t i;
  double v6;

  width = a3.width;
  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 4;
  for (i = 0; i != 7; ++i)
  {
    +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", i);
    if (width <= v6)
      break;
  }
  return i;
}

+ (id)appIconForResult:(id)a3 variant:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  SearchUIWebClipIconImage *v13;
  SearchUIWebClipIconImage *v14;

  v6 = a3;
  objc_msgSend(v6, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0DC3F68];
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "webClipWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[SearchUIWebClipIconImage initWithWebClip:variant:]([SearchUIWebClipIconImage alloc], "initWithWebClip:variant:", v12, a4);
  }
  else
  {
    objc_msgSend(v6, "applicationBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "appIconForBundleIdentifier:variant:", v12, a4);
    v13 = (SearchUIWebClipIconImage *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "appIconForBundleIdentifier:variant:contentType:", a3, a4, 0);
}

+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  SearchUICalendarIconImage *v10;

  v7 = a3;
  v8 = a5;
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v9)
    || (v10 = -[SearchUICalendarIconImage initWithCurrentDateAndVariant:]([SearchUICalendarIconImage alloc], "initWithCurrentDateAndVariant:", a4), -[SearchUIAppIconImage setBundleIdentifier:](v10, "setBundleIdentifier:", v9), !v10))
  {
    v10 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:]([SearchUIAppIconImage alloc], "initWithBundleIdentifier:variant:contentType:", v7, a4, v8);
  }

  return v10;
}

- (SearchUIAppIconImage)init
{
  return -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](self, "initWithBundleIdentifier:variant:contentType:", 0, 5, 0);
}

- (SearchUIAppIconImage)initWithBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5
{
  id v8;
  id v9;
  SearchUIAppIconImage *v10;
  SearchUIAppIconImage *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIAppIconImage;
  v10 = -[SearchUIAppIconImage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SearchUIAppIconImage setBundleIdentifier:](v10, "setBundleIdentifier:", v8);
    -[SearchUIAppIconImage setContentType:](v11, "setContentType:", v9);
    -[SearchUIAppIconImage setVariant:](v11, "setVariant:", a4);
    objc_msgSend((id)objc_opt_class(), "sizeForVariant:", a4);
    -[SearchUIAppIconImage setSize:](v11, "setSize:");
    -[SearchUIImage setSupportsFastPathShadow:](v11, "setSupportsFastPathShadow:", 1);
  }

  return v11;
}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (BOOL)shouldInvalidateAppIconForChangedBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 1;
  v4 = a3;
  -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)needsTinting
{
  void *v2;
  BOOL v3;

  -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v2);

  return v3;
}

+ (id)descriptorNameForVariant:(unint64_t)a3
{
  id v4;
  id v5;
  id *v6;
  int v7;
  int v8;
  id v9;

  v4 = (id)*MEMORY[0x1E0D3A870];
  if (a3 > 1)
  {
    if (a3 == 2)
    {
      v6 = (id *)MEMORY[0x1E0D3A890];
LABEL_10:
      v9 = *v6;

      v4 = v9;
      return v4;
    }
  }
  else
  {
    v5 = (id)*MEMORY[0x1E0D3A880];

    v4 = v5;
  }
  v7 = !+[SearchUIUtilities isWideScreen](SearchUIUtilities, "isWideScreen");
  if (a3 == 4)
    v8 = v7;
  else
    v8 = 0;
  v6 = (id *)MEMORY[0x1E0D3A888];
  if (a3 == 3 || v8)
    goto LABEL_10;
  return v4;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SearchUIAppIconImage contentType](self, "contentType", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithType:", v6);
    if (v8)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
  }
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v7);
LABEL_7:
  if (v8)
  {
    -[SearchUIAppIconImage descriptorWithScale:](self, "descriptorWithScale:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "imageForIcon:descriptor:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)descriptorWithScale:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = objc_alloc(MEMORY[0x1E0D3A830]);
  -[SearchUIImage size](self, "size");
  v5 = (void *)objc_msgSend(v4, "initWithSize:scale:");
  objc_msgSend((id)objc_opt_class(), "homeScreenService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScreenIconStyleConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "configurationType");
  if (v8 == 3)
  {
    v10 = 2;
  }
  else if (v8 == 2)
  {
    v10 = 1;
  }
  else if (v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDark");

  }
  objc_msgSend(v5, "setAppearance:", v10);
  objc_msgSend(v7, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "CGColor");

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithCGColor:", v12);
    objc_msgSend(v5, "setTintColor:", v13);

  }
  return v5;
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken != -1)
    dispatch_once(&homeScreenService_onceToken, &__block_literal_global_17);
  return (id)homeScreenService_homeScreenService;
}

void __41__SearchUIAppIconImage_homeScreenService__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)homeScreenService_homeScreenService;
  homeScreenService_homeScreenService = v0;

}

+ (id)imageForIcon:(id)a3 descriptor:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "prepareImageForDescriptor:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "CGImage");
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v30;

  v8 = a3;
  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "bundleIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
      {
        v10 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v3 = (void *)v11;
        v10 = 0;
        goto LABEL_28;
      }
    }
    objc_msgSend(v8, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "contentType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppIconImage contentType](self, "contentType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
      {
        v10 = 0;
        goto LABEL_22;
      }
LABEL_14:
      v14 = objc_msgSend(v8, "variant");
      if (v14 != -[SearchUIAppIconImage variant](self, "variant"))
        goto LABEL_21;
      objc_msgSend(v8, "size");
      v16 = v15;
      v18 = v17;
      -[SearchUIImage size](self, "size");
      if (v16 != v20)
        goto LABEL_21;
      if (v18 == v19
        && (-[SearchUIImage scale](self, "scale"), v22 = v21, objc_msgSend(v8, "scale"), v22 == v23)
        && (v24 = -[SearchUIImage cornerRoundingStyle](self, "cornerRoundingStyle"),
            v24 == objc_msgSend(v8, "cornerRoundingStyle")))
      {
        objc_msgSend(v8, "badgingImage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v8, "badgingImage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIImage badgingImage](self, "badgingImage");
          v30 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v26, "isEqual:", v27);

          v25 = v30;
        }
        else
        {
          -[SearchUIImage badgingImage](self, "badgingImage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v26 == 0;
        }

        v28 = v10;
        if (!v12)
        {
LABEL_26:
          v10 = v28;
          if (!v9)
          {
LABEL_29:

            goto LABEL_30;
          }
          goto LABEL_27;
        }
      }
      else
      {
LABEL_21:
        v10 = 0;
        v28 = 0;
        if (!v12)
          goto LABEL_26;
      }
LABEL_22:

      if (!v9)
        goto LABEL_29;
      goto LABEL_27;
    }
    -[SearchUIAppIconImage contentType](self, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_14;

    v10 = 0;
    if (v9)
      goto LABEL_27;
    v3 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SearchUIAppIconImage contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUIAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ (13 * -[SearchUIAppIconImage variant](self, "variant"));

  return v7;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
