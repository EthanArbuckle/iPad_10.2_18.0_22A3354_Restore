@implementation TSDiOSImageHUDViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDiOSImageHUDViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)showHUDForRep:(id)a3
{
  UIAccessibilityNotifications v3;
  NSString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDiOSImageHUDViewControllerAccessibility;
  -[TSDiOSImageHUDViewControllerAccessibility showHUDForRep:](&v5, "showHUDForRep:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = TSAccessibilityLocalizedString((uint64_t)CFSTR("image.mask.appeared"));
  UIAccessibilityPostNotification(v3, v4);
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDiOSImageHUDViewControllerAccessibility;
  -[TSDiOSImageHUDViewControllerAccessibility loadView](&v3, "loadView");
  objc_msgSend(-[TSDiOSImageHUDViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mSlider")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("mask.slider")));
}

@end
