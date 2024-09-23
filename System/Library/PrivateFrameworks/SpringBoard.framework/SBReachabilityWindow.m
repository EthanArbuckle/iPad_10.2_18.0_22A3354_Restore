@implementation SBReachabilityWindow

- (SBReachabilityWindow)initWithWallpaperVariant:(int64_t)a3 windowScene:(id)a4
{
  id v6;
  SBReachabilityBackgroundViewController *v7;
  objc_class *v8;
  void *v9;
  SBReachabilityWindow *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = -[SBReachabilityBackgroundViewController initWithWallpaperVariant:]([SBReachabilityBackgroundViewController alloc], "initWithWallpaperVariant:", a3);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SBReachabilityWindow;
  v10 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v14, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v6, v7, 0, CFSTR("SBTraitsParticipantRoleReachability"), v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReachabilityWindow setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SBReachabilityWindow setWindowLevel:](v10, "setWindowLevel:", *MEMORY[0x1E0CEBB98] + -1.0);
    -[SBReachabilityWindow setClipsToBounds:](v10, "setClipsToBounds:", 0);
    -[SBReachabilityWindow layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisableUpdateMask:", 32);

  }
  return v10;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (id)view
{
  void *v2;
  void *v3;

  -[SBReachabilityWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  BOOL result;
  objc_super v6;

  y = a3.y;
  v6.receiver = self;
  v6.super_class = (Class)SBReachabilityWindow;
  result = -[SBReachabilityWindow pointInside:withEvent:](&v6, sel_pointInside_withEvent_, a4, a3.x);
  if (y > 0.0)
    return 0;
  return result;
}

@end
