@implementation THWTransportControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWTransportControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "thaxTag");
  if (v3 > 2)
    return 0;
  else
    return THAccessibilityLocalizedString((uint64_t)off_43C788[v3]);
}

@end
