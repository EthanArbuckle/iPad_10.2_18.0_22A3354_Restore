@implementation PGLandscapeWallpaperSuggesterScoringContext

- (BOOL)isEqual:(id)a3
{
  PGLandscapeWallpaperSuggesterScoringContext *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (PGLandscapeWallpaperSuggesterScoringContext *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class();
  }

  return v6;
}

@end
