@implementation SearchUITLKImageConverter

+ (id)imagesForSFImages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "imageForSFImage:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)imageForSFImage:(id)a3
{
  id v4;
  SearchUITLKImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    +[SearchUIImageCache cachedTlkImageForSFImage:](SearchUIImageCache, "cachedTlkImageForSFImage:", v4);
    v5 = (SearchUITLKImage *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SearchUITLKImage initWithSearchUIImage:]([SearchUITLKImage alloc], "initWithSearchUIImage:", v6);
      objc_msgSend(a1, "applySeachUIImage:toTLKImage:", v6, v5);
      +[SearchUIImageCache cacheTLKImage:forSFImage:](SearchUIImageCache, "cacheTLKImage:forSFImage:", v5, v4);

    }
    objc_msgSend(v4, "badgingImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "imageForSFImage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImage setBadgeImage:](v5, "setBadgeImage:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)applySeachUIImage:(id)a3 toTLKImage:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  objc_msgSend(v8, "setSize:");
  objc_msgSend(v8, "setIsTemplate:", objc_msgSend(v6, "isTemplate"));
  objc_msgSend(v8, "setCornerRoundingStyle:", objc_msgSend(a1, "tlkCornerRoundingStyleForSFCornerRoundingStyle:", objc_msgSend(v6, "cornerRoundingStyle")));
  v7 = objc_msgSend(v6, "supportsFastPathShadow");

  objc_msgSend(v8, "setSupportsFastPathShadow:", v7);
}

+ (unint64_t)tlkCornerRoundingStyleForSFCornerRoundingStyle:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 2);
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

@end
