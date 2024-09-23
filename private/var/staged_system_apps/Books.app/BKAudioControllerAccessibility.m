@implementation BKAudioControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKAudioController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudioControllerAccessibility;
  -[BKAudioControllerAccessibility viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_volumeSlider")));
  v4 = sub_10009A13C(CFSTR("volume.slider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

}

@end
