@implementation SBHIconImageAppearanceStore

- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "sbh_iconImageAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](self, "imageForIcon:appearance:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageForIcon:(id)a3 appearance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a4;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "appearanceType") == 2)
  {
    v10 = v9;
    v11 = v10;
    if (v10)
      v12 = (void *)v10[2];
    else
      v12 = 0;
    v13 = v12;
    if (BSEqualObjects())
    {
      if (v11)
        v14 = (void *)v11[1];
      else
        v14 = 0;
      v9 = v14;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)setImage:(id)a3 forIcon:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "sbh_iconImageAppearance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](self, "setImage:forIcon:appearance:", v9, v8, v10);

}

- (void)setImage:(id)a3 forIcon:(id)a4 appearance:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "appearanceType") == 2)
    v11 = -[SBHIconImageAppearanceStoreTintedValue initWithValue:imageAppearance:]([SBHIconImageAppearanceStoreTintedValue alloc], v13, v8);
  else
    v11 = v13;
  v12 = v11;
  objc_msgSend(v10, "setObject:forKey:", v11, v9);

}

- (void)removeImageForIcon:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "sbh_iconImageAppearance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore removeImageForIcon:appearance:](self, "removeImageForIcon:appearance:", v6, v7);

}

- (void)removeImageForIcon:(id)a3 appearance:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", v8);
}

- (void)removeAllImages
{
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", &__block_literal_global_45);
}

uint64_t __46__SBHIconImageAppearanceStore_removeAllImages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)removeAllImagesForIcon:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBHIconImageAppearanceStore_removeAllImagesForIcon___block_invoke;
  v6[3] = &unk_1E8D89960;
  v7 = v4;
  v5 = v4;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v6);

}

uint64_t __54__SBHIconImageAppearanceStore_removeAllImagesForIcon___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)removeAllImagesForIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBHIconImageAppearanceStore removeAllImagesForIcon:](self, "removeAllImagesForIcon:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAllImagesForIcon:(id)a3 appearance:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "appearanceType");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBHIconImageAppearanceStore_removeAllImagesForIcon_appearance___block_invoke;
  v11[3] = &unk_1E8D89988;
  v13 = v6;
  v14 = v8;
  v12 = v7;
  v9 = v6;
  v10 = v7;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v11);

}

void __65__SBHIconImageAppearanceStore_removeAllImagesForIcon_appearance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  if (a3 != 2 && *(_QWORD *)(a1 + 48) == a3)
  {
    v10 = v5;
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
LABEL_10:
    v5 = v10;
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    v10 = v5;
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 16);
    else
      v8 = 0;
    v9 = v8;
    if (BSEqualObjects())
      objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    goto LABEL_10;
  }
LABEL_11:

}

- (void)removeAllImagesForAppearance:(id)a3
{
  id v3;

  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", a3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)removeAllImagesForAppearancesOtherThanAppearances:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke;
  v6[3] = &unk_1E8D89960;
  v7 = v4;
  v5 = v4;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v6);

}

void __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke_2;
  v9[3] = &unk_1E8D899B0;
  v12 = a3;
  v10 = *(id *)(a1 + 32);
  v11 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v6, "removeObjectsForKeys:", v8);

}

void __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    if (v5)
    {
      v7 = *((id *)v5 + 2);
      v8 = (void *)v6[1];
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    v9 = v8;

    v6 = v9;
  }
  else
  {
    +[SBHIconImageAppearance sharedInstanceForAppearanceType:](SBHIconImageAppearance, "sharedInstanceForAppearanceType:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

- (BOOL)hasAnyImagesForIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SBHIconImageAppearanceStore_hasAnyImagesForIcon___block_invoke;
  v8[3] = &unk_1E8D899D8;
  v6 = v5;
  v9 = v6;
  v10 = &v11;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __51__SBHIconImageAppearanceStore_hasAnyImagesForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)enumerateImagesForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  -[SBHIconImageAppearanceStore _cacheKeyForIcon:](self, "_cacheKeyForIcon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBHIconImageAppearanceStore_enumerateImagesForIcon_usingBlock___block_invoke;
  v10[3] = &unk_1E8D89A00;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v10);

}

void __65__SBHIconImageAppearanceStore_enumerateImagesForIcon_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id *v7;
  id *v8;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = (id *)v5;
    if (a3 == 2)
    {
      v6 = *(id *)(v5 + 16);
      v7 = (id *)v8[1];

      v8 = v7;
    }
    else
    {
      +[SBHIconImageAppearance sharedInstanceForAppearanceType:](SBHIconImageAppearance, "sharedInstanceForAppearanceType:", a3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)enumerateImagesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke;
  v6[3] = &unk_1E8D89A50;
  v7 = v4;
  v5 = v4;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v6);

}

void __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke_2;
  v6[3] = &unk_1E8D89A28;
  v8 = a3;
  v7 = *(id *)(a1 + 32);
  v9 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    if (v6)
    {
      v8 = *((id *)v6 + 2);
      v9 = (void *)v7[1];
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    v10 = v9;

    v7 = v10;
  }
  else
  {
    +[SBHIconImageAppearance sharedInstanceForAppearanceType:](SBHIconImageAppearance, "sharedInstanceForAppearanceType:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)objc_msgSend(a3, "iconImageCacheIdentifier");
}

- (id)imagesForTraitCollection:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "sbh_iconImageAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imagesForAppearance:(id)a3 createIfNecessary:(BOOL)a4
{
  return -[SBHIconImageAppearanceStore imagesForAppearanceType:createIfNecessary:](self, "imagesForAppearanceType:createIfNecessary:", objc_msgSend(a3, "appearanceType"), a4);
}

- (id)imagesForAppearanceType:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  NSMutableDictionary *lightImages;
  NSMutableDictionary **p_lightImages;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  BOOL v10;

  switch(a3)
  {
    case 0:
      p_lightImages = &self->_lightImages;
      lightImages = self->_lightImages;
      if (!lightImages)
        goto LABEL_9;
      goto LABEL_11;
    case 1:
      p_lightImages = &self->_darkImages;
      lightImages = self->_darkImages;
      if (lightImages)
        goto LABEL_11;
      goto LABEL_9;
    case 2:
      p_lightImages = &self->_tintedImages;
      lightImages = self->_tintedImages;
      if (lightImages)
        goto LABEL_11;
LABEL_9:
      if (a4)
      {
LABEL_10:
        v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = *p_lightImages;
        *p_lightImages = v7;

        lightImages = *p_lightImages;
      }
LABEL_11:
      v6 = lightImages;
      return v6;
    case 3:
      p_lightImages = &self->_tintableImages;
      lightImages = self->_tintableImages;
      if (lightImages)
        v10 = 1;
      else
        v10 = !a4;
      if (!v10)
        goto LABEL_10;
      goto LABEL_11;
    default:
      v6 = 0;
      return v6;
  }
}

- (void)enumerateImageCachesUsingBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableDictionary *lightImages;
  NSMutableDictionary *darkImages;
  NSMutableDictionary *tintedImages;
  NSMutableDictionary *tintableImages;
  char v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  v10 = 0;
  lightImages = self->_lightImages;
  if (!lightImages
    || ((*((void (**)(id, NSMutableDictionary *, _QWORD, char *))v4 + 2))(v4, lightImages, 0, &v10), !v10))
  {
    darkImages = self->_darkImages;
    if (!darkImages
      || (((void (**)(_QWORD, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, darkImages, 1, &v10), !v10))
    {
      tintedImages = self->_tintedImages;
      if (!tintedImages
        || (((void (**)(_QWORD, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, tintedImages, 2, &v10),
            !v10))
      {
        tintableImages = self->_tintableImages;
        if (tintableImages)
          ((void (**)(_QWORD, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, tintableImages, 3, &v10);
      }
    }
  }

}

+ (SBIcon)defaultIcon
{
  if (defaultIcon_onceToken != -1)
    dispatch_once(&defaultIcon_onceToken, &__block_literal_global_6_0);
  return (SBIcon *)(id)defaultIcon_defaultIcon;
}

void __42__SBHIconImageAppearanceStore_defaultIcon__block_invoke()
{
  SBIcon *v0;
  void *v1;

  v0 = objc_alloc_init(SBIcon);
  v1 = (void *)defaultIcon_defaultIcon;
  defaultIcon_defaultIcon = (uint64_t)v0;

}

- (unint64_t)numberOfCachedImages
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBHIconImageAppearanceStore_numberOfCachedImages__block_invoke;
  v4[3] = &unk_1E8D89A78;
  v4[4] = &v5;
  -[SBHIconImageAppearanceStore enumerateImageCachesUsingBlock:](self, "enumerateImageCachesUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__SBHIconImageAppearanceStore_numberOfCachedImages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfCachedImagesForAppearance:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBHIconImageAppearanceStore imagesForAppearance:createIfNecessary:](self, "imagesForAppearance:createIfNecessary:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[SBHIconImageAppearanceStore imagesForAppearanceType:createIfNecessary:](self, "imagesForAppearanceType:createIfNecessary:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBHIconImageAppearanceStore *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __57__SBHIconImageAppearanceStore_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"), CFSTR("lightImages"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count"), CFSTR("darkImages"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"), CFSTR("tintedImages"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"), CFSTR("tintableImages"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintableImages, 0);
  objc_storeStrong((id *)&self->_tintedImages, 0);
  objc_storeStrong((id *)&self->_darkImages, 0);
  objc_storeStrong((id *)&self->_lightImages, 0);
}

@end
