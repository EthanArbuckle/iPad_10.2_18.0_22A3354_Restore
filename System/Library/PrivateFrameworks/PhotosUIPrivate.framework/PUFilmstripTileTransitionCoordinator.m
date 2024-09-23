@implementation PUFilmstripTileTransitionCoordinator

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return a4;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "tileKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PUTileKindItemContentFilmStripIndicator"));

  v7 = v4;
  if (v6)
  {
    objc_msgSend(v4, "layoutInfoWithAlpha:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutInfoWithZPosition:", 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  void *v6;
  int v7;
  PUTileAnimationOptions *v8;

  objc_msgSend(a4, "tileKind", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContentFilmStripIndicator"));

  v8 = 0;
  if (a5 == 3 && v7)
  {
    v8 = objc_alloc_init(PUTileAnimationOptions);
    -[PUTileAnimationOptions setDuration:](v8, "setDuration:", 0.5);
  }
  return v8;
}

@end
