@implementation SBDashBoardWallpaperProvider

- (id)createCoverSheetWallpaperView
{
  return -[SBDashBoardWallpaperProvider createCoverSheetWallpaperViewWithTransformOptions:](self, "createCoverSheetWallpaperViewWithTransformOptions:", 18);
}

- (id)createCoverSheetWallpaperViewWithTransformOptions:(unint64_t)a3
{
  SBDashBoardWallpaperEffectView *v3;

  v3 = -[SBDashBoardWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBDashBoardWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 0, a3);
  -[PBUIWallpaperEffectViewBase setStyle:](v3, "setStyle:", 0);
  -[PBUIWallpaperEffectViewBase setForcesOpaque:](v3, "setForcesOpaque:", 1);
  -[PBUIWallpaperEffectViewBase setShouldMatchWallpaperPosition:](v3, "setShouldMatchWallpaperPosition:", 0);
  return v3;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createWallpaperFloatingViewForReason:ignoreReplica:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspendWallpaperAnimationForReason:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)wallpaperClientWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientationSource:willRotateToInterfaceOrientation:duration:", 3, a3, a4);

}

- (void)wallpaperClientWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientationSource:willAnimateRotationToInterfaceOrientation:duration:", 3, a3, a4);

}

- (void)wallpaperClientDidRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orientationSource:didRotateFromInterfaceOrientation:", 3, a3);

}

@end
