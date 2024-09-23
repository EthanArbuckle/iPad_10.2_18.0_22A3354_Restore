@implementation PGAmbientCityWallpaperSuggester

- (void)setupFilteringContexts
{
  PGAmbientCityWallpaperSuggester *v2;
  objc_class *v3;
  id v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  SEL v8;

  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (v2)
  {
    if ((-[PGAmbientCityWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) != 0)
    {

      v4 = -[PGCityscapeWallpaperSuggesterFilteringContext initForAmbient]([PGCityscapeWallpaperSuggesterFilteringContext alloc], "initForAmbient");
      -[PGCityscapeWallpaperSuggester setPrimaryFilteringContext:](v2, "setPrimaryFilteringContext:", v4);

      -[PGCityscapeWallpaperSuggester setSecondaryFilteringContext:](v2, "setSecondaryFilteringContext:", 0);
      return;
    }
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)_PFAssertFailHandler();
  +[PGAmbientCityWallpaperSuggester suggestionTypes](v7, v8);
}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 8);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 802);
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 1;
}

@end
