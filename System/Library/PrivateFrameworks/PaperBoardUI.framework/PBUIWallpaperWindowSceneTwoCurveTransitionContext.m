@implementation PBUIWallpaperWindowSceneTwoCurveTransitionContext

- (BSAnimationSettings)inAnimationSettings
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3263779365);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAnimationSettings *)v3;
}

- (void)setInAnimationSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3263779365);

}

- (BSAnimationSettings)outAnimationSettings
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3263779366);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAnimationSettings *)v3;
}

- (void)setOutAnimationSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 3263779366);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3263779365)
    return CFSTR("inAnimationSettings");
  if (a3 == 3263779366)
  {
    v5 = CFSTR("outAnimationSettings");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)PBUIWallpaperWindowSceneTwoCurveTransitionContext;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
