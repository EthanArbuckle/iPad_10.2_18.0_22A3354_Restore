@implementation WBSStartPageFallbackImageManager

+ (WBSStartPageFallbackImageManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_27);
  return (WBSStartPageFallbackImageManager *)(id)sharedManager_sharedManager_0;
}

void __49__WBSStartPageFallbackImageManager_sharedManager__block_invoke()
{
  WBSStartPageFallbackImageManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSStartPageFallbackImageManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;

}

- (WBSStartPageFallbackImageManager)init
{
  WBSStartPageFallbackImageManager *v2;
  NSCache *v3;
  NSCache *identifiersToCachedImages;
  uint64_t v5;
  NSMapTable *identifiersToLiveCachedImages;
  WBSStartPageFallbackImageManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSStartPageFallbackImageManager;
  v2 = -[WBSStartPageFallbackImageManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    identifiersToCachedImages = v2->_identifiersToCachedImages;
    v2->_identifiersToCachedImages = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    identifiersToLiveCachedImages = v2->_identifiersToLiveCachedImages;
    v2->_identifiersToLiveCachedImages = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fontSize:(double)a5 fontWeight:(int64_t)a6 fontDesign:(int64_t)a7 baselineOffset:(double)a8 backgroundColor:(id)a9 cornerRadius:(double)a10 title:(id)a11 url:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = 1;
  return -[WBSStartPageFallbackImageManager displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:](self, "displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:", a3, a6, a7, a9, a11, a12, a4.width, a4.height, a4.width, a4.height, a5, a8, a10, v13);
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fallbackImageSize:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11 title:(id)a12 url:(id)a13 shouldGenerateGlyph:(BOOL)a14
{
  double height;
  double width;
  double v24;
  double v25;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _WBSStartPageFallbackIconCacheIdentifier *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v44[2];

  height = a5.height;
  width = a5.width;
  v24 = a4.height;
  v25 = a4.width;
  v44[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v28 = a10;
  v29 = a12;
  v30 = a13;
  -[WBSStartPageFallbackImageManager displayableImageForImage:withRequiredImageSize:](self, "displayableImageForImage:withRequiredImageSize:", v27, v25, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = v27;
  }
  else
  {
    +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", a7, a8, v28, width, height, a6, a9, a11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[_WBSStartPageFallbackIconCacheIdentifier initWithConfiguration:imageSize:title:url:baseImage:]([_WBSStartPageFallbackIconCacheIdentifier alloc], "initWithConfiguration:imageSize:title:url:baseImage:", v33, v29, v30, v27, width, height);
    -[NSMapTable objectForKey:](self->_identifiersToLiveCachedImages, "objectForKey:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      -[NSCache setObject:forKey:](self->_identifiersToCachedImages, "setObject:forKey:", v35, v34);
    }
    else
    {
      if (v27)
      {
        +[WBSSiteIconKeyColorExtractor keyColorForIcon:](WBSSiteIconKeyColorExtractor, "keyColorForIcon:", v27);
        v37 = objc_claimAutoreleasedReturnValue();

        v28 = (id)v37;
      }
      +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", a7, a8, v28, width, height, a6, a9, a11);
      v38 = objc_claimAutoreleasedReturnValue();

      +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:", v29, v30, v38, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36 && a14)
      {
        v39 = (void *)MEMORY[0x1E0CEA650];
        objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "configurationWithPaletteColors:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("safari"), v42);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v36)
      {
        -[NSCache setObject:forKey:](self->_identifiersToCachedImages, "setObject:forKey:", v36, v34);
        -[NSMapTable setObject:forKey:](self->_identifiersToLiveCachedImages, "setObject:forKey:", v36, v34);
      }
      v33 = (void *)v38;
    }
    v32 = v36;

  }
  return v32;
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "size");
  if (!v6)
    goto LABEL_13;
  if (v7 < width && v8 < height)
    goto LABEL_13;
  v10 = v7 >= v8 ? v8 : v7;
  if (v7 <= v8)
    v7 = v8;
  if (v10 / v7 <= 0.3)
LABEL_13:
    v11 = 0;
  else
    v11 = v6;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToLiveCachedImages, 0);
  objc_storeStrong((id *)&self->_identifiersToCachedImages, 0);
}

@end
