@implementation THWAVTransportControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAVTransportController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THWButtonControlRepAccessibility)thaxPlayButtonRep
{
  void *v3;
  THWButtonControlRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWButtonControlRepAccessibility);
  result = (THWButtonControlRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAVTransportControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("playButtonRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSArray)thaxTransportViews
{
  id v2;
  objc_class *v3;
  NSArray *result;
  char v5;

  v2 = -[THWAVTransportControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("transportUI"));
  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("onCanvasViews")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("av.play.description"));
}

- (void)play
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWAVTransportControllerAccessibility;
  -[THWAVTransportControllerAccessibility play](&v4, "play");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_26C304;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

@end
