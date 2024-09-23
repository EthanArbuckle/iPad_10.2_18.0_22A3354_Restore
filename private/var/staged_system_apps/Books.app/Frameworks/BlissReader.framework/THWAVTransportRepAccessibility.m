@implementation THWAVTransportRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAVTransportRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (id)thaxLayout
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layout"));
}

- (THWAVTransportControllerAccessibility)thaxTransportController
{
  void *v3;
  THWAVTransportControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWAVTransportControllerAccessibility);
  result = (THWAVTransportControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[THWAVTransportRepAccessibility thaxLayout](self, "thaxLayout"), "tsaxValueForKey:", CFSTR("transportController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
