@implementation BKBrightnessControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKBrightnessController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKBrightnessControllerAccessibility;
  -[BKBrightnessControllerAccessibility viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBrightnessControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_slider")));
  v5 = sub_10009A13C(CFSTR("brightness.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBrightnessControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_slider")));
  objc_msgSend(v7, "imaxSetIdentification:", CFSTR("BrightnessSlider"));

}

@end
