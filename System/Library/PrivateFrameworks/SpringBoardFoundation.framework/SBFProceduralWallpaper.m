@implementation SBFProceduralWallpaper

+ (id)identifier
{
  NSObject *v2;
  uint8_t v3[16];

  SBLogWallpaper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_18AB69000, v2, OS_LOG_TYPE_ERROR, "SBFProceduralWallpaper subclasses must implement +identifier", v3, 2u);
  }

  __assert_rtn("+[SBFProceduralWallpaper identifier]", "SBFWallpaperUtilties.m", 38, "0");
}

- (void)setAnimating:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogWallpaper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18AB69000, v3, OS_LOG_TYPE_ERROR, "SBFProceduralWallpaper subclasses must implement -setAnimating:", v4, 2u);
  }

  __assert_rtn("-[SBFProceduralWallpaper setAnimating:]", "SBFWallpaperUtilties.m", 44, "0");
}

@end
