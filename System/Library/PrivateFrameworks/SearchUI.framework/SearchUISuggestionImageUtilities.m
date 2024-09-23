@implementation SearchUISuggestionImageUtilities

+ (void)initialize
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_resetSizes, *MEMORY[0x1E0DC48E8], 0);

}

+ (void)resetSizes
{
  sMaxGlyphSize = *MEMORY[0x1E0C9D820];
}

+ (CGSize)maximumSize
{
  double v2;
  double v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  CGSize result;

  v3 = *((double *)&sMaxGlyphSize + 1);
  v2 = *(double *)&sMaxGlyphSize;
  if (*(double *)&sMaxGlyphSize == *MEMORY[0x1E0C9D820]
    && *((double *)&sMaxGlyphSize + 1) == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(a1, "symbolImageForSuggestionType:", 0, sMaxGlyphSize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadImageWithScale:isDarkStyle:", 0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    if (v7 < v8)
      v7 = v8;
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", 0, v7);
    *(_QWORD *)&sMaxGlyphSize = v9;
    *((_QWORD *)&sMaxGlyphSize + 1) = v9;

    v3 = *((double *)&sMaxGlyphSize + 1);
    v2 = *(double *)&sMaxGlyphSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)imageForSuggestionCardSection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  SearchUIDefaultBrowserAppIconImage *v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(a1, "maximumSize");
  v5 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_msgSend(v4, "suggestionType");
    v9 = objc_msgSend(a1, "currentWebSuggestionIconPref");
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((_DWORD)v8 == 4 && (v9 == 3 || !v9))
    {
      v15 = v13;

      v12 = v15;
    }
    if (v12)
    {
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "isEqualToString:", v16);

      if (v17)
      {
        v18 = -[SearchUIDefaultBrowserAppIconImage initWithVariant:]([SearchUIDefaultBrowserAppIconImage alloc], "initWithVariant:", v5);
        v7 = v18;
        if ((_DWORD)v8 == 4 && v9 == 3)
          -[SearchUIDefaultBrowserAppIconImage setCornerRoundingStyle:](v18, "setCornerRoundingStyle:", 4);
        goto LABEL_14;
      }
      objc_msgSend(a1, "appIconImageForBundleIdentifier:", v12);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "symbolImageForSuggestionType:", v8);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v19;
LABEL_14:

  }
  return v7;
}

+ (id)symbolImageForSuggestionType:(int)a3
{
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v5 = objc_msgSend(a1, "currentWebSuggestionIconPref");
  if (a3 == 1)
  {
    v7 = CFSTR("person.crop.circle");
  }
  else if (a3 == 4)
  {
    v6 = CFSTR("safari");
    if (v5 == 2)
      v6 = CFSTR("safari.fill");
    v7 = v6;
  }
  else
  {
    v7 = CFSTR("magnifyingglass");
  }
  objc_msgSend(a1, "suggestionSymbolImageWithSymbolName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)currentWebSuggestionIconPref
{
  if (currentWebSuggestionIconPref_onceToken != -1)
    dispatch_once(&currentWebSuggestionIconPref_onceToken, &__block_literal_global_33);
  return currentWebSuggestionIconPref_currentWebSuggestionIconPref;
}

void __64__SearchUISuggestionImageUtilities_currentWebSuggestionIconPref__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v1, "objectForKey:", CFSTR("SPUIWebSuggestionIconKey"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  currentWebSuggestionIconPref_currentWebSuggestionIconPref = objc_msgSend(v0, "integerValue");

}

+ (id)appIconImageForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "maximumSize");
    +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v4, +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)suggestionSymbolImageWithSymbolName:(id)a3
{
  id v3;
  void *v4;
  SearchUISymbolImage *v5;

  v3 = a3;
  +[SearchUIThumbnailViewController compactSymbolFont](SearchUIThumbnailViewController, "compactSymbolFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchUISymbolImage initWithSymbolName:font:scale:]([SearchUISymbolImage alloc], "initWithSymbolName:font:scale:", v3, v4, +[SearchUIThumbnailViewController compactSymbolScale](SearchUIThumbnailViewController, "compactSymbolScale"));

  return v5;
}

@end
