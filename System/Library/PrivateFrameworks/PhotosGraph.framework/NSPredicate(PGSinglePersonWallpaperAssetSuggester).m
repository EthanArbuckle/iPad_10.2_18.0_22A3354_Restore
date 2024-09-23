@implementation NSPredicate(PGSinglePersonWallpaperAssetSuggester)

- (id)pg_wallpaperSuggestionReason
{
  return objc_getAssociatedObject(a1, "wallpaperSuggestionPredicateReason");
}

- (void)pg_setWallpaperSuggestionReason:()PGSinglePersonWallpaperAssetSuggester
{
  objc_setAssociatedObject(a1, "wallpaperSuggestionPredicateReason", a3, (void *)0x301);
}

@end
