@implementation GEOSearchCategory

- (CGColor)_maps_newSignificantColorForScreenScale:(double)a3
{
  void *v4;
  CGColor *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory styleAttributes](self, "styleAttributes"));
  v5 = +[MKIconManager newSignificantColorForStyleAttributes:forScale:](MKIconManager, "newSignificantColorForStyleAttributes:forScale:", v4, a3);

  return v5;
}

- (CGColor)_maps_newSignificantColorForScreenScale:(double)a3 isTouchBar:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  CGColor *v9;
  uint64_t v11;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory styleAttributes](self, "styleAttributes"));
  v7 = v6;
  if (v4)
  {
    v8 = objc_msgSend(v6, "copy");

    v11 = 0x10001003FLL;
    objc_msgSend(v8, "replaceAttributes:count:", &v11, 1);
    v7 = v8;
  }
  v9 = +[MKIconManager newSignificantColorForStyleAttributes:forScale:](MKIconManager, "newSignificantColorForStyleAttributes:forScale:", v7, a3);

  return v9;
}

@end
