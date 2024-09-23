@implementation SBHLibraryAdditionalItemsIndicatorIconImageView

- (SBHLibraryAdditionalItemsIndicatorIconImageView)initWithFrame:(CGRect)a3
{
  SBHLibraryAdditionalItemsIndicatorIconImageView *v3;
  SBHLibraryAdditionalItemsIndicatorIconImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIconImageView;
  v3 = -[SBFolderIconImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBFolderIconImageView setPageGridClipsToBounds:](v3, "setPageGridClipsToBounds:", 0);
  return v4;
}

- (unint64_t)concreteBackgroundStyle
{
  unint64_t result;

  result = -[SBFolderIconImageView backgroundStyle](self, "backgroundStyle");
  if (result <= 1)
    return 1;
  return result;
}

- (BOOL)hasOpaqueImage
{
  return 0;
}

- (void)setJittering:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[SBIconImageView isJittering](self, "isJittering");
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIconImageView;
  -[SBIconImageView setJittering:](&v6, sel_setJittering_, v3);
  if (v5 || !v3)
  {
    if (v5 && !v3)
      -[SBHLibraryAdditionalItemsIndicatorIconImageView _removeCustomJitter](self, "_removeCustomJitter");
  }
  else
  {
    -[SBHLibraryAdditionalItemsIndicatorIconImageView _addCustomJitter](self, "_addCustomJitter");
  }
}

+ (BOOL)hasCustomJitter
{
  objc_super v4;

  if ((objc_msgSend(a1, "allowsLayersForMiniIcons") & 1) != 0)
    return 1;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBHLibraryAdditionalItemsIndicatorIconImageView;
  return objc_msgSendSuper2(&v4, sel_hasCustomJitter);
}

+ (BOOL)allowsLayersForMiniIcons
{
  return 1;
}

- (void)_addCustomJitter
{
  id v3;

  -[SBFolderIconImageView currentPageIconLayers](self, "currentPageIconLayers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryAdditionalItemsIndicatorIconImageView _addCustomJitterToIconLayers:](self, "_addCustomJitterToIconLayers:", v3);

}

- (void)_addCustomJitterToIconLayers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        +[SBIconView _jitterXTranslationAnimationWithAmount:](SBIconView, "_jitterXTranslationAnimationWithAmount:", 0.25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("SBFolderIconImageViewJitterXTranslationAnimationKey"));

        +[SBIconView _jitterXTranslationAnimationWithAmount:](SBIconView, "_jitterXTranslationAnimationWithAmount:", 0.25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnimation:forKey:", v10, CFSTR("SBFolderIconImageViewJitterYTranslationAnimationKey"));

        BSDegreesToRadians();
        +[SBIconView _jitterRotationAnimationWithAmount:](SBIconView, "_jitterRotationAnimationWithAmount:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnimation:forKey:", v11, CFSTR("SBFolderIconImageViewJitterRotationAnimationKey"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_removeCustomJitter
{
  id v3;

  -[SBFolderIconImageView currentPageIconLayers](self, "currentPageIconLayers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryAdditionalItemsIndicatorIconImageView _removeCustomJitterFromIconLayers:](self, "_removeCustomJitterFromIconLayers:", v3);

}

- (void)_removeCustomJitterFromIconLayers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBFolderIconImageViewJitterXTranslationAnimationKey"));
        objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBFolderIconImageViewJitterYTranslationAnimationKey"));
        objc_msgSend(v8, "removeAnimationForKey:", CFSTR("SBFolderIconImageViewJitterRotationAnimationKey"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
