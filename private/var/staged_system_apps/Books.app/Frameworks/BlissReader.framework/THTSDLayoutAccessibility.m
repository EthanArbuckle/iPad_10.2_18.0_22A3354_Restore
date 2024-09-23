@implementation THTSDLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDLayout");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDLayoutAccessibility, a2);
}

- (BOOL)thaxIsExpanded
{
  unsigned int v3;

  v3 = -[THTSDLayoutAccessibility conformsToProtocol:](self, "conformsToProtocol:", NSProtocolFromString(CFSTR("THWWidgetLayout")));
  if (v3)
    LOBYTE(v3) = -[THTSDLayoutAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isExpanded"));
  return v3;
}

@end
