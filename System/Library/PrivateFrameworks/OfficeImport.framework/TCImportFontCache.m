@implementation TCImportFontCache

- (TCImportFontCache)init
{
  TCImportFontCache *v2;
  OITSUNoCopyDictionary *v3;
  OITSUNoCopyDictionary *mFontCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *mFontNameCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TCImportFontCache;
  v2 = -[TCImportFontCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mFontCache = v2->mFontCache;
    v2->mFontCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mFontNameCache = v2->mFontNameCache;
    v2->mFontNameCache = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *i;
  void *v5;
  objc_super v6;

  -[OITSUNoCopyDictionary objectEnumerator](self->mFontCache, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v5)
  {
    objc_msgSend(v3, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    CFRelease((CFTypeRef)objc_msgSend(v5, "pointerValue"));
  }

  v6.receiver = self;
  v6.super_class = (Class)TCImportFontCache;
  -[TCImportFontCache dealloc](&v6, sel_dealloc);
}

- (__CTFont)ctFontRefForKey:(id)a3
{
  void *v3;
  void *v4;
  __CTFont *v5;

  -[OITSUNoCopyDictionary objectForKey:](self->mFontCache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (__CTFont *)objc_msgSend(v3, "pointerValue");
  else
    v5 = 0;

  return v5;
}

- (__CTFont)fontRefForFontName:(id)a3 size:(int)a4
{
  uint64_t v4;
  __CFString *v6;
  id v7;
  __CTFont *v8;
  OITSUNoCopyDictionary *mFontCache;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = (__CFString *)a3;
  if (v6)
  {
    v7 = +[TCImportFontCacheKey createFontCacheKeyForName:size:](TCImportFontCacheKey, "createFontCacheKeyForName:size:", v6, v4);
    if (v7)
    {
      v8 = -[TCImportFontCache ctFontRefForKey:](self, "ctFontRefForKey:", v7);
      if (!v8)
      {
        v8 = CTFontCreateWithNameAndOptions(v6, (double)(int)v4, 0, 1uLL);
        if (v8)
        {
          mFontCache = self->mFontCache;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[OITSUNoCopyDictionary setObject:forUncopiedKey:](mFontCache, "setObject:forUncopiedKey:", v10, v7);

        }
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (CGSize)stringSizeForText:(id)a3 ctFontRef:(__CTFont *)a4
{
  id v5;
  CGFloat height;
  double AdvancesForGlyphs;
  uint64_t v8;
  CFIndex v9;
  CGGlyph *v10;
  UniChar *v11;
  double v12;
  double v13;
  CGSize result;
  CGRect BoundingRectsForGlyphs;

  v5 = a3;
  AdvancesForGlyphs = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = objc_msgSend(v5, "length");
  if (v5)
  {
    if (a4)
    {
      v9 = v8;
      if (v8)
      {
        v10 = (CGGlyph *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
        v11 = (UniChar *)malloc_type_malloc(2 * v9 + 2, 0x1000040BDFB0063uLL);
        objc_msgSend(v5, "getCharacters:range:", v11, 0, v9);
        CTFontGetGlyphsForCharacters(a4, v11, v10, v9);
        BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(a4, kCTFontOrientationDefault, v10, 0, v9);
        height = BoundingRectsForGlyphs.size.height;
        AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(a4, kCTFontOrientationDefault, v10, 0, v9);
        free(v10);
        free(v11);
      }
    }
  }

  v12 = AdvancesForGlyphs;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)stringSizeForSpaceWithFontName:(id)a3 fontSize:(int)a4
{
  __CTFont *v4;
  double width;
  double height;
  UniChar characters;
  CGGlyph glyphs;
  CGSize advances;
  CGSize result;

  v4 = -[TCImportFontCache fontRefForFontName:size:](self, "fontRefForFontName:size:", a3, *(_QWORD *)&a4);
  glyphs = -1;
  characters = 32;
  CTFontGetGlyphsForCharacters(v4, &characters, &glyphs, 1);
  advances = (CGSize)*MEMORY[0x24BDBF148];
  CTFontGetAdvancesForGlyphs(v4, kCTFontOrientationDefault, &glyphs, &advances, 1);
  width = advances.width;
  height = advances.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)stringSizeForText:(id)a3 fontName:(id)a4 fontSize:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  +[TCImportFontCache stringSizeForText:ctFontRef:](TCImportFontCache, "stringSizeForText:ctFontRef:", v8, -[TCImportFontCache fontRefForFontName:size:](self, "fontRefForFontName:size:", v9, v5));
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSMutableDictionary)fontNameCache
{
  return self->mFontNameCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontNameCache, 0);
  objc_storeStrong((id *)&self->mFontCache, 0);
}

@end
