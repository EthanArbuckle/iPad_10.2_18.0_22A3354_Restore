@implementation TSDArrangeZOrderCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDArrangeZOrderCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSDArrangeZOrderCellAccessibility)initWithDelegate:(id)a3
{
  TSDArrangeZOrderCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDArrangeZOrderCellAccessibility;
  v4 = -[TSDArrangeZOrderCellAccessibility initWithDelegate:](&v6, "initWithDelegate:", a3);
  objc_msgSend(-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mZOrderSlider")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("move.back.to.front.slider")));
  objc_msgSend(-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMoveBackButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("move.to.back.button")));
  objc_msgSend(-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMoveFrontButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("move.to.front.button")));
  return v4;
}

@end
