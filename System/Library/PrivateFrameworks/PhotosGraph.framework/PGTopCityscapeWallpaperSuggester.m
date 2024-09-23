@implementation PGTopCityscapeWallpaperSuggester

- (void)setupFilteringContexts
{
  PGTopCityscapeWallpaperSuggester *v2;
  objc_class *v3;
  int IsIPad;
  PGCityscapeWallpaperSuggesterFilteringContext *v5;
  id v6;
  id v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;
  SEL v11;
  id v12;

  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)_PFAssertFailHandler();
    +[PGTopCityscapeWallpaperSuggester suggestionSubtypes](v10, v11);
    return;
  }
  if ((-[PGTopCityscapeWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) == 0)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  IsIPad = PLPhysicalDeviceIsIPad();
  v5 = [PGCityscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v6 = -[PGCityscapeWallpaperSuggesterFilteringContext initForTopCityscapesInOrientation:](v5, "initForTopCityscapesInOrientation:", 2);
    -[PGCityscapeWallpaperSuggester setPrimaryFilteringContext:](v2, "setPrimaryFilteringContext:", v6);

    v12 = -[PGCityscapeWallpaperSuggesterFilteringContext initForTopCityscapesInOrientation:]([PGCityscapeWallpaperSuggesterFilteringContext alloc], "initForTopCityscapesInOrientation:", 1);
    -[PGCityscapeWallpaperSuggester setSecondaryFilteringContext:](v2, "setSecondaryFilteringContext:", v12);

  }
  else
  {
    v7 = -[PGCityscapeWallpaperSuggesterFilteringContext initForTopCityscapesInOrientation:](v5, "initForTopCityscapesInOrientation:", 1);
    -[PGCityscapeWallpaperSuggester setPrimaryFilteringContext:](v2, "setPrimaryFilteringContext:", v7);

    -[PGCityscapeWallpaperSuggester setSecondaryFilteringContext:](v2, "setSecondaryFilteringContext:", 0);
  }
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 605);
}

+ (BOOL)filtersForTopSuggestions
{
  return 1;
}

@end
