@implementation PGTopPeopleWallpaperSuggester

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 602);
}

+ (BOOL)filtersForTopSuggestions
{
  return 1;
}

- (void)setupFilteringContexts
{
  int IsIPad;
  PGPeopleWallpaperSuggesterFilteringContext *v4;
  id v5;
  id v6;
  id v7;

  IsIPad = PLPhysicalDeviceIsIPad();
  v4 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v5 = -[PGPeopleWallpaperSuggesterFilteringContext initForTopPeopleInOrientation:](v4, "initForTopPeopleInOrientation:", 2);
    -[PGPeopleWallpaperSuggester setPrimaryFilteringContext:](self, "setPrimaryFilteringContext:", v5);

    v7 = -[PGPeopleWallpaperSuggesterFilteringContext initForTopPeopleInOrientation:]([PGPeopleWallpaperSuggesterFilteringContext alloc], "initForTopPeopleInOrientation:", 1);
    -[PGPeopleWallpaperSuggester setSecondaryFilteringContext:](self, "setSecondaryFilteringContext:", v7);

  }
  else
  {
    v6 = -[PGPeopleWallpaperSuggesterFilteringContext initForTopPeopleInOrientation:](v4, "initForTopPeopleInOrientation:", 1);
    -[PGPeopleWallpaperSuggester setPrimaryFilteringContext:](self, "setPrimaryFilteringContext:", v6);

    -[PGPeopleWallpaperSuggester setSecondaryFilteringContext:](self, "setSecondaryFilteringContext:", 0);
  }
}

@end
