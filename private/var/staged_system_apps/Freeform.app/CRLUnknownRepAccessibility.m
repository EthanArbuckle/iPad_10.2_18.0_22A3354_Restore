@implementation CRLUnknownRepAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLUnknownRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (id)crlaxLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Unsupported Object"), 0, 0));

  return v3;
}

- (BOOL)accessibilityActivate
{
  return -[CRLUnknownRepAccessibility handleSingleTapAtPoint:inputType:](self, "handleSingleTapAtPoint:inputType:", 0, CGPointZero.x, CGPointZero.y);
}

@end
